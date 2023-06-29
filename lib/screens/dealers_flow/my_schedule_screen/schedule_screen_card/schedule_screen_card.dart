import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/screens/dealers_flow/my_schedule_screen/schedule_screen_card/widgets/edit_schedule_sheet.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class ScheduleScreenCard extends StatelessWidget {
  const ScheduleScreenCard({super.key});
  static List<String> features = ["Petrol", "13000kms", "2014", "Manual"];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            height: 137,
            margin: const EdgeInsets.only(bottom: 30),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                    offset: Offset(1, 1),
                    blurRadius: 20,
                    spreadRadius: 0,
                  ),
                ],
                borderRadius: BorderRadius.circular(5)),
            child: Row(children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.45,
                height: 137,
                child: Image.asset(
                  "assets/sample_car/tigor1.png",
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 7.0,
                  left: 7,
                  right: 7,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Car Name",
                          style: AppFonts.w700black16,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width / 4.6),
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet<void>(
                              isScrollControlled: true,
                              context: context,
                              builder: (BuildContext context) {
                                return const EditScheduleSheet();
                              },
                            );
                          },
                          child: const Icon(
                            Icons.more_horiz,
                            size: 22,
                          ),
                        )
                      ],
                    ),
                    Text(
                      "Varient Name",
                      style: AppFonts.w500dark214,
                    ),
                    const SizedBox(height: 2),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.2,
                      child: Text(
                        "Cust Name: Debanjan Kumar",
                        maxLines: 1,
                        style: AppFonts.w500dark212,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Date: 28.5.12",
                      style: AppFonts.w700black16,
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: 100,
                      height: 30,
                      child: PrimaryButton(
                        title: "Call Customer",
                        function: () {},
                        borderColor: AppColors.s1,
                        backgroundColor: Colors.white,
                        textStyle: AppFonts.w500s110,
                      ),
                    ),
                  ],
                ),
              )
            ]),
          );
        });
  }
}
