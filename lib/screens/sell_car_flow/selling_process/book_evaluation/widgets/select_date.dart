import 'package:flikcar/common_widgets/heading1.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SelectDate extends StatefulWidget {
  SelectDate({super.key});

  @override
  State<SelectDate> createState() => _SelectDateState();
}

class _SelectDateState extends State<SelectDate> {
  final DateTime date = DateTime.now();

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Heading1(
          title1: "Select Date",
          title2: "",
        ),
        const SizedBox(height: 15),
        Wrap(
          spacing: 40,
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
                height: 55,
                width: 65,
                decoration: BoxDecoration(
                    color: selectedIndex == index
                        ? Color(0xff9A2870)
                        : const Color.fromARGB(255, 235, 235, 235),
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      DateFormat('MMM').format(date.add(Duration(days: index))),
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: selectedIndex == index
                              ? Colors.white
                              : const Color(0xff9A2870),
                          fontSize: 11),
                    ),
                    Text(
                      DateFormat('d').format(date.add(Duration(days: index))),
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: selectedIndex == index
                              ? Colors.white
                              : const Color(0xff9A2870),
                          fontSize: 11),
                    ),
                    Text(
                      DateFormat('EEEE')
                          .format(date.add(Duration(days: index))),
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
      ],
    );
  }
}
