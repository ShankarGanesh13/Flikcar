import 'package:flikcar/screens/onbording_screens/dealer_onboarding/upload_documents/widgets/upload_image.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class AddressDetails extends StatefulWidget {
  const AddressDetails({super.key});
  static List<String> addressProof = [
    "Aadhar Card",
    "Driving Licence",
    "Passport",
    "Votercard"
  ];

  @override
  State<AddressDetails> createState() => _AddressDetailsState();
}

class _AddressDetailsState extends State<AddressDetails> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Container(
              height: 223,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(bottom: 30),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromRGBO(190, 190, 190, 0.239),
                        spreadRadius: 15,
                        blurRadius: 10,
                        offset: Offset(5, 5)),
                  ],
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Select Address Proof",
                      style: AppFonts.w700black16,
                    ),
                    const SizedBox(height: 20),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: selectAddressProof(
                                title: AddressDetails.addressProof[index],
                                index: index),
                          );
                        })
                  ])),
          Container(
              height: 241,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromRGBO(190, 190, 190, 0.239),
                        spreadRadius: 15,
                        blurRadius: 10,
                        offset: Offset(5, 5)),
                  ],
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Address Proof",
                    style: AppFonts.w700black16,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Front",
                            style: AppFonts.w500black14,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const UploadImage(),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Back",
                            style: AppFonts.w500black14,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const UploadImage(),
                        ],
                      ),
                    ],
                  ),
                ],
              )),
          Container(
            height: 189,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(top: 30),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromRGBO(190, 190, 190, 0.239),
                      spreadRadius: 15,
                      blurRadius: 10,
                      offset: Offset(5, 5)),
                ],
                borderRadius: BorderRadius.circular(10)),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "Please Note:",
                style: AppFonts.w700black16,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(width: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "\u2022",
                            style: AppFonts.w700black16,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.4,
                            child: Text(
                              "Address Proof should be clearly visible",
                              style: AppFonts.w500black14,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "\u2022",
                            style: AppFonts.w700black16,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.4,
                            child: Text(
                              "Upload both sides (front + back)",
                              style: AppFonts.w500black14,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "\u2022",
                            style: AppFonts.w700black16,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.4,
                            child: Text(
                              "You can use upload your Aadhar Card, Driving License, Passport or Voter Id as the address proof",
                              style: AppFonts.w500black14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              )
            ]),
          )
        ],
      ),
    );
  }

  Widget selectAddressProof({required String title, required int index}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Container(
            height: 18,
            width: 18,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                border: Border.all(
                    color: selectedIndex == index
                        ? const Color(0xffFF7A00)
                        : const Color(0xff171717),
                    width: 2)),
            child: CircleAvatar(
                backgroundColor: selectedIndex == index
                    ? const Color(0xffFF7A00)
                    : Colors.transparent),
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: AppFonts.w500black14,
          )
        ],
      ),
    );
  }
}
