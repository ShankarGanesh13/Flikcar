import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/heading1.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/firebase_models/firebase_delaer_listed_car.dart';
import 'package:flikcar/screens/dealers_flow/dealer_flow.dart';
import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/dealer_listing_screen/dealer_listing_screen.dart';
import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/widgets/dealer_listed_car_card.dart';
import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/widgets/dealer_listed_cars.dart';
import 'package:flikcar/screens/dealers_flow/dealer_sell_car_screen/widgets/dealer_sell_car_header.dart';
import 'package:flikcar/services/firebase_auth_service/firebase_auth_service.dart';
import 'package:flikcar/services/get_dealer_uploaded_car.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DealerSellCarScreen extends StatefulWidget {
  const DealerSellCarScreen({super.key});

  @override
  State<DealerSellCarScreen> createState() => _DealerSellCarScreenState();
}

class _DealerSellCarScreenState extends State<DealerSellCarScreen> {
  @override
  void initState() {
    Provider.of<GetDealerUploadCars>(context, listen: false)
        .getDealerUploadedCars();

    super.initState();
  }

  final List<String> items = [
    'All Cars',
    'Available',
    'Sold Out',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar.getAppBar(
        function: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const DealerFlow(
                index: 0,
              ),
            ),
            (route) => false,
          );
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const DealerSellCarHeader(),
            Container(
              color: const Color.fromARGB(255, 70, 70, 70),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      PrimaryButton(
                        title: "List a Car",
                        function: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DealerListingScreen(),
                            ),
                          );
                        },
                        borderColor: Colors.transparent,
                        backgroundColor: AppColors.s1,
                        textStyle: AppFonts.w500white14,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Heading1(title1: "Your Listings", title2: ""),
                      const SizedBox(
                        height: 15,
                      ),
                      StreamBuilder<List<FirebaseDealerListedCar>>(
                        stream: GetDealerUploadCars().getDealerUploadedCars(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const SizedBox(
                              height: 300,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          } else if (snapshot.hasError) {
                            debugPrint("=================${snapshot.error}");
                            return SizedBox(
                              height: 300,
                              child: Center(
                                child: Text(
                                  "Error",
                                  style: AppFonts.w700black16,
                                ),
                              ),
                            );
                          } else if (snapshot.data == null ||
                              snapshot.data!.isEmpty) {
                            return SizedBox(
                              height: 300,
                              child: Center(
                                child: Text(
                                  "No cars found",
                                  style: AppFonts.w700black16,
                                ),
                              ),
                            );
                          } else {
                            return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data!.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return DealerListedCarCard(
                                  car: snapshot.data![index],
                                );
                              },
                            );
                          }
                        },
                      ),
                      const SizedBox(
                        height: 150,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

       // DropdownButtonHideUnderline(
                  //   child: DropdownButton2<String>(
                  //     isExpanded: true,
                  //     hint: Text('All cars', style: AppFonts.w700black14),
                  //     items: items
                  //         .map((String item) => DropdownMenuItem<String>(
                  //               value: item,
                  //               child: Text(item, style: AppFonts.w700black14),
                  //             ))
                  //         .toList(),
                  //     value: selectedValue,
                  //     onChanged: (String? value) {
                  //       setState(() {
                  //         selectedValue = value;

                  //         Provider.of<GetDealerUploadCars>(context, listen: false)
                  //             .filterDealerCars(status: selectedValue!);
                  //       });
                  //     },
                  //     buttonStyleData: const ButtonStyleData(
                  //       padding: EdgeInsets.symmetric(horizontal: 0),
                  //       height: 40,
                  //       width: 120,
                  //     ),
                  //     menuItemStyleData: const MenuItemStyleData(
                  //       height: 40,
                  //     ),
                  //   ),
                  // ),