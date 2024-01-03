import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flikcar/common_widgets/snackbar.dart';
import 'package:flikcar/firebase_models/firebase_auction.dart';
import 'package:flikcar/firebase_models/firebase_auction_car_details.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flikcar/firebase_models/firebase_my_bids.dart';
import 'package:flikcar/screens/dealers_flow/dealer_flow.dart';
import 'package:flikcar/services/firebase_auth_service/firebase_auth_service.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class FirebaseAuctionService {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  getAuctionCars() async {
    CollectionReference collection = await firestore.collection("auctions");
    QuerySnapshot querySnapshot = await collection.get();
    for (var query in querySnapshot.docs) {
      FirebaseAuction data =
          FirebaseAuction.fromJson(query.data() as Map<String, dynamic>);
      print(data);
    }
  }

  Stream<List<FirebaseAuction?>> getAuctionCarsStream() {
    debugPrint("---------------------------------get auction cars as stream");
    CollectionReference collection = firestore.collection("auctions");
    return collection.snapshots().map(
      (QuerySnapshot querySnapshot) {
        final currentTime = DateTime.now();

        return querySnapshot.docs
            .map(
              (QueryDocumentSnapshot queryDocumentSnapshot) {
                final auctionData =
                    queryDocumentSnapshot.data() as Map<String, dynamic>;

                if (DateTime.fromMillisecondsSinceEpoch(auctionData['endTime'])
                    .isAfter(currentTime)) {
                  return FirebaseAuction.fromJson(auctionData);
                } else {
                  return null;
                }
              },
            )
            .where((auction) => auction != null)
            .toList();
      },
    );
  }

  Stream<List<FirebaseAuction?>> getLiveAuctionCarsStream() {
    debugPrint(
        "---------------------------------get live auction cars as stream");
    CollectionReference collection = firestore.collection("auctions");

    return collection.snapshots().map(
      (QuerySnapshot querySnapshot) {
        final currentTime = DateTime.now();

        return querySnapshot.docs
            .map(
              (QueryDocumentSnapshot queryDocumentSnapshot) {
                final auctionData =
                    queryDocumentSnapshot.data() as Map<String, dynamic>;

                final startTime = DateTime.fromMillisecondsSinceEpoch(
                    auctionData['startTime']);
                final endTime =
                    DateTime.fromMillisecondsSinceEpoch(auctionData['endTime']);

                if (currentTime.isAfter(startTime) &&
                    currentTime.isBefore(endTime)) {
                  return FirebaseAuction.fromJson(auctionData);
                } else {
                  return null;
                }
              },
            )
            .where((auction) => auction != null)
            .toList();
      },
    );
  }

  Stream<List<FirebaseAuction?>> getUpcomingAuctionCarsStream() {
    debugPrint(
        "---------------------------------get upcoming auction cars as stream");
    CollectionReference collection = firestore.collection("auctions");

    return collection.snapshots().map(
      (QuerySnapshot querySnapshot) {
        final currentTime = DateTime.now();

        return querySnapshot.docs
            .map(
              (QueryDocumentSnapshot queryDocumentSnapshot) {
                final auctionData =
                    queryDocumentSnapshot.data() as Map<String, dynamic>;

                final startTime = DateTime.fromMillisecondsSinceEpoch(
                    auctionData['startTime']);

                return startTime.isAfter(currentTime)
                    ? FirebaseAuction.fromJson(auctionData)
                    : null;
              },
            )
            .where((auction) => auction != null)
            .toList();
      },
    );
  }

  Stream<List<FirebaseAuction?>> getOcbCarsStream() {
    debugPrint("-------------------------------get ocb auction cars as stream");
    CollectionReference collection = firestore.collection("auctions");

    return collection.snapshots().map(
      (QuerySnapshot querySnapshot) {
        return querySnapshot.docs.map(
          (QueryDocumentSnapshot queryDocumentSnapshot) {
            final auctionData =
                queryDocumentSnapshot.data() as Map<String, dynamic>;

            return FirebaseAuction.fromJson(auctionData);
          },
        ).toList();
      },
    );
  }

  Stream<FirebaseAuction> getAuctionCarByIdStream({required String carId}) {
    print("getAuctionCarByIdStream called");
    // Reference to the specific document
    DocumentReference docRef = firestore.collection("auctions").doc(carId);

    // Return the stream
    return docRef.snapshots().map(
      (DocumentSnapshot documentSnapshot) {
        //   var data = documentSnapshot.data() as Map<String, dynamic>;

        return FirebaseAuction.fromJson(
            documentSnapshot.data() as Map<String, dynamic>);
      },
    );
  }

  Stream<List<FirebaseAuction>> getMyBids() {
    myWinnings();
    CollectionReference collection = firestore.collection("auctions");
    CollectionReference userMyBidCollection = firestore
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("bids");

    return collection.snapshots().asyncMap(
      (QuerySnapshot querySnapshot) async {
        List<FirebaseAuction> filteredAuctions = [];

        for (QueryDocumentSnapshot queryDocumentSnapshot
            in querySnapshot.docs) {
          DocumentSnapshot userBidDoc =
              await userMyBidCollection.doc(queryDocumentSnapshot.id).get();

          if (userBidDoc.exists) {
            FirebaseAuction auction = FirebaseAuction.fromJson(
                queryDocumentSnapshot.data() as Map<String, dynamic>);

            // Check if the auction has not ended
            if (DateTime.fromMillisecondsSinceEpoch(auction.endTime)
                .isAfter(DateTime.now())) {
              filteredAuctions.add(auction);
            }
          }
        }

        return filteredAuctions;
      },
    ).handleError((error) {
      print("Error getting bids stream: $error");
      // You can choose to throw an error or return an empty list based on your needs.
      return [];
    });
  }

  Future<List<FirebaseAuction>> myWinnings() async {
    CollectionReference collection = firestore.collection("auctions");
    List<FirebaseAuction> winningAuctions = [];

    // Fetch all auctions
    QuerySnapshot auctionSnapshots = await collection.get();

    // Iterate through each auction
    for (QueryDocumentSnapshot auctionDoc in auctionSnapshots.docs) {
      FirebaseAuction auction =
          FirebaseAuction.fromJson(auctionDoc.data() as Map<String, dynamic>);

      // Check if the auction has ended
      if (DateTime.fromMillisecondsSinceEpoch(auction.endTime)
          .isBefore(DateTime.now())) {
        // Get the latest bid for this auction
        FirebaseAuction car =
            FirebaseAuction.fromJson(auctionDoc.data() as Map<String, dynamic>);
        if (car.bid != null) {
          if (car.bid!.bidder.userId == auth.currentUser!.uid) {
            winningAuctions.add(car);
          }
        }
      }
    }

    return winningAuctions;
  }

  Stream<FirebaseMyBids> getMyBidPrice({required String carId}) {
    DocumentReference docRef = firestore
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("bids")
        .doc(carId);
    return docRef.snapshots().map(
      (DocumentSnapshot documentSnapshot) {
        return FirebaseMyBids.fromJson(
            documentSnapshot.data() as Map<String, dynamic>);
      },
    );
  }

  Future<FirebaseAuctionCarDetails?> getAuctionCarDetails(
      {required String carId}) async {
    try {
      DocumentSnapshot docSnapshot =
          await firestore.collection("auction_vehicles").doc(carId).get();

      if (docSnapshot.exists) {
        Map<String, dynamic>? data = docSnapshot.data() as Map<String, dynamic>;

        FirebaseAuctionCarDetails carDetails =
            FirebaseAuctionCarDetails.fromJson(data);
        debugPrint(carDetails.id);

        return carDetails;
      }
    } catch (e) {
      print("Error fetching car details: $e");
    }

    return null;
  }

  static Map<String, dynamic>? dealerDetails;
  static getDealerDetails() async {
    dealerDetails = await FirebaseAuthService.getDealerDetails();
  }

  Future<String> placeBid({
    required String auctionId,
    required BuildContext context,
    required int currentBid,
    required int bidAmount,
    required String userId,
    required TextEditingController controller,
    required String phone,
    required String firstName,
    required String lastName,
  }) async {
    try {
      if (currentBid + 999 < bidAmount) {
        final functions = FirebaseFunctions.instance;
        print("+++++++++++++++++++++++++++++++++++++++++$auctionId");

        final data = {
          "auctionId": auctionId.toString(),
          "bidPrice": bidAmount,
          "user": {
            "userId": userId,
            "phone": phone,
            "firstName": dealerDetails != null ? dealerDetails!["name"] : "",
            "lastName": lastName,
          },
        };

        // Call the Cloud Function
        final callable = functions.httpsCallable('placeBid');
        final result = await callable(data);

        debugPrint('Cloud Function result: ${result.data}');

        // Check the status of the bid placement
        if (result.data["status"] == "SUCCESS") {
          // Clear the controller
          controller.clear();

          // Show a success message using a SnackBar
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              MySnackbar.showSnackBar(context, "Bid placed successfully"),
            );
          }

          // Return a success status
          return "SUCCESS";
        } else {
          // Return a failure status
          return "FAILED";
        }
      } else {
        // Show a SnackBar with a message to increase the bid amount
        ScaffoldMessenger.of(context).showSnackBar(
          MySnackbar.showSnackBar(context, "Increase your bid amount"),
        );

        // Return a failure status
        return "FAILED";
      }
    } on FirebaseFunctionsException catch (e) {
      // Handle Cloud Function exception
      ScaffoldMessenger.of(context).showSnackBar(
        MySnackbar.showSnackBar(
            context, "Something went wrong please try again"),
      );
      debugPrint('Error calling Cloud Function: ${e.message}');
      return "FAILED";
    } catch (e) {
      // Handle other exceptions
      ScaffoldMessenger.of(context).showSnackBar(
        MySnackbar.showSnackBar(
            context, "Something went wrong please try again"),
      );
      debugPrint('Unexpected error calling Cloud Function: $e');
      return "FAILED";
    }
  }

  oneClickBuy(
      {required String carId,
      required int price,
      required BuildContext context}) async {
    CollectionReference collection = firestore
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("oneClickBuyVehicles");
    DocumentReference vehicleDoc = firestore.collection("auctions").doc(carId);

    var data2 = {
      "bidder": {
        "firstName": dealerDetails!["name"] ?? "",
        "lastName": "",
        "phone": auth.currentUser!.phoneNumber,
        "userId": auth.currentUser!.uid,
      },
      "id": "",
      "placedTime": DateTime.now().millisecondsSinceEpoch,
      "price": price,
    };
    var data = {
      "vehicleId": carId,
      "updatedAt": DateTime.now().millisecondsSinceEpoch,
      "price": price
    };
    try {
      await Future.wait([
        vehicleDoc.set({"latestBid": data2}, SetOptions(merge: true)),
        vehicleDoc.set({"isSoldOut": true}, SetOptions(merge: true)),
        collection.doc(carId).set(data)
      ]);
      if (context.mounted) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const DealerFlow(index: 1)),
            (route) => false);

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                'Booking Completed Successfully',
                style: AppFonts.w700black16,
              ),
              content: Text(
                'Thank you for purchasing with us, our support team will contact you shortly',
                style: AppFonts.w500black14,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      debugPrint("error in one-click buy: $e");
    }
  }
}
