import 'package:flutter/material.dart';

class UploadImage extends StatelessWidget {
  const UploadImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 136,
      width: 136,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: Color(0xffE0E0E0)),
      child: const Icon(
        Icons.photo_camera_outlined,
        color: Color(0xff606060),
        size: 50,
      ),
    );
  }
}
