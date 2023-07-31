import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/screens/account/test_drive/test_drive.dart';
import 'package:flikcar/services/dealer_auth_service.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class DealerAccountScreen extends StatelessWidget {
  const DealerAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar.getAppBar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder(
                  future: getDealerPhone(),
                  builder: (context, snapshot) {
                    if (snapshot.data != null) {
                      return profileDetails(
                        title: "Your Phone Number",
                        subtitle: "+91 ${snapshot.data}",
                      );
                    } else {
                      return profileDetails(
                        title: "Your Phone Number",
                        subtitle: "+91 987461230",
                      );
                    }
                  }),

              // GestureDetector(
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => const AccountTestDrive(),
              //         ));
              //   },
              //   child: profileDetails(
              //       title: "Wishlisted Vehicles",
              //       subtitle: "View your shortlisted vehicles",
              //       icon: Icons.chevron_right),
              // ),
              GestureDetector(
                onTap: () {
                  openUrl(
                      url: "https://www.flikcar.com/about-us/",
                      context: context);
                },
                child: profileDetails(
                    title: "About Us",
                    subtitle: "About the company",
                    icon: Icons.chevron_right),
              ),
              GestureDetector(
                onTap: () {
                  openUrl(
                      url: "https://www.flikcar.com/privacy-policy/",
                      context: context);
                },
                child: profileDetails(
                    title: "Privacy Policy",
                    subtitle: "View our privacy policy",
                    icon: Icons.chevron_right),
              ),
              GestureDetector(
                onTap: () {
                  openUrl(
                      url: "https://www.flikcar.com/terms-conditions/",
                      context: context);
                },
                child: profileDetails(
                    title: "Terms and Conditions",
                    subtitle: "View our terms and conditions",
                    icon: Icons.chevron_right),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  DealerAuthService.dealerLogout(context);
                },
                child: Row(
                  children: [
                    const Spacer(),
                    const Icon(
                      Icons.logout,
                      color: Colors.black,
                    ),
                    Text(
                      "  Logout    ",
                      style: AppFonts.w700black16,
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget profileDetails({
    required String title,
    required String subtitle,
    IconData? icon,
  }) {
    return Column(
      children: [
        Container(
          color: Colors.transparent,
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppFonts.w700black16,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    subtitle,
                    style: AppFonts.w500dark214,
                  )
                ],
              ),
              const Spacer(),
              icon != null
                  ? Icon(
                      icon,
                      weight: 700,
                    )
                  : const SizedBox(),
            ],
          ),
        ),
        const Divider(
          height: 0,
          color: Color.fromARGB(255, 177, 177, 177),
        )
      ],
    );
  }

  openUrl({required String url, required BuildContext context}) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  Future<String> getDealerPhone() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    final String? phone = sp.getString('dealerPhone');

    return phone!;
  }
}
