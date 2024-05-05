import 'package:firebase_auth/firebase_auth.dart';
import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/screens/account/edit_profile/edit_profile.dart';
import 'package:flikcar/screens/account/sell_request/sell_request.dart';
import 'package:flikcar/screens/account/test_drive/test_drive.dart';
import 'package:flikcar/screens/account/widgets/connect_with_us.dart';
import 'package:flikcar/screens/home_screen/home_screen.dart';
import 'package:flikcar/services/dealer_auth_service.dart';
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
  FirebaseAuth auth = FirebaseAuth.instance;
  String? name = "";
  @override
  Widget build(BuildContext context) {
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // FutureBuilder(
              //     future: getCustomerPhone(),
              //     builder: (context, snapshot) {
              //       if (snapshot.data != null) {
              //         return GestureDetector(
              //           onTap: () {
              //             Navigator.push(
              //                 context,
              //                 MaterialPageRoute(
              //                   builder: (context) => EditProfile(
              //                     phoneNumber: snapshot.data!,
              //                   ),
              //                 ));
              //           },
              //           child: profileDetails(
              //               title: name == "" || name == null
              //                   ? "Your Phone Number"
              //                   : name.toString(),
              //               subtitle: snapshot.data!,
              //               icon: Icons.edit),
              //         );
              //       } else {
              //         return profileDetails(
              //             title: "User",
              //             subtitle: "9874563210",
              //             icon: Icons.edit);
              //       }
              //     }),
              profileDetails(
                  title: "Phone Number",
                  subtitle: auth.currentUser!.phoneNumber!,
                  icon: Icons.abc),
              // GestureDetector(
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => const AccountTestDrive()));
              //   },
              //   child: profileDetails(
              //       title: "Test Drives",
              //       subtitle: "View and manage your test drives",
              //       icon: Icons.chevron_right),
              // ),
              GestureDetector(
                onTap: () {
                  openUrl(url: "https://flikcar.com/about-us");
                },
                child: profileDetails(
                    title: "About Us",
                    subtitle: "Checkout about the company",
                    icon: Icons.chevron_right),
              ),
              GestureDetector(
                onTap: () {
                  openUrl(url: "https://flikcar.com/privacy-policy");
                },
                child: profileDetails(
                    title: "Privacy Policy",
                    subtitle: "View our privacy policy",
                    icon: Icons.chevron_right),
              ),
              GestureDetector(
                onTap: () {
                  openUrl(url: "https://flikcar.com/terms-and-conditions");
                },
                child: profileDetails(
                    title: "Terms and Conditions",
                    subtitle: "View our terms and conditions",
                    icon: Icons.chevron_right),
              ),
              GestureDetector(
                onTap: () {
                  launchEmail();
                },
                child: profileDetails(
                    title: "Mail Us",
                    subtitle: "help@flikcar.com",
                    icon: Icons.chevron_right),
              ),
              GestureDetector(
                onTap: () {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Delete Your Account'),
                      content: const Text(
                          "Warning: This process will delete all associated data and cannot be undone. Are you sure you want to proceed with the deletion?"),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: Text(
                            'Close',
                            style: AppFonts.w500p215,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            DealerAuthService.deleteAccount(context);
                          },
                          child: Text(
                            'OK',
                            style: AppFonts.w500p215,
                          ),
                        ),
                      ],
                    ),
                  );
                },
                child: profileDetails(
                    title: "Delete Account",
                    subtitle: "Remove all your data",
                    icon: Icons.chevron_right),
              ),
              Container(
                color: Colors.transparent,
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "App Version",
                          style: AppFonts.w700black16,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "1.3.9",
                          style: AppFonts.w500dark214,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(
                height: 0,
                color: Color.fromARGB(255, 177, 177, 177),
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
              // Icon(
              //   icon,
              //   weight: 700,
              // )
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

  // Future<String> getCustomerPhone() async {
  //   SharedPreferences sp = await SharedPreferences.getInstance();
  //   final String? phone = sp.getString('custPhone');
  //   name = sp.getString("userName");
  //   return phone!;
  // }

  openUrl({required String url}) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  launchEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'info@myhapp.se',
    );
    if (!await launchUrl(
      emailLaunchUri,
    )) ;
  }
}
//final String? phone = sp.getString('custPhone');