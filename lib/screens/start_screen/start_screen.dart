import 'package:flikcar/screens/home_screen/home_screen.dart';
import 'package:flikcar/screens/onbording_screens/dealer_onboarding/dealer_details.dart';
import 'package:flikcar/screens/onbording_screens/phone_number/phone_number.dart';
import 'package:flikcar/screens/sell_car_flow/sell_home_screen/sell_car_home_screen.dart';
import 'package:flikcar/screens/start_screen/widgets/option_card.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
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
                          child: Image.asset("assets/flikcar_logo.png")),
                    )),
                  ],
                ),
              ),
              Expanded(
                child: Container(
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
                              builder: (context) => FutureBuilder<bool>(
                                  future: isLoggedIn(context),
                                  builder: (context, snapshot) {
                                    if (snapshot.data == true) {
                                      return const HomeScreen(index: 1);
                                    } else {
                                      return PhoneNumber();
                                    }
                                  }),
                            ),
                          );
                        },
                        child: OptionCard(
                          title: "Buy Car &\nSell Car",
                          imagePath: "assets/buy_car.png",
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DealerDetails()));
                        },
                        child: OptionCard(
                          title: "Dealers'\nPortal",
                          imagePath: "assets/auction_house.png",
                        ),
                      ),
                    ]),
                  ),
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
