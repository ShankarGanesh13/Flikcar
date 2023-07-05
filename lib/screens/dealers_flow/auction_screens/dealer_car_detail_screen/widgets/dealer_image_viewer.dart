import 'package:flikcar/utils/colors.dart';
import 'package:flutter/material.dart';

class DealerImageViewer extends StatefulWidget {
  DealerImageViewer({super.key});
  static const List<String> images = [
    "assets/sample_car/tigor1.png",
    "assets/sample_car/tigor2.png",
    "assets/sample_car/tigor3.png",
    "assets/sample_car/tigor4.png"
  ];

  @override
  State<DealerImageViewer> createState() => _DealerImageViewerState();
}

class _DealerImageViewerState extends State<DealerImageViewer> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 4,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            DealerImageViewer.images[selectedIndex],
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 85,
          child: ListView.builder(
              itemCount: DealerImageViewer.images.length,
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
                      child: Image.asset(
                        DealerImageViewer.images[index],
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