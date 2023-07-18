import 'package:flikcar/common_widgets/heading1.dart';
import 'package:flikcar/common_widgets/secondary_button.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/provider/selling_process_provider.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/widgets/my_text_field.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ManufacturingYear extends StatelessWidget {
  final PageController controller;
  const ManufacturingYear({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SingleChildScrollView(
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
              ),
            ),
            const SizedBox(height: 10),
            const SizedBox(
              height: 30,
            ),
            const Heading1(title1: "Enter your contact", title2: "number"),
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
                  hintText: "Eg. 9845264120",
                  prefixIcon: const Icon(Icons.phone_android_rounded),
                ),
                maxLength: 10,
                onChanged: (value) {
                  Provider.of<SellingProcessProvider>(context, listen: false)
                      .setContactNumber(
                    phone: value,
                  );
                },
              ),
            ),
          ],
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