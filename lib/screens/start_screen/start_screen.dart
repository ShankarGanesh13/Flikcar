import 'package:flikcar/common_widgets/loading_widget.dart';
import 'package:flikcar/screens/dealers_flow/dealer_flow.dart';
import 'package:flikcar/screens/dealers_flow/not_verified_dealer/not_verified_delaer.dart';
import 'package:flikcar/screens/home_screen/home_screen.dart';
import 'package:flikcar/screens/onbording_screens/dealer_onboarding/dealer_details.dart';
import 'package:flikcar/screens/onbording_screens/dealer_onboarding/dealer_phone_number.dart';
import 'package:flikcar/screens/onbording_screens/phone_number/phone_number.dart';
import 'package:flikcar/screens/start_screen/widgets/option_card.dart';
import 'package:flikcar/services/auction_services.dart';
import 'package:flikcar/services/facebook_events.dart';
import 'package:flikcar/services/firebase_auth_service/firebase_auth_service.dart';
import 'package:flikcar/services/firebase_events.dart';
import 'package:flikcar/services/get_car_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home_screen/provider/check_internet_provider.dart';

class StartScreen extends StatefulWidget {
  StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<CheckInternetProvider>(context, listen: false)
        .startStreaming(context);
    super.initState();
  }

  //final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 230,
                child: Stack(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 230,
                      child: Image.asset(
                        "assets/background.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      child: Container(
                        height: 230,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                    Positioned(
                        child: Center(
                      child: SizedBox(
                          height: 109,
                          width: 169,
                          child: Image.asset("assets/flikcar_logo2.png")),
                    )),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(color: Color(0xff161F31)
                    // gradient: LinearGradient(
                    //   begin: Alignment.topRight,
                    //   end: Alignment.bottomLeft,
                    //   colors: [Color(0xff100049), Color(0xffB70050)],
                    // ),
                    ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 2),
                  child: Column(children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen(index: 0)
                              // FutureBuilder<bool>(
                              //     future: isLoggedIn(context),
                              //     builder: (context, snapshot) {
                              //       if (snapshot.data == true) {
                              //         return const HomeScreen(index: 1);
                              //       } else {
                              //         return PhoneNumber();
                              //       }
                              //     }),
                              ),
                        );
                        //   FirebaseEvents().customerPortalEvent();
                        // FacebookEvents().customerPortalEvent();
                      },
                      child: OptionCard(
                        title: "Buy Car &\nSell Car",
                        imagePath: "assets/buy_car.png",
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        final SharedPreferences sp =
                            await SharedPreferences.getInstance();
                        final String? userType = sp.getString('userType');

                        debugPrint("-----------userType------- $userType");
                        FirebaseAuthService.navigateUserBasedOnType(
                            userType: userType!, context: context);
                        //   FirebaseEvents().dealerPortalEvent();
                        //  FacebookEvents().dealerPortalEvent();
                        // Provider.of<AuctionService>(context, listen: false)
                        //     .connectToSocket();
                      },
                      child: OptionCard(
                        title: "Dealers'\nPortal",
                        imagePath: "assets/auction_house.png",
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ]),
                ),
              )
            ],
          ),
        ));
  }

  Future<bool> isLoggedIn(context) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final bool? loggedIn = sp.getBool('isLoggedIn');

    if (loggedIn == true) {
      return true;
    } else {
      return false;
    }
  }
}
