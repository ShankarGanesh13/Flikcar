import 'package:flikcar/models/auction_car_model.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

class CurrentBidWidget extends StatefulWidget {
  final AuctionCar car;
  const CurrentBidWidget({super.key, required this.car});

  @override
  State<CurrentBidWidget> createState() => _CurrentBidWidgetState();
}

class _CurrentBidWidgetState extends State<CurrentBidWidget> {
  IO.Socket socket = io(
    'https://webservice.flikcar.com',
    IO.OptionBuilder().setTransports(['websocket']).build(),
  );
  // String currentbidPrice = "";
  @override
  void initState() {
    socketConnection();
    // TODO: implement initState
    super.initState();
  }

  socketConnection() async {
    debugPrint("Socket connect called");

    if (socket.disconnected) {
      try {
        await socket.connect();
        debugPrint("Socket connect called");
      } catch (e) {
        debugPrint("Error connecting to socket: $e");
        return;
      }
    }
    //   Event listener for 'newBid'
    socket.on('newBid', (data) {
      debugPrint("NewBid event called");
      try {
        if (widget.car.id == data["vehicle"]["id"]) {
          widget.car.currentBidPrice =
              data["vehicle"]["current_bid_price"].toString();
          setState(() {});
        }
        debugPrint(
            "newBid event current car bid amount -------------------${widget.car.currentBidPrice}");
      } catch (e) {
        debugPrint("Error handling 'newBid' event: $e");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        checkAuctionEnded(context),
        const Spacer(),
        Text(
          "Inspection Score:",
          style: AppFonts.w500black14,
        ),
        const SizedBox(width: 8),
        const Icon(
          Icons.star,
          size: 20,
        ),
        const SizedBox(width: 3),
        Text(
          "${widget.car.technicianRating} / 5",
          style: AppFonts.w700black16,
        )
      ],
    );
  }

  Widget checkAuctionEnded(BuildContext context) {
    if (DateTime.parse(widget.car.endAuction).isBefore(DateTime.now())) {
      return Text(
        "Final Bid\n₹${widget.car.currentBidPrice}",
        style: AppFonts.w700black20,
      );
    } else {
      return Text(
        widget.car.currentBidPrice == "no data"
            ? "Curreny Bid\n₹${widget.car.carPrice}"
            : "Current Bid\n₹${widget.car.currentBidPrice}",
        style: AppFonts.w700black20,
      );
    }
  }
}
