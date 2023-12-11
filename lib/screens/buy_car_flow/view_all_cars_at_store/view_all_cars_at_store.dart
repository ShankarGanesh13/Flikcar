import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/loading_widget.dart';
import 'package:flikcar/models/buyer_car_display.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/car_detailed_view.dart';
import 'package:flikcar/screens/buy_car_flow/filter_applied/widget/filter_applied_card.dart';
import 'package:flikcar/screens/home_screen/home_screen.dart';
import 'package:flikcar/services/get_car_details.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewAllCarsAtStore extends StatelessWidget {
  final String dealerId;
  const ViewAllCarsAtStore({super.key, required this.dealerId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.getAppBar(function: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(
              index: 0,
            ),
          ),
          (route) => false,
        );
      }),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 51,
              padding: const EdgeInsets.only(top: 0, left: 5),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(gradient: AppColors.gradient),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.chevron_left,
                    ),
                    color: AppColors.p2,
                  ),
                  Text(
                    "All Cars In The Store",
                    style: AppFonts.w700black16,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            FutureBuilder<List<BuyerCarDisplay>>(
              future: Provider.of<GetCarDetails>(context, listen: false)
                  .getCarAtTheStore(id: dealerId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const LoadingWidget();
                }
                if (snapshot.data != null) {
                  return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => CarDetailedView(
                            //                 car: Provider.of<GetCarDetails>(
                            //                         context,
                            //                         listen: false)
                            //                     .getCarById(
                            //               id: snapshot.data![index].id
                            //                   .toString(),
                            //             ))));
                          },
                          child: FilterAppliedCard(
                              compare: false, car: snapshot.data![index]),
                        );
                      });
                } else {
                  return Text(
                    "No cars found",
                    style: AppFonts.w600black14,
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
