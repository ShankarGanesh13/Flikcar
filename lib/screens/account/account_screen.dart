import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/screens/account/edit_profile/edit_profile.dart';
import 'package:flikcar/screens/account/sell_request/sell_request.dart';
import 'package:flikcar/screens/account/test_drive/test_drive.dart';
import 'package:flikcar/services/auth_service.dart';
import 'package:flikcar/services/get_car_details.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  String? name = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar.getAppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder(
                future: getCustomerPhone(),
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditProfile(
                                phoneNumber: snapshot.data!,
                              ),
                            ));
                      },
                      child: profileDetails(
                          title: name == "" || name == null
                              ? "Flikcar"
                              : name.toString(),
                          subtitle: snapshot.data!,
                          icon: Icons.edit),
                    );
                  } else {
                    return profileDetails(
                        title: "Flikcar",
                        subtitle: "454545454",
                        icon: Icons.edit);
                  }
                }),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AccountTestDrive()));
              },
              child: profileDetails(
                  title: "Test Drives",
                  subtitle: "View and manage your test drives",
                  icon: Icons.chevron_right),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AccountSellRequest()));
              },
              child: profileDetails(
                  title: "Sell Orders",
                  subtitle: "View, track  and manage your sell orders",
                  icon: Icons.chevron_right),
            ),
            GestureDetector(
              onTap: () {
                openUrl(url: "https://www.flikcar.com/about-us/");
              },
              child: profileDetails(
                  title: "About Us",
                  subtitle: "Checkout about the company",
                  icon: Icons.chevron_right),
            ),
            GestureDetector(
              onTap: () {
                openUrl(url: "https://www.flikcar.com/privacy-policy/");
              },
              child: profileDetails(
                  title: "Privacy Policy",
                  subtitle: "View our privacy policy",
                  icon: Icons.chevron_right),
            ),
            GestureDetector(
              onTap: () {
                openUrl(url: "https://www.flikcar.com/terms-conditions");
              },
              child: profileDetails(
                  title: "Terms and Conditions",
                  subtitle: "View our terms and conditions",
                  icon: Icons.chevron_right),
            ),
            // profileDetails(
            //     title: "Your Cars",
            //     subtitle: "View all your cars and schedule inspection",
            //     icon: Icons.chevron_right),

            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                AuthService.signout(context);
                GetCarDetails().isarClean();
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
        ));
  }

  Widget profileDetails({
    required String title,
    required String subtitle,
    required IconData icon,
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
              Icon(
                icon,
                weight: 700,
              )
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

  Future<String> getCustomerPhone() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    final String? phone = sp.getString('custPhone');
    name = sp.getString("userName");
    return phone!;
  }

  openUrl({required String url}) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
//final String? phone = sp.getString('custPhone');