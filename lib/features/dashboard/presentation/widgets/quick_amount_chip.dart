import 'package:flutter/material.dart';

class QuickAmountChip extends StatelessWidget {
  final String label;
  final bool active;
  final VoidCallback onTap;

  const QuickAmountChip({
    super.key,
    required this.label,
    required this.active,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        curve: Curves.easeOut,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: active ? const Color(0xFFDDF3F3) : const Color(0xFFF2F4F7),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: active ? Colors.black87 : Colors.black54,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}