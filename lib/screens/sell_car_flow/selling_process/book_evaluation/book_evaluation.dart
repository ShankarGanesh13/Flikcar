import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/heading1.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/book_evaluation/widgets/change_address.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/book_evaluation/widgets/select_date.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/book_evaluation/widgets/select_timeslot.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class BookEvaluation extends StatefulWidget {
  const BookEvaluation({super.key});

  @override
  State<BookEvaluation> createState() => _BookEvaluationState();
}

class _BookEvaluationState extends State<BookEvaluation> {
  DateTime date = DateTime.now();

  final FixedExtentScrollController itemController =
      FixedExtentScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.getAppBar(),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            SizedBox(
              width: 300,
              child: Text(
                "Schedule a free door step inspection to know the exact price of your car",
                style: AppFonts.w700black16,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Heading1(
              title1: "Your Location",
              title2: "",
            ),
            Container(
              margin: const EdgeInsets.only(top: 15, bottom: 15),
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 235, 235, 235),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const Icon(Icons.location_on),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.8,
                    child: const Text(
                        " 36, 1, Gangotri Bldg, Sativli Kaman Road, Tungareshwar Indl Complex, Vasai (east)"),
                  ),
                  const Spacer(),
                  GestureDetector(
                    child: Text(
                      "Change",
                      style: AppFonts.w500s114,
                    ),
                    onTap: () {
                      showModalBottomSheet<void>(
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          return const ChangeAddress();
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            SelectDate(),
            const SizedBox(height: 20),
            const SelectTimeslot(),
          ],
        ),
      ),
    );
  }
}
