import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/screens/account/sell_request/sell_request.dart';
import 'package:flikcar/screens/account/test_drive/test_drive.dart';
import 'package:flikcar/services/auth_service.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class DealerAccountScreen extends StatelessWidget {
  const DealerAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar.getAppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            profileDetails(
                title: "Flikcar", subtitle: "+91 9842129106", icon: Icons.edit),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AccountTestDrive(),
                    ));
              },
              child: profileDetails(
                  title: "Wishlisted Vehicles",
                  subtitle: "View your shortlisted vehicles",
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
                  title: "Help and Support",
                  subtitle: "Need help? Chat with us.",
                  icon: Icons.chevron_right),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                AuthService.signout(context);
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
}
