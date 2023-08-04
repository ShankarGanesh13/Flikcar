import 'package:flikcar/common_widgets/heading1.dart';
import 'package:flikcar/common_widgets/secondary_button.dart';
import 'package:flikcar/models/brand_model_varient.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/provider/selling_process_provider.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/widgets/my_text_field.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectCarModel extends StatelessWidget {
  final PageController controller;

  SelectCarModel({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    int selectedIndex = context.watch<SellingProcessProvider>().modelIndex;
    List<Model> models = context.watch<SellingProcessProvider>().selecedModels;
    return SingleChildScrollView(
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Heading1(title1: "Select the car Model", title2: ""),
            const SizedBox(height: 15),
            // Text(
            //   "Popular Models",
            //   style: AppFonts.w500dark214,
            // ),
            //   const SizedBox(height: 10),
            Wrap(
              spacing: 20,
              runSpacing: 15,
              children: List.generate(
                models.length,
                (index) => InkWell(
                  onTap: () {
                    Provider.of<SellingProcessProvider>(context, listen: false)
                        .setCarModel(
                            modelid: models[index].modelId.toString(),
                            index: index,
                            model: models[index].name);

                    print(index);
                  },
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 8, bottom: 8, left: 4, right: 4),
                    height: 40,
                    width: MediaQuery.of(context).size.width / 2.3,
                    decoration: BoxDecoration(
                      color:
                          selectedIndex != index ? Colors.white : AppColors.p2,
                      border: Border.all(
                        color: AppColors.grey,
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: Text(
                        models[index].name,
                        style: selectedIndex == index
                            ? AppFonts.w500white14
                            : AppFonts.w500black14,
                        maxLines: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // Text(
            //   "Popular Models",
            //   style: AppFonts.w500dark214,
            // ),
            const SizedBox(height: 10),
            // const MyTextField(hint: "Search your car model", maxlength: 20),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
