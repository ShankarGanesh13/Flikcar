import 'package:flikcar/common_widgets/heading1.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SelectTimeslot extends StatefulWidget {
  const SelectTimeslot({super.key});

  @override
  State<SelectTimeslot> createState() => _SelectTimeslotState();
}

class _SelectTimeslotState extends State<SelectTimeslot> {
  int selectedIndex = 0;
  DateTime date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Heading1(
        title1: "Select Time Slot",
        title2: "",
      ),
      const SizedBox(height: 15),
      const Text(
        "Evaluaion will take 45 - 60mins & will be completed in given timeslot",
        style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Color(0xff9A2870),
            fontSize: 14),
      ),
      const SizedBox(height: 15),
      Wrap(
        spacing: 20,
        runSpacing: 15,
        children: List.generate(
          6,
          (index) => InkWell(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              print(index);
            },
            child: Container(
              padding:
                  const EdgeInsets.only(top: 5, bottom: 5, left: 8, right: 8),
              height: 30,
              decoration: BoxDecoration(
                  color: selectedIndex == index
                      ? const Color(0xff9A2870)
                      : const Color.fromARGB(255, 235, 235, 235),
                  borderRadius: BorderRadius.circular(5)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "4:00pm - 5:00pm",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: selectedIndex == index
                            ? Colors.white
                            : const Color(0xff9A2870),
                        fontSize: 11),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
