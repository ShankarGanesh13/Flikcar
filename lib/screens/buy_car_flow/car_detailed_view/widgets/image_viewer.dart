import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flikcar/common_widgets/loading_widget.dart';
import 'package:flikcar/firebase_models/firebase_buyer_car.dart';
import 'package:flikcar/models/image_model.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flutter/material.dart';

class ImageViewer extends StatefulWidget {
  final FirebaseBuyerCar car;
  const ImageViewer({super.key, required this.car});

  @override
  State<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  @override
  void initState() {
    pageController = PageController(initialPage: selectedIndex);
    getImages();

    // TODO: implement initState
    super.initState();
  }

  late PageController pageController;
  int selectedIndex = 0;
  List<ImageProvider> _imageProviders = [];
  @override
  Widget build(BuildContext context) {
    List<FirebaseImageModel> images = widget.car.images;

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            MultiImageProvider multiImageProvider = MultiImageProvider(
              _imageProviders,
              initialIndex: selectedIndex,
            );
            showImageViewerPager(
              context,
              multiImageProvider,
              backgroundColor: Colors.white,
              closeButtonColor: Colors.black,
              swipeDismissible: true,
              useSafeArea: true,
              doubleTapZoomable: true,
            );
          },
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 4,
            child: PageView.builder(
              controller: pageController,
              itemCount: images.length,
              onPageChanged: (index) {
                selectedIndex = index;

                setState(() {});
              },
              itemBuilder: (context, index) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height / 4,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    '${images[selectedIndex].imageUrl}',
                    fit: BoxFit.contain,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return const LoadingWidget();
                      }
                    },
                  ),
                );
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
                          pageController.animateToPage(
                            selectedIndex,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        });
                      },
                      child: Image.network(
                        images[index].imageUrl,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          } else {
                            return Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: AppColors.grey)),
                                child: const LoadingWidget());
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
    widget.car.images.forEach((element) {
      _imageProviders.add(Image.network(element.imageUrl).image);
    });
  }
}
