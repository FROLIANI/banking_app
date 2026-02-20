import 'package:flutter/material.dart';

class AppCheckboxTile extends StatelessWidget {
  final bool value;
  final String text;
  final ValueChanged<bool?> onChanged;

  const AppCheckboxTile({
    super.key,
    required this.value,
    required this.text,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () => onChanged(!value),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedScale(
              scale: value ? 1.05 : 1.0,
              duration: const Duration(milliseconds: 140),
              curve: Curves.easeOut,
              child: Checkbox(
                value: value,
                onChanged: onChanged,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
              ),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: AnimatedOpacity(
                opacity: value ? 1.0 : 0.88,
                duration: const Duration(milliseconds: 140),
                curve: Curves.easeOut,
                child: Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(
                    text,
                    style: const TextStyle(
                      fontSize: 12.5,
                      height: 1.4,
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}