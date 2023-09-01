import 'dart:collection';
import 'dart:convert';

import 'package:flikcar/common_widgets/snackbar.dart';
import 'package:flikcar/models/auction_car_model.dart';
import 'package:flikcar/models/bid_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

class AuctionService extends ChangeNotifier {
  BidModel? lastBid;
  String currentbidPrice = "0";
  AuctionCar? updatedCarData;
  String bidAmount = "0";
  bool socketConnected = false;
  bool live = true;

  IO.Socket socket = io('https://webservice.flikcar.com:8000',
      OptionBuilder().setTransports(['websocket']).build());
  List<AuctionCar> auctionCars = [];
  List<AuctionCar> myBidCars = [];
  List<AuctionCar> liveAuctionCars = [];
  List<AuctionCar> upcomingAuctionCars = [];
  List<AuctionCar> searchLiveAuctionCars = [];
  List<AuctionCar> searchUpcomingAuctionCars = [];

  getCurrentBidPrice(String currentBid) {
    currentbidPrice = currentBid;
    notifyListeners();
  }

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
    updatedCarData = car;
    notifyListeners();
  }

  void connectToSocket() {
    socket.connect();
    debugPrint("socket connected----${socket.connected}");
    socketConnected = socket.connected;
    socket.on('newBid', (data) {
      //  debugPrint("new bid ${data["vehicle"]["current_bid_price"]}");
//debugPrint(data["bid"]);

      updatedCarData = AuctionCar.fromJson2(data);

      notifyListeners();
    });
//////////////////
    socket.on("updateBidApp", (data) {
      // debugPrint("auction cars $data");
      auctionCars = [];
      debugPrint("new bid price updated");
      var response = data as List;
      response.forEach((element) {
        //  debugPrint("this is the bid");
        //  debugPrint(element["bid"]);

        //  debugPrint("current bid price  ${element["current_bid_price"]}");
        auctionCars.add(AuctionCar.fromJson(element));
      });
      filterData();
      notifyListeners();
    });
    /////////////
    socket.on('getMyBidToken', (z) {
      getMyBid();
    });
    ////////////
    socket.on('updateMyBidApp', (myBid) {
      myBidCars = [];
      if (myBid != null) {
        myBid.forEach((element) {
          //  debugPrint("this is the my bid data");
          //  print(element);
          // debugPrint("++++++++++++++++++++");
          // debugPrint(element["Vehicle"]["yourLastBid"]);
          myBidCars.add(AuctionCar.fromJson(element["Vehicle"]));
        });
      }
      //  debugPrint(myBidCars);
      notifyListeners();
    });
  }

  placeBid(
      {required String carId,
      required String amount,
      required AuctionCar car,
      required BuildContext context}) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();

    String? dealerToken = sp.getString('dealerToken');
    debugPrint("place bid called");
    //   debugPrint(updatedCarData);
    if (updatedCarData != null) {
      if (DateTime.parse(car.endAuction).isAfter(DateTime.now()) &&
          DateTime.parse(car.startAuction).isBefore(DateTime.now())) {
        if (int.parse(updatedCarData!.currentBidPrice) < int.parse(amount)) {
          socket.emit(
              "bid", {"carId": carId, "amount": amount, "token": dealerToken});
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
                MySnackbar.showSnackBar(context, "Auction has not started"));
          }
        } else {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
                MySnackbar.showSnackBar(context, "Auction has not started"));
          }
        }
      }
      if (DateTime.parse(car.endAuction).isBefore(DateTime.now())) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
              MySnackbar.showSnackBar(context, "Auction has not started"));
        }
      }
      if (DateTime.parse(car.startAuction).isAfter(DateTime.now())) {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
              MySnackbar.showSnackBar(context, "Auction has not started"));
        }
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

  clearAuctionCar() {
    updatedCarData = null;
    notifyListeners();
  }

  getBidPrice({required String currentPrice}) {
    bidAmount = currentPrice;
    //  notifyListeners();
  }

  disconnectSocket() {
    socket.disconnect();
    debugPrint("socket disconnected");
  }

  increaseBidAmount() {
    bidAmount = (int.parse(bidAmount) + 500).toString();
    debugPrint("increase bid called");
    debugPrint(bidAmount);
    notifyListeners();
  }

  reduceBidAmount(String currentBid) {
    if (int.parse(currentBid) < int.parse(bidAmount)) {
      bidAmount = (int.parse(bidAmount) - 500).toString();
    }
    notifyListeners();
  }

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
