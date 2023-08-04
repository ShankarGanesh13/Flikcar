import 'package:flikcar/common_widgets/heading1.dart';
import 'package:flikcar/common_widgets/secondary_button.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:expansion_tile_group/expansion_tile_group.dart';

class FrequentQuestions extends StatelessWidget {
  FrequentQuestions({super.key});
  // final jobRoleCtrl = TextEditingController();
  static List<String> question = [
    "What is Flikcar?",
    "How does Flikcar work?",
    "Is the car inspection free?",
    "What documents to sell a car on Flikcar?",
    "Any other relevant documents related to car's ownership",
    "What types of cars does Flikcar accept?",
    "Can I buy used car from Flikcar?",
  ];
  static List<String> answer = [
    "Flikcar is an online platform that allows individuals/ dealers to sell used cars quickly and easily. It offers a hassle-free selling experience by providing a transparent process, free car inspection, instant payment, and assistance with paperwork.",
    "To sell your car on Flikcar, you need to follow these steps:\na. Book an appointment: Schedule a free car inspection at your preferred location.\nb. Car inspection: A Flikcar representative will examine your car's condition, documents, and market value.\nc. Instant offer: Based on the inspection, Flikcar will provide your car with a fair and competitive price.\nd. Documentation and payment: If you agree to the offer, Flikcar will handle the paperwork and transfer the payment instantly to your bank account.",
    "Yes, the car inspection provided by Flikcar is free of cost. There are no charges or fees associated with the inspection process.",
    "To sell your car on Flikcar, you need to provide the following documents:\n• Insurance Certificate/ Cover Note/ Policy\n• Original Invoice\n• Duplicate Keys\n• Service Manual\n• Last Service Receipt\n• Extended Warranty Certificate\nTo avail of the instant payment option for the sale of your car, please bring along the following documents:\n• PAN Card of the registered owner (Mandatory for Payment)\n• 4 Self-attested photos of the registered owner\n• Registered Owner's Aadhar Card / Voter ID Card / Passport\n• Financial documents in case of a financed car\n• 1 Cancelled Cheque\n• GSTIN Registration Certificate (Required only if the car's RC is in the name of the Firm / Company / HUF etc.)",
    "Are there any hidden charges or fees? No, Flikcar does not have any hidden charges or fees. The entire process, including the car inspection, offer generation, paperwork, and payment, is free of cost. The price offered by Flikcar is the amount you will receive for your car.",
    "Flikcar accepts all types of cars, including hatchbacks, sedans, SUVs, and luxury cars, regardless of the make, model, or condition. Whether your car is old or damaged, you can still sell it through Flikcar.",
    "Yes, Flikcar not only facilitates selling cars but also offers a wide range of certified used cars for purchase. You can explore the inventory online, choose a car that meets your requirements, and proceed with the purchase process."
  ];
  @override
  Widget build(BuildContext context) {
    print(answer.length);
    print("||||||||||||||||||");
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
          // const SizedBox(
          //   height: 20,
          // ),
          // SecondaryButton(
          //   title: "See All FAQs",
          //   function: () {},
          // ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  List<ExpansionTileItem> questions() {
    return List.generate(
      question.length,
      (index) => ExpansionTileItem(
        collapsedBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
        title: Text(
          question[index],
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
            answer[index],
            style: AppFonts.w500dark214,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
