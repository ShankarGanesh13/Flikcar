import 'package:flikcar/screens/home_screen/home_screen.dart';
import 'package:flikcar/screens/sell_car_flow/sell_home_screen/sell_car_home_screen.dart';
import 'package:flikcar/screens/start_screen/widgets/option_card.dart';
import 'package:flutter/material.dart';

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
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Color(0xff100049), Color(0xffB70050)],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15, top: 2),
                    child: Column(children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
                        },
                        child: OptionCard(
                          title: "Sell Car",
                          imagePath: "assets/sell_car.png",
                        ),
                      ),
                      OptionCard(
                        title: "Buy Car",
                        imagePath: "assets/buy_car.png",
                      ),
                      OptionCard(
                        title: "Auction\nHouse",
                        imagePath: "assets/auction_house.png",
                      ),
                    ]),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
