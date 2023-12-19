import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/models/image_model.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/firebase_auction_car_detail_screen/widgets/dealer_car_image_viewer/widgets/dealer_image_list.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/firebase_auction_car_detail_screen/widgets/dealer_car_image_viewer/widgets/video_thumbnail.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class DealerCarImageViewer extends StatefulWidget {
  final List<FirebaseImageModel> images;
  final List<FirebaseVideoModel> videos;
  const DealerCarImageViewer(
      {super.key, required this.images, required this.videos});

  @override
  State<DealerCarImageViewer> createState() => _DealerCarImageViewerState();
}

class _DealerCarImageViewerState extends State<DealerCarImageViewer> {
  @override
  void initState() {
    setImages(imageType: "ext");
    // getImages();
    super.initState();
  }

  List<FirebaseImageModel> currentImages = [];

  int selectedIndex = 0;
  List<String> imageSection = [
    "Videos",
    "Exterior",
    "Interior",
    "Engine",
    "Tyres",
    "Others",
    "Dents",
  ];
  List<String> imageTypes = [
    "",
    "ext",
    "int",
    "engine",
    "tyre",
    "other",
    "dent",
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
                            if (selectedIndex != 0) {
                              setImages(
                                imageType: imageTypes[selectedIndex],
                              );
                            }
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
              child: selectedIndex != 0
                  ? currentImages.isNotEmpty
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
                        )
                  : widget.videos.isNotEmpty
                      ? VideoThumbnail(videos: widget.videos)
                      : Column(
                          children: [
                            const SizedBox(
                              height: 100,
                            ),
                            Center(
                              child: Text(
                                "No Videos Found",
                                style: AppFonts.w500black14,
                              ),
                            ),
                          ],
                        ))
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
        .where((element) => element.imageType.toLowerCase() == imageType)
        .toList();
    setState(() {});
  }
}
