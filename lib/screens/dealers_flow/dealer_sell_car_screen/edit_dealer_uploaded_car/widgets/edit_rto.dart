import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flikcar/firebase_models/firebase_buyer_car.dart';
import 'package:flikcar/models/brand_model_varient.dart';
import 'package:flikcar/models/rto_model.dart';
import 'package:flikcar/services/dealer_upload_car.dart';
import 'package:flikcar/services/get_brand_model_varient.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditRtoDropdown extends StatefulWidget {
  final FirebaseBuyerCar car;
  const EditRtoDropdown({super.key, required this.car});

  @override
  State<EditRtoDropdown> createState() => _RtoDropdownState();
}

class _RtoDropdownState extends State<EditRtoDropdown> {
  String? selectedRto;
  @override
  void initState() {
    print(widget.car.properties.RTOlocation);
    selectedRto = widget.car.properties.RTOlocation;

    print(selectedRto);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "RTO Location *",
          style: AppFonts.w700black16,
        ),
        const SizedBox(
          height: 10,
        ),
        FutureBuilder<List<Rto>>(
            future: GetBrandModelVarient.getRtoLocations(),
            builder: (context, snapshot) {
              //  print(snapshot.data);
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
                            value: item.rtoName,
                            child: Text("${item.rtoName} ( ${item.rtoCode} )",
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
                    debugPrint(value);
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
