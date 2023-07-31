import 'package:flikcar/common_widgets/heading1.dart';
import 'package:flikcar/common_widgets/secondary_button.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:expansion_tile_group/expansion_tile_group.dart';

class FrequentQuestions extends StatelessWidget {
  FrequentQuestions({super.key});
  final jobRoleCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromRGBO(22, 31, 49, 0.10),
            Color.fromRGBO(69, 192, 141, 0.10)
          ],
        ),
      ),
      child: Column(
        children: [
          const Padding(
              padding: const EdgeInsets.all(15.0),
              child: Heading1(
                title1: "Frequently Asked",
                title2: "Questions",
              )),
          ExpansionTileGroup(spaceBetweenItem: 10, children: questions()),
          const SizedBox(
            height: 20,
          ),
          SecondaryButton(
            title: "See All FAQs",
            function: () {},
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  List<ExpansionTileItem> questions() {
    return List.generate(
      3,
      (index) => ExpansionTileItem(
        collapsedBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
        title: Text(
          'Why Flikcar is the best place to sell your car?',
          maxLines: 2,
          style: AppFonts.w500s114,
        ),
        iconColor: const Color(0xff9A2870),
        collapsedIconColor: const Color(0xff9A2870),
        expendedBorderColor: Colors.white,
        tilePadding: const EdgeInsets.only(left: 15, bottom: 0, right: 15),
        childrenPadding:
            const EdgeInsets.only(top: 0, left: 15, right: 15, bottom: 15),
        children: [
          Text(
              'Vivamus condimentum vestibulum neque. Ut consectetur scelerisque sagittis. Sed eget eros elementum, bibendum augue nec, placerat quam.',
              style: AppFonts.w500dark214),
        ],
      ),
    );
  }
}
