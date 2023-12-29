import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/firebase_models/firebase_testdrive.dart';
import 'package:flikcar/screens/buy_car_flow/provider/test_drive_service.dart';
import 'package:flikcar/screens/dealers_flow/dealer_account_screen/view_dealer_testdrives.dart/widgets/dealer_test_drive_card.dart';
import 'package:flikcar/screens/dealers_flow/dealer_account_screen/view_dealer_testdrives.dart/widgets/dealer_test_drive_dropdown.dart';
import 'package:flikcar/screens/dealers_flow/dealer_flow.dart';
import 'package:flikcar/services/search_service.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewDealerTestDrives extends StatefulWidget {
  const ViewDealerTestDrives({super.key});

  @override
  State<ViewDealerTestDrives> createState() => _ViewDealerTestDrivesState();
}

class _ViewDealerTestDrivesState extends State<ViewDealerTestDrives> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<TestDriveService>(context, listen: false)
        .getCustomerTestdrive(type: "DEALER");
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
                  builder: (context) => const DealerFlow(
                        index: 0,
                      )),
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
            child: Row(
              children: [
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
                  "Your Test Drives",
                  style: AppFonts.w700black16,
                ),
              ],
            ),
          ),
          const DealerTestDriveDropdown(),
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
                      return DealerTestDriveCard(testdrive: testdrives[index]);
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
