import 'package:flikcar/firebase_models/firebase_auction.dart';
import 'package:flikcar/services/firebase_auction_service/firebase_auction_service.dart';
import 'package:flutter/material.dart';

class SampleScreen extends StatelessWidget {
  const SampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const SizedBox(
          height: 100,
        ),
        ElevatedButton(
            onPressed: () {
              FirebaseAuctionService().getAuctionCars();
            },
            child: Text("get data")),
        StreamBuilder<List<FirebaseAuction>>(
          stream: FirebaseAuctionService().getAuctionCarsStream(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container();
                  });
            }
          },
        )
      ]),
    );
  }
}
