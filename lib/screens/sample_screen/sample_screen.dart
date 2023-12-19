import 'package:flikcar/firebase_models/firebase_auction.dart';
import 'package:flikcar/services/firebase_auction_service/firebase_auction_service.dart';
import 'package:flikcar/services/search_service.dart';
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
              SearchService().filterCars();
            },
            child: Text("get data")),
      ]),
    );
  }
}
