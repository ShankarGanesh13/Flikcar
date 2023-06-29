import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class RescheduleReason extends StatelessWidget {
  const RescheduleReason({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 30,
        ),
        Text(
          "Reason for Reschedule",
          style: AppFonts.w700black16,
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding:
                  const EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 6),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              counterText: "",
              counterStyle: const TextStyle(color: Colors.transparent),
              hintText:
                  "You can explain the reason for rescheduling the test drive to customer",
            ),
            maxLines: 2,
            maxLength: 200,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        PrimaryButton(
            title: "Submit Reason",
            function: () {},
            borderColor: Colors.transparent,
            backgroundColor: AppColors.p2,
            textStyle: AppFonts.w500white14)
      ],
    );
  }
}
