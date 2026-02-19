import 'package:flutter/material.dart';

class OtpBoxes extends StatelessWidget {
  final List<String> digits;
  const OtpBoxes({super.key, required this.digits});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (i) {
        final val = i < digits.length ? digits[i] : '';
        final isFilled = val.isNotEmpty;
        return Container(
          width: 56,
          height: 56,
          margin: const EdgeInsets.symmetric(horizontal: 6),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isFilled ? const Color(0xFFBFEFEA) : const Color(0xFFEFF6F6),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Text(
            val,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        );
      }),
    );
  }
}
