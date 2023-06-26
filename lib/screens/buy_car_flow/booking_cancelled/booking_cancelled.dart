import 'package:dotted_line/dotted_line.dart';
import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/screens/buy_car_flow/buy_car_flow_home_screen/widgets/homescreen_card.dart';
import 'package:flikcar/screens/buy_car_flow/schedule_test_drive/widgets/schedule_car_details.dart';
import 'package:flikcar/screens/home_screen/home_screen.dart';
import 'package:flikcar/services/get_car_details.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class BookingCancelled extends StatelessWidget {
  const BookingCancelled({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.getAppBar(),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.all(12),
          width: MediaQuery.of(context).size.width,
          color: const Color.fromARGB(255, 240, 255, 249),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen(index: 0)));
                },
                child: Icon(
                  Icons.chevron_left,
                  color: AppColors.p2,
                  size: 28,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                "Booking Cancelled",
                style: AppFonts.w700black16,
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const ScheduleCarDetails(),
              const SizedBox(
                height: 30,
              ),
              steps(
                  text: "Test drive booked",
                  color: AppColors.p2,
                  icon: Icons.check),
              steps(
                  text: "Test drive cancelled",
                  color: const Color(0xffD30000),
                  icon: Icons.close),
            ],
          ),
        ),
        HomeScreenCard(
            title: "Similar cars you may like",
            filters: [],
            cars: GetCarDetails.getAllCarDetails(),
            filterButton: false)
      ]),
    );
  }

  Widget steps(
      {required String text, required Color color, required IconData icon}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            CircleAvatar(
                radius: 12,
                backgroundColor: color,
                child: Icon(
                  icon,
                  color: Colors.white,
                )),
            SizedBox(
              height: 24,
              child: DottedLine(
                direction: Axis.vertical,
                lineLength: double.infinity,
                lineThickness: 1.0,
                dashLength: 2.0,
                dashColor:
                    color == AppColors.p2 ? Colors.black : Colors.transparent,
                dashRadius: 0.0,
                dashGapLength: 4.0,
                dashGapColor: Colors.transparent,
                dashGapRadius: 0.0,
              ),
            )
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          text,
          style: AppFonts.w500dark214,
        )
      ],
    );
  }
}
