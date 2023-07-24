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
  IO.Socket socket = io('http://webservice.flikcar.com:8000',
      OptionBuilder().setTransports(['websocket']).build());
  List<AuctionCar> auctionCars = [];
  List<AuctionCar> liveAuctionCars = [];
  List<AuctionCar> upcomingAuctionCars = [];

  getCurrentBidPrice(String currentBid) {
    currentbidPrice = currentBid;
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
    notifyListeners();
  }

  joinAuctionRoom(
      {required String carId,
      required AuctionCar car,
      required BuildContext context}) {
    if (DateTime.parse(car.endAuction).isAfter(DateTime.now())) {
      socket.emit('joinAuction', carId);
      print("joined room");
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          MySnackbar.showSnackBar(context, "Auction time has expired"));
    }
    updatedCarData = car;
    notifyListeners();
    print(socket);
  }

  void connectToSocket() {
    socket.connect();
    print("socket connected----${socket.connected}");
    socketConnected = socket.connected;
    print(socketConnected);
    print("************");
    socket.on('newBid', (data) {
      print("Received newBid data:");
      print("new bid ${data["vehicle"]["current_bid_price"]}");
      print(data["bid"]);

      updatedCarData = AuctionCar.fromJson2(data);

      print("++++++++++++++++++++");
      print(updatedCarData);
      print(updatedCarData!.lastBid!.dealerName);
      print("++++++++++++++++++++");
      notifyListeners();
    });

    socket.on("updateBid", (data) {
      print(data);
      auctionCars = [];
      print("new bid price updated");
      var response = data as List;
      response.forEach((element) {
        print("this is the bid");
        print(element["bid"]);
        print("current bid price  ${element["current_bid_price"]}");
        auctionCars.add(AuctionCar.fromJson(element));
      });
      filterData();
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
    print("place bid called");
    print(updatedCarData);
    if (updatedCarData != null) {
      if (DateTime.parse(car.endAuction).isAfter(DateTime.now()) &&
          DateTime.parse(car.startAuction).isBefore(DateTime.now())) {
        if (int.parse(updatedCarData!.currentBidPrice) < int.parse(amount)) {
          socket.emit(
              "bid", {"carId": carId, "amount": amount, "token": dealerToken});
          ScaffoldMessenger.of(context).showSnackBar(
              MySnackbar.showSnackBar(context, "Bid place successfully"));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(MySnackbar.showSnackBar(
              context, "Increase the bid amount above the current bid amount"));
        }
      }
      if (DateTime.parse(car.endAuction).isBefore(DateTime.now())) {
        ScaffoldMessenger.of(context).showSnackBar(
            MySnackbar.showSnackBar(context, "Auction time has expired"));
      }
      if (DateTime.parse(car.startAuction).isAfter(DateTime.now())) {
        ScaffoldMessenger.of(context).showSnackBar(
            MySnackbar.showSnackBar(context, "Auction has not started"));
      }
    }
  }

  getAuctionCars() {
    print("get auction cars called");
    socket.emit('listAuction');

    notifyListeners();
  }

  clearAuctionCar() {
    updatedCarData = null;
    notifyListeners();
  }

  // filterList() {
  //   auctionCars = LinkedHashSet<AuctionCar>.from(auctionCars).toList();
  //   print("unique list$auctionCars");
  //   print(auctionCars.map((user) => user.id).toList());

  //   notifyListeners();
  // }

  getBidPrice({required String currentPrice}) {
    bidAmount = currentPrice;
    notifyListeners();
  }

  increaseBidAmount() {
    bidAmount = (int.parse(bidAmount) + 500).toString();
    notifyListeners();
  }

  reduceBidAmount(String currentBid) {
    if (int.parse(currentBid) < int.parse(bidAmount)) {
      bidAmount = (int.parse(bidAmount) - 500).toString();
    }
    notifyListeners();
  }
}
