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
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<String> images = widget.car.carImages;

    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 4,
          width: MediaQuery.of(context).size.width,
          child: Image.network(
            "https://admin.flikcar.com/${images[selectedIndex]}",
            fit: BoxFit.cover,
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
                        "https://admin.flikcar.com/${images[index]}",
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
}
