import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hint;
  final int maxlength;

  const MyTextField({
    super.key,
    required this.hint,
    required this.maxlength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.only(left: 12, right: 12, top: 6, bottom: 6),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              counterText: "",
              counterStyle: const TextStyle(color: Colors.transparent),
              hintText: hint,
              prefixIcon: const Icon(Icons.search),
            ),
            maxLength: maxlength,
            onChanged: (value) {},
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        //   Text("or, select from given options", style: AppFonts.w500dark214)
      ],
    );
  }
}
