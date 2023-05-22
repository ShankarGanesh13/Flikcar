import 'package:flikcar/common_widgets/heading1.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class ChangeAddress extends StatefulWidget {
  const ChangeAddress({super.key});

  @override
  State<ChangeAddress> createState() => _ChangeAddressState();
}

class _ChangeAddressState extends State<ChangeAddress> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 20),
        height: 400,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Select Address",
                  style: AppFonts.w700black16,
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "X",
                    style: AppFonts.w700black16,
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            const Divider(
              color: Color.fromARGB(255, 122, 122, 122),
              thickness: 1,
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: GestureDetector(
                child: Text(
                  "+ Add new address",
                  style: AppFonts.w700black16,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Divider(
              color: Color.fromARGB(255, 122, 122, 122),
              thickness: 1,
            ),
            const SizedBox(height: 10),
            const Heading1(title1: "Saved Address", title2: ""),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(top: 15),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 218, 218, 218),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Row(children: [
                Icon(Icons.location_on_outlined),
                Spacer(),
                SizedBox(
                  width: 300,
                  child: Text(
                      " 36, 1, Gangotri Bldg, Sativli Kaman Road, Tungareshwar Indl Complex, Vasai (east)"),
                ),
              ]),
            )
          ],
        ),
      ),
    );
    ;
  }
}
