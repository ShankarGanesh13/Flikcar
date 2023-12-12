import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flikcar/common_widgets/loading_widget.dart';
import 'package:flikcar/models/image_model.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flutter/material.dart';

class DealerImageList extends StatelessWidget {
  final List<FirebaseImageModel> currentImages;
  const DealerImageList({super.key, required this.currentImages});

  final int selectedIndex = 0;

  // static List<String> imageSection = [
  //   "Exterior",
  //   "Interior",
  //   "Engine",
  //   "Tyres",
  //   "Others",
  //   "Dents",
  // ];

  static List<ImageProvider> _imageProviders = [];

  @override
  Widget build(BuildContext context) {
    getImages();

    return ListView.builder(
        shrinkWrap: true,
        itemCount: currentImages.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              MultiImageProvider multiImageProvider =
                  MultiImageProvider(_imageProviders, initialIndex: index);
              showImageViewerPager(context, multiImageProvider,
                  backgroundColor: Colors.white,
                  closeButtonColor: Colors.black,
                  useSafeArea: true,
                  swipeDismissible: true,
                  doubleTapZoomable: true);
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 3.5,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    '${currentImages[index].imageUrl}',
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.grey)),
                          child: const Icon(Icons.error));
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.grey)),
                          child: const LoadingWidget(),
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          );
        });
  }

  getImages() {
    _imageProviders = [];
    currentImages.forEach((element) {
      _imageProviders.add(Image.network("${element.imageUrl}").image);
    });
  }
}
