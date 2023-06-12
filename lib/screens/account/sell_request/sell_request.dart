import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/screens/account/sell_request/widgets/cancelled_request.dart';
import 'package:flikcar/screens/account/sell_request/widgets/completed_request.dart';
import 'package:flikcar/screens/account/sell_request/widgets/live_request.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class AccountSellRequest extends StatefulWidget {
  const AccountSellRequest({super.key});

  @override
  State<AccountSellRequest> createState() => _AccountSellRequestState();
}

class _AccountSellRequestState extends State<AccountSellRequest> {
  List<String> sellRequest = ["Live Request", "Cancelled Request", "Completed"];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar.getAppBar(),
        body: Column(
          children: [
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
                  "Sell Requests",
                  style: AppFonts.w700black16,
                )
              ]),
            ),
            SizedBox(
              height: 63,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, top: 15, bottom: 15),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
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
                            sellRequest[index],
                            style: AppFonts.w500white14,
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            selectedSellRequest(),
          ],
        ));
  }

  Widget selectedSellRequest() {
    if (selectedIndex == 0) {
      return const LiveRequest();
    }
    if (selectedIndex == 1) {
      return const CancelledRequest();
    }
    if (selectedIndex == 2) {
      return const CompletedRequest();
    }
    return const SizedBox();
  }
}
