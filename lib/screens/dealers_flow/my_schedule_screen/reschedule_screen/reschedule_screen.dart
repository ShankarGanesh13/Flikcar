import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/screens/buy_car_flow/filter_applied/widget/filter_applied_card.dart';
import 'package:flikcar/screens/dealers_flow/my_schedule_screen/reschedule_screen/widgets/reschedule_reason.dart';
import 'package:flikcar/screens/dealers_flow/my_schedule_screen/reschedule_screen/widgets/select_reschedule_date.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class RescheduleScreen extends StatelessWidget {
  const RescheduleScreen({super.key});
  static List<String> features = ["Petrol", "13000kms", "2014", "Manual"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.getAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              padding: const EdgeInsets.all(15),
              color: const Color.fromARGB(255, 230, 255, 231),
              child: Row(children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.chevron_left,
                    color: AppColors.p2,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  "Reschedule Test Drive",
                  style: AppFonts.w700black16,
                )
              ]),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 100,
                      margin: const EdgeInsets.only(bottom: 20),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2.45,
                          height: 137,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.asset(
                              "assets/sample_car/tigor1.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Car Name",
                                style: AppFonts.w700black16,
                              ),
                              Text(
                                "Varient Name",
                                style: AppFonts.w500dark214,
                              ),
                              const SizedBox(height: 4),
                              Wrap(
                                spacing: 7,
                                children: List.generate(
                                  4,
                                  (index) => Container(
                                    padding: const EdgeInsets.only(
                                        left: 0, right: 0, top: 0, bottom: 0),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Text(
                                      features[index],
                                      style: AppFonts.w500black10,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                "₹ 326000 ",
                                style: AppFonts.w700black20,
                              ),
                            ],
                          ),
                        )
                      ]),
                    ),
                    const SelectRescheduleDate(),
                    const RescheduleReason()
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
