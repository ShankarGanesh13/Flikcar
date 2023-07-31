import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/models/customer_testdrive.dart';
import 'package:flikcar/screens/account/test_drive/widgets/cancelled_test_drive.dart';
import 'package:flikcar/screens/account/test_drive/widgets/interested_test_drive.dart';
import 'package:flikcar/screens/account/test_drive/widgets/upcoming.dart';
import 'package:flikcar/screens/buy_car_flow/provider/buy_car_provider.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AccountTestDrive extends StatefulWidget {
  const AccountTestDrive({super.key});

  @override
  State<AccountTestDrive> createState() => _AccountTestDriveState();
}

class _AccountTestDriveState extends State<AccountTestDrive> {
  int selectedIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    // Provider.of<BuyCarProvider>(context, listen: false)
    //     .filterTestDrive(filter: "All");
    super.initState();
  }

  List<String> testDrives = [
    "All",
    "Upcoming",
    "Completed",
  ];

  @override
  Widget build(BuildContext context) {
    List<CustomerTestDrive> testDrive =
        context.watch<BuyCarProvider>().filterTestDriveCars;
    return Scaffold(
      appBar: CustomAppBar.getAppBar(),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            padding: const EdgeInsets.all(8),
            height: 49,
            width: MediaQuery.of(context).size.width,
            // color: const Color.fromARGB(255, 234, 255, 246),
            decoration: BoxDecoration(gradient: AppColors.gradient),
            child: Row(children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.chevron_left,
                  color: Color(0xff45C08D),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Test Drives",
                style: AppFonts.w700black16,
              )
            ]),
          ),
          Row(
            children: List.generate(
                3,
                (index) => GestureDetector(
                      onTap: () {
                        selectedIndex = index;
                        Provider.of<BuyCarProvider>(context, listen: false)
                            .filterTestDrive(filter: testDrives[index]);
                        setState(() {});
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, top: 15, bottom: 15),
                        child: Container(
                          height: 31,
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 5, left: 10, right: 10),
                          decoration: BoxDecoration(
                              color: selectedIndex == index
                                  ? const Color(0xff161F31)
                                  : const Color(0xff45C08D),
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            testDrives[index],
                            style: AppFonts.w500white14,
                          ),
                        ),
                      ),
                    )),
          ),
          selectFilter(testDrive),
        ]),
      ),
    );
  }

  Widget selectFilter(List<CustomerTestDrive> testdrive) {
    if (selectedIndex == 0) {
      return UpcomingTestDrive(
        testdrive: testdrive,
      );
    }
    if (selectedIndex == 1) {
      return UpcomingTestDrive(
        testdrive: testdrive,
      );
    }
    if (selectedIndex == 2) {
      return UpcomingTestDrive(
        testdrive: testdrive,
      );
    }
    return const SizedBox();
  }
}
