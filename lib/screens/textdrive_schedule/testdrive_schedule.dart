import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/firebase_models/firebase_testdrive.dart';
import 'package:flikcar/screens/buy_car_flow/provider/test_drive_service.dart';
import 'package:flikcar/screens/home_screen/home_screen.dart';
import 'package:flikcar/screens/textdrive_schedule/widgets/filter_dropdown.dart';
import 'package:flikcar/screens/textdrive_schedule/widgets/testdrive_card.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TestdriveSchedules extends StatefulWidget {
  const TestdriveSchedules({super.key});

  @override
  State<TestdriveSchedules> createState() => _TestdriveSchedulesState();
}

class _TestdriveSchedulesState extends State<TestdriveSchedules> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<TestDriveService>(context, listen: false)
        .getCustomerTestdrive(type: "CUSTOMER");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<FirebaseTestDrive> testdrives =
        context.watch<TestDriveService>().filterTestDriveCars;
    return Scaffold(
        appBar: CustomAppBar.getAppBar(
          function: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(
                  index: 0,
                ),
              ),
              (route) => false,
            );
          },
        ),
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 51,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(gradient: AppColors.gradient),
            child: Text(
              "Your Test Drives",
              style: AppFonts.w700black16,
            ),
          ),
          const FilterDropDown(),
          testdrives.isNotEmpty
              ? ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: testdrives.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    if (testdrives == []) {
                      return Column(
                        children: [
                          Text(
                            "No Scheduled Test Drives",
                            style: AppFonts.w500black16,
                          )
                        ],
                      );
                    } else {
                      return TestdriveCard(testdrive: testdrives[index]);
                    }
                  })
              : Column(
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    Center(
                      child: Text(
                        "No Scheduled Test Drives",
                        style: AppFonts.w500black16,
                      ),
                    )
                  ],
                ),
          const SizedBox(
            height: 60,
          )
        ])));
  }
}
