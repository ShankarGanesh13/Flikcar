import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flikcar/common_widgets/loading_widget.dart';
import 'package:flikcar/models/buyer_car_model.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flutter/material.dart';

class ImageViewer extends StatefulWidget {
  BuyerCar car;
  ImageViewer({super.key, required this.car});

  @override
  State<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
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
    List<String> images = widget.car.carImages;

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            MultiImageProvider multiImageProvider =
                MultiImageProvider(_imageProviders);
            showImageViewerPager(context, multiImageProvider,
                backgroundColor: Colors.white,
                closeButtonColor: Colors.black,
                swipeDismissible: true,
                doubleTapZoomable: true);
          },
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 3.8,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              images.isNotEmpty
                  ? "https://webservice.flikcar.com:8000/public/${images[selectedIndex]}"
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
                        "https://webservice.flikcar.com:8000/public/${images[index]}",
                        fit: BoxFit.cover,
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
                );
              }),
        )
      ],
    );
  }

  getImages() {
    _imageProviders = [];
    widget.car.carImages.forEach((element) {
      _imageProviders.add(
          Image.network("https://webservice.flikcar.com:8000/public/${element}")
              .image);
    });
  }
}
