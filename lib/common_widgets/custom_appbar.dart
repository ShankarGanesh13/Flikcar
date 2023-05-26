import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class CustomAppBar {
  static PreferredSizeWidget getAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      shadowColor: Colors.transparent,
      backgroundColor: Color(0xff100049),
      title: Container(
        margin: const EdgeInsets.only(left: 0, top: 8, bottom: 15),
        height: 37,
        width: 59,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/flikcar_logo2.png"),
          ),
        ),
      ),
      actions: [
        SizedBox(
          height: 27,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff9A2870),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: EdgeInsets.only(left: 10, right: 10)),
            onPressed: () {},
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

  static PreferredSizeWidget getBuyCarAppBar(context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(123.0),
      child: Column(
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            shadowColor: Colors.transparent,
            backgroundColor: Color(0xff100049),
            title: Container(
              margin: const EdgeInsets.only(left: 0, top: 8, bottom: 15),
              height: 37,
              width: 59,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/flikcar_logo2.png"),
                ),
              ),
            ),
            actions: [
              SizedBox(
                height: 27,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff9A2870),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: const EdgeInsets.only(left: 10, right: 10),
                  ),
                  onPressed: () {},
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
            padding: const EdgeInsets.all(12),
            color: const Color(0xff100049),
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
              maxLength: 30,
            ),
          ),
        ],
      ),
    );
  }
}
