// import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flikcar/models/brand_model_varient.dart';
// import 'package:flikcar/models/buyer_car_model.dart';
// import 'package:flikcar/services/dealer_upload_car.dart';
// import 'package:flikcar/services/get_brand_model_varient.dart';
// import 'package:flikcar/utils/colors.dart';
// import 'package:flikcar/utils/fonts.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class EditBrandModelVarient extends StatefulWidget {
//   final BuyerCar car;
//   const EditBrandModelVarient({super.key, required this.car});

//   @override
//   State<EditBrandModelVarient> createState() => _EditBrandModelVarientState();
// }

// class _EditBrandModelVarientState extends State<EditBrandModelVarient> {
//   int? selectedBrandId;
//   int? selectedModelId;
//   int? selectedVarientId;
//   List<Varient> varients = [];
//   List<Model> models = [];
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//       Text(
//         "Brand",
//         style: AppFonts.w700black16,
//       ),
//       const SizedBox(
//         height: 10,
//       ),
//       FutureBuilder<List<BrandModelVarient>>(
//           future: GetBrandModelVarient.getBrandModelVarient(),
//           builder: (context, snapshot) {
//             if (snapshot.data != null) {
//               return DropdownButtonFormField2(
//                 isExpanded: true,
//                 decoration: InputDecoration(
//                   contentPadding: const EdgeInsets.all(3),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(5),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                       borderRadius:
//                           const BorderRadius.all(Radius.circular(5.0)),
//                       borderSide: BorderSide(color: AppColors.p1)),
//                 ),
//                 hint: Text(
//                   widget.car.brand,
//                   style: AppFonts.w500dark214,
//                 ),
//                 value: selectedBrandId,
//                 items: snapshot.data!
//                     .map((item) => DropdownMenuItem(
//                           value: item.id,
//                           child: Text(item.name, style: AppFonts.w500black14),
//                         ))
//                     .toList(),
//                 validator: (value) {
//                   if (value == null) {
//                     return "Enter valid data";
//                   }
//                   return null;
//                 },
//                 onChanged: (value) {
//                   setState(() {
//                     selectedModelId = null;
//                     selectedVarientId = null;
//                     selectedBrandId = value;
//                     Provider.of<DealerUploadCar>(context, listen: false)
//                         .getBrandId(id: selectedBrandId!.toString());
//                     models = snapshot.data!
//                         .firstWhere((element) => element.id == value)
//                         .models;
//                   });
//                 },
//                 buttonStyleData: const ButtonStyleData(
//                   padding: EdgeInsets.only(left: 10, right: 10),
//                   height: 40,
//                 ),
//                 iconStyleData: const IconStyleData(
//                   icon: Icon(
//                     Icons.arrow_drop_down,
//                     color: Colors.black45,
//                   ),
//                   iconSize: 20,
//                 ),
//                 dropdownStyleData: DropdownStyleData(
//                   padding: const EdgeInsets.only(left: 10, right: 10),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(5),
//                   ),
//                 ),
//                 menuItemStyleData:
//                     const MenuItemStyleData(padding: EdgeInsets.all(0)),
//               );
//             } else {
//               return SizedBox();
//             }
//           }),
//       const SizedBox(
//         height: 20,
//       ),
//       ////////////////////////////////
//       ///model
//       Text(
//         "Model",
//         style: AppFonts.w700black16,
//       ),
//       const SizedBox(
//         height: 10,
//       ),
//       DropdownButtonFormField2(
//         isExpanded: true,
//         decoration: InputDecoration(
//           contentPadding: const EdgeInsets.all(3),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(5),
//           ),
//           focusedBorder: OutlineInputBorder(
//               borderRadius: const BorderRadius.all(Radius.circular(5.0)),
//               borderSide: BorderSide(color: AppColors.p1)),
//         ),
//         hint: Text(
//           "Select a model",
//           style: AppFonts.w500dark214,
//         ),
//         value: selectedModelId,
//         items: models
//             .map((item) => DropdownMenuItem(
//                   value: item.modelId,
//                   child: Text(item.name, style: AppFonts.w500black14),
//                 ))
//             .toList(),
//         validator: (value) {
//           if (value == null) {
//             return "Enter valid data";
//           }
//           return null;
//         },
//         onChanged: (value) {
//           setState(() {
//             selectedVarientId = null;
//             selectedModelId = value;
//             Provider.of<DealerUploadCar>(context, listen: false)
//                 .getModelId(id: selectedModelId!.toString());
//             varients = models
//                 .firstWhere((element) => element.modelId == value)
//                 .varients;
//           });
//         },
//         buttonStyleData: const ButtonStyleData(
//           padding: EdgeInsets.only(left: 10, right: 10),
//           height: 40,
//         ),
//         iconStyleData: const IconStyleData(
//           icon: Icon(
//             Icons.arrow_drop_down,
//             color: Colors.black45,
//           ),
//           iconSize: 20,
//         ),
//         dropdownStyleData: DropdownStyleData(
//           padding: const EdgeInsets.only(left: 10, right: 10),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(5),
//           ),
//         ),
//         menuItemStyleData: const MenuItemStyleData(padding: EdgeInsets.all(0)),
//       ),
//       const SizedBox(
//         height: 20,
//       ),
//       ////////////////////////
//       ///varient
//       Text(
//         "Varient",
//         style: AppFonts.w700black16,
//       ),
//       const SizedBox(
//         height: 10,
//       ),
//       DropdownButtonFormField2(
//         isExpanded: true,
//         decoration: InputDecoration(
//           contentPadding: const EdgeInsets.all(3),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(5),
//           ),
//           focusedBorder: OutlineInputBorder(
//               borderRadius: const BorderRadius.all(Radius.circular(5.0)),
//               borderSide: BorderSide(color: AppColors.p1)),
//         ),
//         hint: Text(
//           "Select a Varient",
//           style: AppFonts.w500dark214,
//         ),
//         value: selectedVarientId,
//         items: varients
//             .map((item) => DropdownMenuItem(
//                   value: item.varientId,
//                   child: Text(item.name, style: AppFonts.w500black14),
//                 ))
//             .toList(),
//         validator: (value) {
//           if (value == null) {
//             return "Enter valid data";
//           }
//           return null;
//         },
//         onChanged: (value) {
//           setState(() {
//             selectedVarientId = value;
//             Provider.of<DealerUploadCar>(context, listen: false)
//                 .getVarientId(id: selectedVarientId!.toString());
//           });
//         },
//         buttonStyleData: const ButtonStyleData(
//           padding: EdgeInsets.only(left: 10, right: 10),
//           height: 40,
//         ),
//         iconStyleData: const IconStyleData(
//           icon: Icon(
//             Icons.arrow_drop_down,
//             color: Colors.black45,
//           ),
//           iconSize: 20,
//         ),
//         dropdownStyleData: DropdownStyleData(
//           padding: const EdgeInsets.only(left: 10, right: 10),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(5),
//           ),
//         ),
//         menuItemStyleData: const MenuItemStyleData(padding: EdgeInsets.all(0)),
//       )
//     ]);
//   }
// }
