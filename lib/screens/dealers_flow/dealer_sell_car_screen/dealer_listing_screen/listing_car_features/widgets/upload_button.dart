import 'package:flikcar/common_widgets/loading_widget.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/services/dealer_upload_car.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UploadButton extends StatefulWidget {
  final int selectedIndex;
  const UploadButton({super.key, required this.selectedIndex});

  @override
  State<UploadButton> createState() => _UploadButtonState();
}

class _UploadButtonState extends State<UploadButton> {
  bool _isLoading = false;

  loading() {
    setState(() {
      _isLoading = true;
    });

    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading == false
        ? PrimaryButton(
            backgroundColor: AppColors.s1,
            borderColor: Colors.transparent,
            function: () {
              if (widget.selectedIndex < 4) {
                Provider.of<DealerUploadCar>(context, listen: false)
                    .increaseFeatureIndex();
              } else {
                loading();
                Provider.of<DealerUploadCar>(context, listen: false)
                    .uploadCarToFirestore(context: context);

                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => const ListingCarImages(),
                //     ));
              }
            },
            textStyle: AppFonts.w500white14,
            title: widget.selectedIndex < 4 ? "Next" : "Upload Car")
        : const LoadingWidget();
  }
}
