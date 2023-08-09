import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/models/auction_car_model.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/widgets/nav_button.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_detail_screen/car_specifications/car_specifications.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_detail_screen/widgets/dealer_car_details.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_detail_screen/widgets/dealer_car_features.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_detail_screen/widgets/dealer_car_specification.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_detail_screen/widgets/dealer_image_viewer.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_detail_screen/widgets/inspection_report.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_auction_home_screen/widgets/dealer_car_card.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_list_screen/dealer_car_list_screen.dart';
import 'package:flikcar/screens/dealers_flow/provider/dealer_provider.dart';
import 'package:flikcar/services/auction_services.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DealerCarDetailScreen extends StatefulWidget {
  final AuctionCar carr;
  const DealerCarDetailScreen({super.key, required this.carr});

  @override
  State<DealerCarDetailScreen> createState() => _DealerCarDetailScreenState();
}

class _DealerCarDetailScreenState extends State<DealerCarDetailScreen> {
  AuctionCar? car;
  @override
  void initState() {
    // TODO: implement initState

    Provider.of<AuctionService>(context, listen: false)
        .getBidPrice(currentPrice: widget.carr.currentBidPrice);
    super.initState();
  }

  String currentBid = "0";
  @override
  Widget build(BuildContext context) {
    car = context.watch<AuctionService>().updatedCarData;
    currentBid = context.watch<AuctionService>().bidAmount;

    return Scaffold(
        appBar: CustomAppBar.getAppBarWithContainerSearch(
            context: context,
            function: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DealerCarListScreen(),
                  ));
            },
            back: true),
        bottomNavigationBar: SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding:
                const EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 5),
            color: AppColors.s1,
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              bidButton(
                  icon: Icons.remove,
                  function: () {
                    Provider.of<AuctionService>(context, listen: false)
                        .reduceBidAmount(widget.carr.currentBidPrice);
                  }),
              Text(
                "  ₹ ${context.watch<AuctionService>().bidAmount}  ",
                style: AppFonts.w700white16,
              ),
              bidButton(
                  icon: Icons.add,
                  function: () {
                    Provider.of<AuctionService>(context, listen: false)
                        .increaseBidAmount();
                    print("__________");
                    print(currentBid);
                  }),
              const Spacer(),
              BuyNavButton(
                icon: Icons.chevron_right,
                title: "Place Bid",
                function: () {
                  Provider.of<AuctionService>(context, listen: false).placeBid(
                      carId: widget.carr.id.toString(),
                      amount: currentBid,
                      car: widget.carr,
                      context: context);
                },
              )
            ]),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  padding: const EdgeInsets.all(12),
                  width: MediaQuery.of(context).size.width,
                  // color: const Color.fromARGB(255, 240, 255, 249),
                  decoration: BoxDecoration(gradient: AppColors.gradient),
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.carr.brand,
                              style: AppFonts.w500dark214,
                            ),
                            Text(
                              "${widget.carr.model} ${widget.carr.variant}",
                              style: AppFonts.w700black16,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                      // const Spacer(),
                      // const Icon(Icons.share),
                      // const SizedBox(
                      //   width: 12,
                      // ),
                      // const Icon(Icons.flag),
                    ],
                  )),
              DealerImageViewer(
                car: widget.carr,
              ),
              DealerCarDetails(
                car: car ?? widget.carr,
              ),
              const SizedBox(
                height: 10,
              ),
              InspectionReport(car: widget.carr),
              const SizedBox(
                height: 10,
              ),
              DealerCarFeatures(
                car: widget.carr,
              ),
              const SizedBox(
                height: 15,
              ),
              DealerCarSpecification(
                car: widget.carr,
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: PrimaryButton(
                    title: "View all specifications",
                    function: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  DealerCarSpecificationScreen(
                                    car: widget.carr,
                                  )));
                    },
                    borderColor: Colors.white,
                    backgroundColor: AppColors.p2,
                    textStyle: AppFonts.w500white14),
              ),
              const SizedBox(
                height: 25,
              ),
              // const DealerCarCard(
              //   filters: [],
              //   title: "Auctions ending soon",
              //   filterButton: false,
              // ),
              // const SizedBox(
              //   height: 30,
              // ),
            ],
          ),
        ));
  }

  Widget bidButton({required IconData icon, required Function() function}) {
    return GestureDetector(
      onTap: function,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: const Color(0xffffffff),
            borderRadius: BorderRadius.circular(4)),
        child: Icon(
          icon,
          size: 24,
          weight: 900,
          color: Color(0xff606060),
        ),
      ),
    );
  }
}
