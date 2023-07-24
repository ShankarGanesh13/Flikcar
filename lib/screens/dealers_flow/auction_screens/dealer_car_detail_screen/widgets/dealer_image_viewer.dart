import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flikcar/models/auction_car_model.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flutter/material.dart';

class DealerImageViewer extends StatefulWidget {
  AuctionCar car;
  DealerImageViewer({super.key, required this.car});

  @override
  State<DealerImageViewer> createState() => _DealerImageViewerState();
}

class _DealerImageViewerState extends State<DealerImageViewer> {
  @override
  void initState() {
    getImages();
    print(_imageProviders);
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
                useSafeArea: true,
                doubleTapZoomable: true);
          },
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              images.isNotEmpty
                  ? 'http://webservice.flikcar.com:8000/public/${images[selectedIndex]}'
                  : "https://developers.google.com/static/maps/documentation/maps-static/images/error-image-generic.png",
              fit: BoxFit.cover,
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
                        width: 1.5,
                        color: selectedIndex == index
                            ? AppColors.p2
                            : Colors.transparent),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(6),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Image.network(
                        'http://webservice.flikcar.com:8000/public/${images[index]}',
                        fit: BoxFit.cover,
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
          Image.network("http://webservice.flikcar.com:8000/public/${element}")
              .image);
    });
  }
}
