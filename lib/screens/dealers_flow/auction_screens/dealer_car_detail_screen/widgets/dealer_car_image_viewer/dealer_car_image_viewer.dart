import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/loading_widget.dart';
import 'package:flikcar/models/image_model.dart';
import 'package:flikcar/screens/buy_car_flow/car_detailed_view/car_image_viewer/widgets/image_list.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/dealer_car_detail_screen/widgets/dealer_car_image_viewer/widgets/dealer_image_list.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class DealerCarImageViewer extends StatefulWidget {
  final List<ImageModel> images;
  const DealerCarImageViewer({super.key, required this.images});

  @override
  State<DealerCarImageViewer> createState() => _DealerCarImageViewerState();
}

class _DealerCarImageViewerState extends State<DealerCarImageViewer> {
  @override
  void initState() {
    setImages(imageType: "1");
    // getImages();
    super.initState();
  }

  List<ImageModel> currentImages = [];

  int selectedIndex = 0;
  List<String> imageSection = [
    "Exterior",
    "Interior",
    "Engine",
    "Tyres",
    "Others",
    "Dents",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(110),
        child: Container(
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(94, 94, 94, 0.243),
              offset: Offset(1, 1),
              blurRadius: 10,
              spreadRadius: 0,
            ),
          ]),
          child: Column(
            children: [
              CustomAppBar.appBarWithBack(context: context),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  color: Colors.white,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: imageSection.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                            setImages(
                              imageType: (index + 1).toString(),
                            );
                          });
                        },
                        child: doucument(
                            title: imageSection[index],
                            context: context,
                            color: selectedIndex == index
                                ? const Color(0xff45C08D)
                                : Colors.transparent),
                      );
                    },
                  ))
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15, top: 3),
        child: Column(children: [
          Expanded(
            child: currentImages.isNotEmpty
                ? DealerImageList(
                    currentImages: currentImages,
                  )
                : Column(
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      Center(
                        child: Text(
                          "No Images Found",
                          style: AppFonts.w500black14,
                        ),
                      ),
                    ],
                  ),
          )
        ]),
      ),
    );
  }

  Widget doucument(
      {required String title,
      required BuildContext context,
      required Color color}) {
    return Container(
      margin: const EdgeInsets.only(right: 18),
      padding: const EdgeInsets.only(top: 3, bottom: 0, left: 8, right: 8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: color,
            width: 5.0,
          ),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 12,
          ),
          Text(
            title,
            style: AppFonts.w600black14,
          ),
          const Spacer(),
        ],
      ),
    );
  }

  setImages({required String imageType}) {
    currentImages = widget.images
        .where((element) => element.imageType == imageType)
        .toList();
    setState(() {});
  }
}
