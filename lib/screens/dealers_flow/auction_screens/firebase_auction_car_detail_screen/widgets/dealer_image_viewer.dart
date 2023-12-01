import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flikcar/common_widgets/loading_widget.dart';
import 'package:flikcar/models/auction_car_model.dart';
import 'package:flikcar/models/image_model.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/firebase_auction_car_detail_screen/widgets/dealer_car_image_viewer/dealer_car_image_viewer.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class FirebaseDealerImageViewer extends StatefulWidget {
  List<FirebaseImageModel> carImages;
  FirebaseDealerImageViewer({super.key, required this.carImages});

  @override
  State<FirebaseDealerImageViewer> createState() =>
      _FirebaseDealerImageViewerState();
}

class _FirebaseDealerImageViewerState extends State<FirebaseDealerImageViewer> {
  @override
  void initState() {
    getImages();
    // TODO: implement initState
    super.initState();
  }

  int selectedIndex = 0;
  List<ImageProvider> _imageProviders = [];

  @override
  Widget build(BuildContext context) {
    List<FirebaseImageModel> images = widget.carImages;

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            // MultiImageProvider multiImageProvider =
            //     MultiImageProvider(_imageProviders);
            // showImageViewerPager(context, multiImageProvider,
            //     backgroundColor: Colors.white,
            //     closeButtonColor: Colors.black,
            //     swipeDismissible: true,
            //     useSafeArea: true,
            //     doubleTapZoomable: true);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DealerCarImageViewer(images: images)));
          },
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              images.isNotEmpty
                  ? '${images[selectedIndex].imageUrl}'
                  : "https://developers.google.com/static/maps/documentation/maps-static/images/error-image-generic.png",
              fit: BoxFit.contain,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return const LoadingWidget();
                }
              },
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 85,
          child: ListView.builder(
              itemCount: images.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: false,
              itemBuilder: (context, index) {
                return Container(
                  height: 82,
                  width: 128,
                  margin: const EdgeInsets.only(left: 15, right: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                        width: 2,
                        color: selectedIndex == index
                            ? AppColors.p2
                            : Colors.transparent),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Image.network(
                        '${images[index].imageUrl}',
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          } else {
                            return Container(
                              height: 82,
                              width: 128,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                border:
                                    Border.all(width: 1, color: AppColors.grey),
                              ),
                              child: Center(
                                  child: CircularProgressIndicator(
                                color: AppColors.s1,
                                strokeWidth: 2,
                              )),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }

  getImages() {
    _imageProviders = [];
    widget.carImages.forEach((element) {
      _imageProviders.add(Image.network("${element.imageUrl}").image);
    });
  }
}
