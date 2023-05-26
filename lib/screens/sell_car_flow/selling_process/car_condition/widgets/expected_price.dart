import 'package:flikcar/utils/fonts.dart';
import 'package:flutter/material.dart';

class ExpectedPrice extends StatelessWidget {
  ExpectedPrice({super.key});
  final TextEditingController minPrice = TextEditingController();
  final TextEditingController maxPrice = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What is your expected sell price?",
              style: AppFonts.w500dark214,
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                textField(context: context, controller: minPrice, hint: "min"),
                Text(
                  "-",
                  style: AppFonts.w700black16,
                ),
                textField(context: context, controller: maxPrice, hint: "max")
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget textField(
      {required BuildContext context,
      required TextEditingController controller,
      required String hint}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 2.5,
      height: 40,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.only(left: 12, right: 12, top: 4, bottom: 4),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          counterText: "",
          counterStyle: const TextStyle(color: Colors.transparent),
          hintText: hint,
          icon: const Text(
            "₹",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        maxLength: 8,
        onChanged: (value) {},
        validator: (value) {
          if (value!.length < 5) {
            return "Enter a valid price";
          }
          return null;
        },
      ),
    );
  }
}
