import 'package:firebase_auth/firebase_auth.dart';
import 'package:flikcar/common_widgets/heading1.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/manufacturing_year/custom_drop_down.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/provider/selling_process_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ManufacturingYear extends StatefulWidget {
  final PageController controller;
  const ManufacturingYear({super.key, required this.controller});

  @override
  State<ManufacturingYear> createState() => _ManufacturingYearState();
}

class _ManufacturingYearState extends State<ManufacturingYear> {
  TextEditingController phoneNumberController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void initState() {
    // TODO: implement initState
    phoneNumberController =
        TextEditingController(text: auth.currentUser!.phoneNumber);
    Provider.of<SellingProcessProvider>(context, listen: false)
        .setContactNumber(
      phone: auth.currentUser!.phoneNumber!,
    );
    super.initState();
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const Heading1(
                  title1: "Enter your car", title2: "Registeration Year"),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(
                        left: 12, right: 12, top: 6, bottom: 6),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    counterText: "",
                    counterStyle: const TextStyle(color: Colors.transparent),
                    hintText: "Eg. 2020",
                    prefixIcon: const Icon(Icons.calendar_month),
                  ),
                  maxLength: 4,
                  onChanged: (value) {
                    Provider.of<SellingProcessProvider>(context, listen: false)
                        .setManufacturingYear(
                      year: value,
                    );
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter valid data';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 30),
              CustomDropDown(
                title: "",
                dropdownItems: const [
                  "Immediately",
                  "Within 15 days",
                  "Within 30 days",
                  "After 30 days"
                ],
                onChanged: (value) {
                  Provider.of<SellingProcessProvider>(context, listen: false)
                      .setSellingTime(time: value);
                },
                validate: true,
              ),
              const SizedBox(
                height: 10,
              ),
              const Heading1(title1: "Enter your contact", title2: "number"),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: TextFormField(
                  controller: phoneNumberController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(
                        left: 12, right: 12, top: 6, bottom: 6),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    counterText: "",
                    counterStyle: const TextStyle(color: Colors.transparent),
                    hintText: "Eg. 9845264120",
                    prefixIcon: const Icon(Icons.phone_android_rounded),
                  ),
                  maxLength: 15,
                  onChanged: (value) {
                    Provider.of<SellingProcessProvider>(context, listen: false)
                        .setContactNumber(
                      phone: value,
                    );
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter valid data';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//  Wrap(
//               spacing: 40,
//               runSpacing: 15,
//               children: List.generate(
//                   year.length,
//                   (index) => InkWell(
//                         onTap: () {
//                           Provider.of<SellingProcessProvider>(context,
//                                   listen: false)
//                               .setManufacturingYear(
//                                   year: "2023", selectedIndex: index);

//                           print(index);
//                         },
//                         child: Container(
//                           width: MediaQuery.of(context).size.width,
//                           height: 47,
//                           decoration: BoxDecoration(
//                               color: selectedIndex != index
//                                   ? Colors.white
//                                   : AppColors.p2,
//                               borderRadius: BorderRadius.circular(5),
//                               border: Border.all(
//                                 color: AppColors.grey,
//                               )),
//                           child: Center(
//                               child: Text(
//                             "",
//                             style: selectedIndex == index
//                                 ? AppFonts.w500white14
//                                 : AppFonts.w500black14,
//                           )),
//                         ),
//                       )),
//             ),