import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class EditListingBottomSheet extends StatelessWidget {
  const EditListingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 217,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Spacer(),
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.close))
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.edit),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Edit Listing",
                    style: AppFonts.w700black16,
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const Icon(Icons.delete_outline),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Delete Listing",
                    style: AppFonts.w700black16,
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const Icon(Icons.share),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Share Listing",
                    style: AppFonts.w700black16,
                  )
                ],
              )
            ],
          ),
        ));
  }
}
