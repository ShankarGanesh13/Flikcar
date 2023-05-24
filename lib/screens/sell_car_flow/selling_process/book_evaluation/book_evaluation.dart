import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/heading1.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/book_evaluation/widgets/plans.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/book_evaluation/widgets/select_date.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/book_evaluation/widgets/select_timeslot.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/inspection_scheduled/inspection_scheduled.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 15,
              ),
              const Heading1(
                title1: "Schedule a free doorstep ",
                title2: "evaluation to get the exact price",
                title3: "of your car.",
              ),
              const SizedBox(
                height: 20,
              ),
              titleAndTextField(
                prefix: const Icon(
                  Icons.location_on,
                  color: Color(0xff9A2870),
                ),
                title: "Your Address",
                hint: "Enter your address",
                max: 50,
              ),
              SelectDate(),
              const SizedBox(height: 20),
              const SelectTimeslot(),
              const SizedBox(height: 20),
              titleAndTextField(
                prefix: Padding(
                  padding: const EdgeInsets.only(top: 13.0, left: 13),
                  child: Text(
                    "+91 - ",
                    style: AppFonts.w500dark214,
                  ),
                ),
                title: "Phone Number",
                hint: "Enter your Phone number",
                max: 50,
              ),
              // const SizedBox(height: 20),
              titleAndTextField(
                prefix: const Icon(Icons.abc),
                title: "Your Name",
                hint: "Enter your name",
                max: 30,
              ),
              Plans(),
              const SizedBox(
                height: 20,
              ),
              Text(
                "By continuing you agree to our Privacyt Policy and TU CIBIL Terms Of Use",
                style: AppFonts.w500dark214,
              ),
              const SizedBox(
                height: 20,
              ),
              PrimaryButton(
                  title: "Book Free Evaluation",
                  function: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const InspectionScheduled(),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }

  Widget titleAndTextField({
    required String title,
    required String hint,
    required int max,
    required Widget prefix,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppFonts.w700s116,
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 6),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              counterStyle: const TextStyle(color: Colors.transparent),
              hintText: hint,
              prefixIcon: prefix),
          maxLength: 20,
        ),
      ],
    );
  }
}
//  Container(
//               margin: const EdgeInsets.only(top: 15, bottom: 15),
//               width: MediaQuery.of(context).size.width,
//               padding: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 color: const Color.fromARGB(255, 235, 235, 235),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Row(
//                 children: [
//                   const Icon(Icons.location_on),
//                   const SizedBox(
//                     width: 10,
//                   ),
//                   SizedBox(
//                     width: MediaQuery.of(context).size.width / 1.8,
//                     child: const Text(
//                         " 36, 1, Gangotri Bldg, Sativli Kaman Road, Tungareshwar Indl Complex, Vasai (east)"),
//                   ),
//                   const Spacer(),
//                   GestureDetector(
//                     child: Text(
//                       "Change",
//                       style: AppFonts.w500s114,
//                     ),
//                     onTap: () {
//                       showModalBottomSheet<void>(
//                         isScrollControlled: true,
//                         context: context,
//                         builder: (BuildContext context) {
//                           return const ChangeAddress();
//                         },
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),