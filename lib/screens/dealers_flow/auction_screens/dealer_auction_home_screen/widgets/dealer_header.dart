import 'package:flutter/material.dart';

class DealerHeader extends StatelessWidget {
  const DealerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 230,
      child: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 230,
            child: Image.asset(
              "assets/auction_house.png",
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            child: Container(
              height: 230,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    const Color(0xff171717).withOpacity(0.6),
                    const Color(0xff171717).withOpacity(0.6)
                  ],
                ),
              ),
            ),
          ),
          const Positioned(
              top: 30,
              left: 15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Deal in Used Cars\nat Best Prices",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit. Nulla .",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
