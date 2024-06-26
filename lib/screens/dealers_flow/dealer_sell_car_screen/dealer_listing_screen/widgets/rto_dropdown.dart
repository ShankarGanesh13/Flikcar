import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flikcar/models/rto_model.dart';
import 'package:flikcar/services/get_brand_model_varient.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class RtoDropdown extends StatelessWidget {
  RtoDropdown({super.key});
  int? selectedRto;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "RTO Location",
          style: AppFonts.w700black16,
        ),
        const SizedBox(
          height: 10,
        ),
        FutureBuilder<List<Rto>>(
            future: GetBrandModelVarient.getRto(),
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                return DropdownButtonFormField2(
                  isExpanded: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(3),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(color: AppColors.p1)),
                  ),
                  hint: Text(
                    "Select RTO loaction",
                    style: AppFonts.w500dark214,
                  ),
                  value: selectedRto,
                  items: snapshot.data!
                      .map((item) => DropdownMenuItem(
                            value: item.id,
                            child: Text(
                                "${item.rtoLocation} ( ${item.rtoCode} )",
                                style: AppFonts.w500black14),
                          ))
                      .toList(),
                  validator: (value) {
                    if (value == null) {
                      return "Enter valid data";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    // selectedBodyId = value;
                    // Provider.of<DealerUploadCar>(context, listen: false)
                    //     .getBodyTypeId(id: selectedBodyId!.toString());
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    height: 40,
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 20,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  menuItemStyleData:
                      const MenuItemStyleData(padding: EdgeInsets.all(0)),
                );
              } else {
                return SizedBox();
              }
            }),
      ],
    );
  }
}
