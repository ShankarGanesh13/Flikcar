import 'package:flikcar/models/auction_car_model.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_detail_screen/widgets/bid_textfield.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_detail_screen/widgets/current_bid_widget.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_list_screen/widget/ongoing_timer2.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_list_screen/widget/timer_text.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_list_screen/widget/upcoming_timer2.dart';
import 'package:flikcar/services/auction_services.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';

class DealerCarDetails extends StatefulWidget {
  final AuctionCar car;

  DealerCarDetails({super.key, required this.car});
  static List<String> icondata = [
    "assets/car_details_icon/location.png",
    "assets/car_details_icon/speedometer.png",
    "assets/car_details_icon/owner.png",
    "assets/car_details_icon/fuel_type.png",
    "assets/car_details_icon/calendar.png",
    "assets/car_details_icon/transmisson.png",
    "assets/car_details_icon/roadTax.png",
    "assets/car_details_icon/insurance.png",
    "assets/car_details_icon/noc.png",
    "assets/car_details_icon/location.png",
  ];

  @override
  State<DealerCarDetails> createState() => _DealerCarDetailsState();
}

class _DealerCarDetailsState extends State<DealerCarDetails> {
  // IO.Socket socket = io(
  //   'https://webservice.flikcar.com',
  //   IO.OptionBuilder().setTransports(['websocket']).build(),
  // );
  // String currentbidPrice = "";

  // socketConnection() async {
  //   if (socket.disconnected) {
  //     try {
  //       await socket.connect();
  //       debugPrint("Socket connect called");
  //     } catch (e) {
  //       debugPrint("Error connecting to socket: $e");
  //       return;
  //     }
  //   }
  //   //   Event listener for 'newBid'
  //   socket.on('newBid', (data) {
  //     try {
  //       widget.car.currentBidPrice =
  //           data["vehicle"]["current_bid_price"].toString();
  //     } catch (e) {
  //       debugPrint("Error handling 'newBid' event: $e");
  //     }
  //   });
  // }

  @override
  void initState() {
    // socketConnection();
    // TODO: implement initState
    super.initState();
  }

  final DateFormat formatter = DateFormat('yMMM');

  List<String> data = [];

  String? currentBid = "0";

  @override
  Widget build(BuildContext context) {
    currentBid = context.watch<AuctionService>().currentbidPrice;
    data = [
      "City: Kolkata",
      "Km Driven: ${widget.car.driveKms}",
      "Owners: ${widget.car.ownertype}",
      "Fuel Type: ${widget.car.fuel}",
      "Reg. Year: ${widget.car.registrationYear}",
      "Transmission: ${widget.car.transmission}",
      "Road Tax \nValidity: ${widget.car.roadtaxValidity == "N/A" ? "N/A" : formatter.format(DateTime.parse(widget.car.roadtaxValidity))}",
      "Insurance\nValidity: ${widget.car.insuranceValidity == "N/A" ? "N/A" : formatter.format(DateTime.parse(widget.car.insuranceValidity))}",
      "NOC: ${widget.car.noc}",
      "RTO Location: ${widget.car.rto}"
    ];
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // CurrentBidWidget(car: widget.car),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   "Current Bid\n${car.currentBidPrice} ₹",
              //   style: AppFonts.w700black20,
              // ),
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
          ),
          const SizedBox(height: 10),
          checkTime(),

          const SizedBox(height: 10),
          BidTextField(currentBid: currentBid!, car: widget.car),
          // const SizedBox(height: 10),

          Text(
            "Note* Bid Amount should be atleast ₹1000 more than the current bid price",
            style: AppFonts.w500black12,
          ),
          const SizedBox(height: 25),

          Align(
            alignment: Alignment.topLeft,
            child: Wrap(
              runAlignment: WrapAlignment.spaceEvenly,
              alignment: WrapAlignment.start,
              spacing: 15,
              runSpacing: 15,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: List.generate(
                  10,
                  (index) => SizedBox(
                        width: MediaQuery.of(context).size.width / 2.35,
                        child: Row(
                          children: [
                            Container(
                                padding: const EdgeInsets.all(5),
                                margin: const EdgeInsets.only(left: 5),
                                height: 26,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: AppColors.p2,
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                  ),
                                ),
                                child: Image.asset(
                                  DealerCarDetails.icondata[index],
                                  color: Colors.white,
                                )),
                            const SizedBox(
                              width: 6,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 3.2,
                              child: Text(
                                data[index],
                                style: AppFonts.w500black10,
                              ),
                            )
                          ],
                        ),
                      )),
            ),
          )
        ],
      ),
    );
  }

  Widget checkTime() {
    if (DateTime.parse(widget.car.endAuction).isBefore(DateTime.now())) {
      return Text(
        "Auction has ended",
        style: AppFonts.w500red14,
      );
    } else {
      return checkLive();
    }
  }

  Widget checkLive() {
    DateTime now = DateTime.now();
    if (DateTime.parse(widget.car.endAuction).isAfter(now) &&
        DateTime.parse(widget.car.startAuction).isBefore(now)) {
      return OngoingTimer2(
        car: widget.car,
      );
    } else {
      return UpcomingTimer2(
        car: widget.car,
      );
    }
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
            : "Current Bid\n₹${context.watch<AuctionService>().currentbidPrice}",
        style: AppFonts.w700black20,
      );
    }
  }
}
