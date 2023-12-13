import 'package:flikcar/common_widgets/snackbar.dart';
import 'package:flikcar/screens/buy_car_flow/filter_applied/filter_applied.dart';
import 'package:flikcar/screens/home_screen/home_screen.dart';
import 'package:flikcar/screens/start_screen/start_screen.dart';
import 'package:flikcar/services/facebook_events.dart';
import 'package:flikcar/services/firebase_events.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomAppBar {
  static PreferredSizeWidget getAppBar({required Function() function}) {
    return AppBar(
      automaticallyImplyLeading: false,
      shadowColor: Colors.transparent,
      backgroundColor: AppColors.s1,
      title: GestureDetector(
        onTap: () {
          function();
        },
        child: Container(
          margin: const EdgeInsets.only(left: 0, top: 8, bottom: 15),
          height: 41,
          width: 70,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.contain,
              image: AssetImage("assets/flikcar_logo2.png"),
            ),
          ),
        ),
      ),
      actions: [
        SizedBox(
          height: 27,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.p2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: EdgeInsets.only(left: 10, right: 10)),
            onPressed: () async {
              //  FirebaseEvents().contactSupport(customerPhone: "customer phone");
              Uri phoneno = Uri(
                scheme: 'tel',
                path: '+91 9830527529',
              );
              if (await launchUrl(phoneno)) {
              } else {}
            },
            child: Row(
              children: [
                const Icon(
                  Icons.phone,
                  color: Colors.white,
                  size: 18,
                ),
                const SizedBox(width: 4),
                Text(
                  "Call Support",
                  style: AppFonts.w500white14,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        )
      ],
    );
  }

  static PreferredSizeWidget getAppBarWithSearch(
      {required BuildContext context,
      required Function() function,
      required Function() function2,
      required ValueChanged<String> onchange,
      required bool back}) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(123.0),
      child: Column(
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            shadowColor: Colors.transparent,
            backgroundColor: AppColors.s1,
            title: GestureDetector(
              onTap: () {
                function2();
              },
              child: Container(
                margin: const EdgeInsets.only(left: 0, top: 8, bottom: 15),
                height: 41,
                width: 70,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage("assets/flikcar_logo2.png"),
                  ),
                ),
              ),
            ),
            actions: [
              SizedBox(
                height: 27,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.p2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: const EdgeInsets.only(left: 10, right: 10),
                  ),
                  onPressed: () async {
                    // FirebaseEvents()
                    //     .contactSupport(customerPhone: "customer phone");
                    // FacebookEvents()
                    //     .contactSupport(customerPhone: "customer phone");
                    Uri phoneno = Uri(
                      scheme: 'tel',
                      path: '+91 9830527529',
                    );
                    if (await launchUrl(phoneno)) {
                    } else {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            MySnackbar.showSnackBar(
                                context, "Unable to open dailer"));
                      }
                    }
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.phone,
                        color: Colors.white,
                        size: 18,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "Call Support",
                        style: AppFonts.w500white14,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              )
            ],
          ),
          Container(
            height: 67,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(top: 12, right: 12, bottom: 12),
            color: AppColors.s1,
            child: Row(
              children: [
                back
                    ? IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                          function();
                        },
                        icon: const Icon(Icons.chevron_left),
                        color: Colors.white,
                      )
                    : const SizedBox(),
                const Spacer(),
                SizedBox(
                  width: back
                      ? MediaQuery.of(context).size.width / 1.2
                      : MediaQuery.of(context).size.width / 1.06,
                  child: TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.only(
                          left: 12, right: 12, top: 6, bottom: 6),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      counterText: "",
                      counterStyle: const TextStyle(color: Colors.transparent),
                      hintText: "Search for Cars",
                      prefixIcon: const Icon(Icons.search),
                    ),
                    onChanged: (value) {
                      onchange(value);
                    },
                    maxLength: 30,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static PreferredSizeWidget getDealerOnboardingAppBar(
      {required String title, required, required BuildContext context}) {
    return AppBar(
      automaticallyImplyLeading: false,
      shadowColor: Colors.transparent,
      backgroundColor: AppColors.s1,
      title: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => StartScreen()),
                  (route) => false);
            },
            child: Container(
              margin: const EdgeInsets.only(left: 0, top: 8, bottom: 15),
              height: 41,
              width: 70,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage("assets/flikcar_logo2.png"),
                ),
              ),
            ),
          ),
          Text(
            title,
            style: AppFonts.w700white16,
          )
        ],
      ),
    );
  }

  static PreferredSizeWidget getAppBarWithContainerSearch(
      {required BuildContext context,
      required Function() function,
      required Function() function2,
      required bool back}) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(123.0),
      child: Column(
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            shadowColor: Colors.transparent,
            backgroundColor: AppColors.s1,
            title: GestureDetector(
              onTap: () {
                function2();
              },
              child: Container(
                margin: const EdgeInsets.only(left: 0, top: 8, bottom: 15),
                height: 41,
                width: 70,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage("assets/flikcar_logo2.png"),
                  ),
                ),
              ),
            ),
            actions: [
              SizedBox(
                height: 27,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.p2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: const EdgeInsets.only(left: 10, right: 10),
                  ),
                  onPressed: () async {
                    // FirebaseEvents()
                    //     .contactSupport(customerPhone: "customer phone");
                    // FacebookEvents()
                    //     .contactSupport(customerPhone: "customer phone");
                    Uri phoneno = Uri(
                      scheme: 'tel',
                      path: '+91 9830527529',
                    );
                    if (await launchUrl(phoneno)) {
                    } else {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            MySnackbar.showSnackBar(
                                context, "Unable to open dailer"));
                      }
                    }
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.phone,
                        color: Colors.white,
                        size: 18,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "Call Support",
                        style: AppFonts.w500white14,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              )
            ],
          ),
          Container(
            height: 67,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(top: 12, right: 12, bottom: 12),
            color: AppColors.s1,
            child: Row(
              children: [
                back
                    ? IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                          // Provider.of<AuctionService>(context, listen: false)
                          //     .clearAuctionCar();
                        },
                        icon: const Icon(Icons.chevron_left),
                        color: Colors.white,
                      )
                    : const SizedBox(),
                const Spacer(),
                GestureDetector(
                  onTap: function,
                  child: Container(
                      height: 47,
                      padding: const EdgeInsets.only(
                          top: 12, right: 12, bottom: 12, left: 12),
                      width: back
                          ? MediaQuery.of(context).size.width / 1.2
                          : MediaQuery.of(context).size.width / 1.06,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: AppColors.dark2,
                            size: 24,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Search for cars",
                            style: AppFonts.w500dark214,
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static PreferredSizeWidget appBarWithBack({required BuildContext context}) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(50),
      child: AppBar(
        automaticallyImplyLeading: false,
        shadowColor: Colors.transparent,
        backgroundColor: AppColors.s1,
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.chevron_left,
                color: Colors.white,
              ),
            ),
            Text(
              "Back To Car Details",
              style: AppFonts.w500white14,
            )
          ],
        ),
      ),
    );
  }
}
