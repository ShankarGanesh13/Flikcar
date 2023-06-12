import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/screens/account/test_drive/widgets/cancelled_test_drive.dart';
import 'package:flikcar/screens/account/test_drive/widgets/interested_test_drive.dart';
import 'package:flikcar/screens/account/test_drive/widgets/upcoming.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class AccountTestDrive extends StatefulWidget {
  const AccountTestDrive({super.key});
  static List<String> testDrive = ["Upcoming", "Interested", "Cancelled"];

  @override
  State<AccountTestDrive> createState() => _AccountTestDriveState();
}

class _AccountTestDriveState extends State<AccountTestDrive> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.getAppBar(),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.all(8),
          height: 49,
          width: MediaQuery.of(context).size.width,
          color: const Color.fromARGB(255, 234, 255, 246),
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
                                ? Color(0xff161F31)
                                : const Color(0xff45C08D),
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          AccountTestDrive.testDrive[index],
                          style: AppFonts.w500white14,
                        ),
                      ),
                    ),
                  )),
        ),
        selectFilter(),
      ]),
    );
  }

  Widget selectFilter() {
    if (selectedIndex == 0) {
      return const UpcomingTestDrive();
    }
    if (selectedIndex == 1) {
      return const InterestedTestDrive();
    }
    if (selectedIndex == 2) {
      return const CancelledTestDrive();
    }
    return const SizedBox();
  }
}
