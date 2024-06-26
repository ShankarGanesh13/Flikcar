import 'dart:convert';
import 'dart:io';
import 'package:flikcar/common_widgets/snackbar.dart';
import 'package:flikcar/models/auction_car_model.dart';
import 'package:flikcar/models/bid_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';
import 'package:http/http.dart' as http;

//tomorrow use current bid price instead on updatedCarData

class AuctionService extends ChangeNotifier {
  bool live = true;
  String currentCarId = "";
  String? currentbidPrice;

  IO.Socket socket = io(
    'https://webservice.flikcar.com',
    IO.OptionBuilder().setTransports(['websocket']).build(),
  );

  List<AuctionCar> auctionCars = [];
  List<AuctionCar> myBidCars = [];
  List<AuctionCar> liveAuctionCars = [];
  List<AuctionCar> upcomingAuctionCars = [];
  List<AuctionCar> searchLiveAuctionCars = [];
  List<AuctionCar> searchUpcomingAuctionCars = [];
  List<AuctionCar> liveMyBidsCars = [];
  List<AuctionCar> yourWinnings = [];

  // getCurrentBidPrice(String currentBid) {
  //   currentbidPrice = currentBid;
  //   notifyListeners();
  // }

  changeSection({required bool isLive}) {
    live = isLive;
    notifyListeners();
  }

  filterData() {
    liveAuctionCars = [];
    upcomingAuctionCars = [];

    auctionCars.forEach((element) {
      if (DateTime.parse(element.startAuction).isBefore(DateTime.now())) {
        liveAuctionCars.add(element);
      }
      if (DateTime.parse(element.startAuction).isAfter(DateTime.now())) {
        upcomingAuctionCars.add(element);
      }
    });
    searchLiveAuctionCars = liveAuctionCars;
    searchUpcomingAuctionCars = upcomingAuctionCars;
    notifyListeners();
  }

  filterMyBids() async {
    liveMyBidsCars = [];
    yourWinnings = [];

    for (var i = 0; i < myBidCars.length; i++) {
      if (DateTime.parse(myBidCars[i].startAuction).isBefore(DateTime.now()) &&
          DateTime.parse(myBidCars[i].endAuction).isAfter(DateTime.now())) {
        liveMyBidsCars.add(myBidCars[i]);
      }
    }
    for (var i = 0; i < myBidCars.length; i++) {
      if (myBidCars[i].currentBidPrice == myBidCars[i].yourLastBid &&
          DateTime.parse(myBidCars[i].endAuction).isBefore(DateTime.now())) {
        yourWinnings.add(myBidCars[i]);
      }
    }

    notifyListeners();
  }

  joinAuctionRoom(
      {required String carId,
      required AuctionCar car,
      required BuildContext context}) {
    if (DateTime.parse(car.endAuction).isAfter(DateTime.now())) {
      socket.emit('joinAuction', carId);
      debugPrint("joined room");
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          MySnackbar.showSnackBar(context, "Auction time has expired"));
    }
    currentbidPrice = car.currentBidPrice;
    currentCarId = carId;
    //  updatedCarData = car;
    notifyListeners();
  }

  void connectToSocket() async {
    if (socket.disconnected) {
      try {
        socket.connect();
        debugPrint("Socket connect called");
      } catch (e) {
        debugPrint("Error connecting to socket: $e");
        return;
      }
    }

    debugPrint("Socket connection status----------: ${socket.connected}");

    socket.onConnectError(
        (data) => debugPrint("error in connecting to socket----------- $data"));
    // Event listener for 'newBid'
    socket.on('newBid', (data) {
      debugPrint("NewBid event called");
      try {
        // Verify the data type and handle it
        if (currentCarId == data["vehicle"]["id"].toString()) {
          debugPrint(
              "------------------------------------ new bid event -$currentbidPrice----------------------------------------");
          currentbidPrice = data["vehicle"]["current_bid_price"].toString();
        }
        debugPrint(
            "newBid current vehicle bid amount - ${data["vehicle"]["current_bid_price"].toString()}");
        notifyListeners();
      } catch (e) {
        debugPrint("Error handling 'newBid' event: $e");
      }
    });

    // Event listener for 'updateBidApp'
    socket.on("updateBidApp", (data) {
      debugPrint("UpdateBidApp event called");
      try {
        // Handle the event data as needed
        var response = data as List;
        auctionCars = [];
        response.forEach((element) {
          debugPrint(
              "UpdateBidApp event  current bid price ${element["current_bid_price"]}");
          if (!DateTime.parse(element["end_auction"])
              .isBefore(DateTime.now())) {
            auctionCars.add(AuctionCar.fromJson(element));
          }
        });
        filterData();
        notifyListeners();
      } catch (e) {
        debugPrint("Error handling 'updateBidApp' event: $e");
      }
    });

    // Event listener for 'getMyBidToken'
    socket.on('getMyBidToken', (z) {
      getMyBid();
    });

    // Event listener for 'updateMyBidApp to get My bids'
    socket.on('updateMyBidApp', (myBid) {
      debugPrint("UpdateMyBidApp event called");
      try {
        myBidCars = [];
        if (myBid != null) {
          myBid.forEach((element) {
            myBidCars.add(AuctionCar.fromJson(element["Vehicle"]));
          });
        }
        filterMyBids();

        notifyListeners();
      } catch (e) {
        debugPrint("Error handling 'updateMyBidApp' event: $e");
      }
    });
  }

  Future<void> placeBid({
    required String carId,
    required TextEditingController controller,
    required AuctionCar car,
    required BuildContext context,
  }) async {
    try {
      final SharedPreferences sp = await SharedPreferences.getInstance();
      final String? dealerToken = sp.getString('dealerToken');

      if (dealerToken == null) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            MySnackbar.showSnackBar(context, "Dealer token not available"),
          );
        }
        return;
      }

      if (DateTime.parse(car.endAuction).isAfter(DateTime.now()) &&
          DateTime.parse(car.startAuction).isBefore(DateTime.now())) {
        if (int.parse(currentbidPrice!) + 999 < int.parse(controller.text)) {
          socket.emit("bid", {
            "carId": carId,
            "amount": controller.text,
            "token": dealerToken
          });
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              MySnackbar.showSnackBar(context, "Bid placed successfully"),
            );
          }
          controller.clear();
        } else {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              MySnackbar.showSnackBar(context, "Increase your bid Amount"),
            );
          }
        }
      } else if (DateTime.parse(car.endAuction).isBefore(DateTime.now())) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            MySnackbar.showSnackBar(context, "Auction has ended"),
          );
        }
      }
      if (DateTime.parse(car.startAuction).isAfter(DateTime.now())) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            MySnackbar.showSnackBar(context, "Auction has not started"),
          );
        }
      }
    } catch (error) {
      debugPrint("Error: $error");
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          MySnackbar.showSnackBar(
              context, "An error occurred. Please try again."),
        );
      }
    }
  }

  getMyBid() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();

    String? dealerToken = sp.getString('dealerToken');
    socket.emit('listMyBid', dealerToken);
  }

  getAuctionCars() {
    debugPrint("get auction cars called");
    socket.emit('listAuction');

    //  notifyListeners();
  }

  // clearAuctionCar() {
  //   currentbidPrice = null;
  //   // updatedCarData = null;
  //   notifyListeners();
  // }

  // getBidPrice({required String currentPrice}) {
  //   bidAmount = currentPrice;
  //   //  notifyListeners();
  // }

  disconnectSocket() {
    socket.disconnect();
    debugPrint("socket disconnected");
  }

  // increaseBidAmount() {
  //   bidAmount = (int.parse(bidAmount) + 500).toString();
  //   debugPrint("increase bid called");
  //   debugPrint(bidAmount);
  //   notifyListeners();
  // }

  // reduceBidAmount(String currentBid) {
  //   if (int.parse(currentBid) < int.parse(bidAmount)) {
  //     bidAmount = (int.parse(bidAmount) - 500).toString();
  //   }
  //   notifyListeners();
  // }

  setAuctionCarList() {
    searchLiveAuctionCars = liveAuctionCars;
    searchUpcomingAuctionCars = upcomingAuctionCars;
  }

  searchAuctionCarList({required String query}) {
    searchLiveAuctionCars = liveAuctionCars;
    searchUpcomingAuctionCars = upcomingAuctionCars;
    if (live == true) {
      searchLiveAuctionCars = searchLiveAuctionCars
          .where((element) =>
              element.model.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    if (live == false) {
      searchUpcomingAuctionCars = searchUpcomingAuctionCars
          .where((element) =>
              element.model.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
// searchFunction(String query) {
//     searchedCarList = allCars;
//     searchedCarList = allCars
//         .where((item) => item.model.toLowerCase().contains(query.toLowerCase()))
//         .toList();
//     notifyListeners();
//   }
/////////
// const getMyBid = async () => {
//     if (localStorage.getItem('token') && localStorage.getItem('role') === 'dealer') {
//       socket.emit('listMyBid', localStorage.getItem('token'));
//     }
//   };
//   socket.on('getMyBidToken', () => {
//     socket.emit('listMyBid', localStorage.getItem('token'));
//   });

//   socket.on('updateMyBid', (myBid) => {
//     setListMyBid(myBid);
//   });





