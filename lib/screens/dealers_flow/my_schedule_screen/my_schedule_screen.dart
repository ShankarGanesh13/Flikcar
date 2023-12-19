import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/screens/dealers_flow/dealer_flow.dart';
import 'package:flikcar/screens/dealers_flow/my_schedule_screen/new_testdrive_card.dart';
import 'package:flikcar/services/get_dealer_uploaded_car.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyScheduleScreen extends StatefulWidget {
  const MyScheduleScreen({super.key});

  @override
  State<MyScheduleScreen> createState() => _MyScheduleScreenState();
}

class _MyScheduleScreenState extends State<MyScheduleScreen> {
  List<String> items = ["Today", "Tomorrow", "All"];
  String? selectedValue;
  @override
  void initState() {
    Provider.of<GetDealerUploadCars>(context, listen: false)
        .getDealerScheduledTestDrive();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List testdrive = [];
    return Scaffold(
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
            Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(16),
              // color: const Color.fromARGB(255, 234, 255, 235),
              decoration: BoxDecoration(gradient: AppColors.gradient),
              child: Text(
                "My Schedules",
                textAlign: TextAlign.start,
                style: AppFonts.w700black16,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(children: [
                Row(
                  children: [
                    Text(
                      "Test Drive : ",
                      style: AppFonts.w700black14,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton2<String>(
                        isExpanded: true,
                        hint: Text('All', style: AppFonts.w700black14),
                        items: items
                            .map((String item) => DropdownMenuItem<String>(
                                  value: item,
                                  child:
                                      Text(item, style: AppFonts.w700black14),
                                ))
                            .toList(),
                        value: selectedValue,
                        onChanged: (String? value) {
                          setState(() {
                            selectedValue = value;
                            Provider.of<GetDealerUploadCars>(context,
                                    listen: false)
                                .filterTestDrive(filter: value!);
                          });
                        },
                        buttonStyleData: const ButtonStyleData(
                          padding: EdgeInsets.symmetric(horizontal: 0),
                          // decoration:
                          //     BoxDecoration(border: Border(bottom: BorderSide())),
                          height: 40,
                          width: 105,
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          height: 40,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                testdrive.length != 0
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: testdrive.length,
                        itemBuilder: (context, index) => Container())
                    : Padding(
                        padding: const EdgeInsets.only(top: 60.0),
                        child: Text(
                          "No Scheduled Test Drives",
                          style: AppFonts.w700black16,
                        ),
                      )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
