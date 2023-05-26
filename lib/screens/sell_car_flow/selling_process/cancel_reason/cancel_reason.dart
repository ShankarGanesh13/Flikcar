import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/common_widgets/primary_button.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/cancelled_screen/cancelled_screen.dart';
import 'package:flikcar/screens/sell_car_flow/selling_process/provider/evaluation_provider.dart';
import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CancelReason extends StatelessWidget {
  CancelReason({super.key});
  final List<String> reason = [
    "Inspect/Sold at Flikcar",
    "Documents not available",
    "Inspect / Sold elsewhere",
    "Don’t want to sell now",
    "Looking to buy a car",
    "My reason is not listed"
  ];

  @override
  Widget build(BuildContext context) {
    int selectedIndex =
        context.watch<EvaluationProvider>().reasonForCancellingIndex;

    return Scaffold(
      appBar: CustomAppBar.getAppBar(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  const Color(0xff100049).withOpacity(0.10),
                  const Color(0xffB70050).withOpacity(0.10),
                ],
              ),
            ),
            child: Row(children: [
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child:
                      const Icon(Icons.chevron_left, color: Color(0xff9A2870))),
              const SizedBox(
                width: 8,
              ),
              Text(
                "Reason for cancellation",
                style: AppFonts.w700black16,
              )
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(children: [
              Text(
                  "Please let us know your reason for cancelling the inspection.",
                  style: AppFonts.w700s116),
              const SizedBox(height: 15),
              Wrap(
                spacing: 40,
                runSpacing: 15,
                children: List.generate(
                    reason.length,
                    (index) => InkWell(
                          onTap: () {
                            Provider.of<EvaluationProvider>(context,
                                    listen: false)
                                .setReasonForCancelling(
                                    reason: reason[index], index: index);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 47,
                            decoration: BoxDecoration(
                              color: selectedIndex != index
                                  ? Colors.white
                                  : const Color(0xff9A2870),
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: const Color(0xffCDCDCD),
                              ),
                            ),
                            child: Center(
                                child: Text(
                              reason[index],
                              style: selectedIndex == index
                                  ? AppFonts.w500white14
                                  : AppFonts.w500black14,
                            )),
                          ),
                        )),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 4),
              PrimaryButton(
                  title: "Cancel Evaluation",
                  function: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CancelledScreen(),
                      ),
                    );
                  })
            ]),
          ),
        ],
      ),
    );
  }
}
