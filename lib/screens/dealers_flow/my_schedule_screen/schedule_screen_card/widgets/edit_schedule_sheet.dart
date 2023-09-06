import 'package:flikcar/screens/dealers_flow/my_schedule_screen/cancel_schedule/cancel_schedule.dart';
import 'package:flikcar/screens/dealers_flow/my_schedule_screen/cancel_schedule/widgets/cancel_reason.dart';
import 'package:flikcar/screens/dealers_flow/my_schedule_screen/reschedule_screen/reschedule_screen.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class EditScheduleSheet extends StatelessWidget {
  const EditScheduleSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.all(15),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )),
      child: Column(children: [
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
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const RescheduleScreen()));
          },
          child: Row(
            children: [
              const Icon(Icons.watch_later_outlined),
              const SizedBox(
                width: 8,
              ),
              Text(
                "Reschedule Test Drive",
                style: AppFonts.w700black16,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const CancelSchedule()));
          },
          child: Row(
            children: [
              const Icon(Icons.close),
              const SizedBox(
                width: 8,
              ),
              Text(
                "Cancel Test Drive",
                style: AppFonts.w700black16,
              )
            ],
          ),
        )
      ]),
    );
  }
}
