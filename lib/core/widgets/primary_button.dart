import 'package:flutter/material.dart';
import 'package:banking/app/theme/app_theme.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isFullWidth;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isFullWidth = true,
  });

  @override
  Widget build(BuildContext context) {
    final btn = ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.primary,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 6,
        shadowColor: AppTheme.primary.withOpacity(0.25),
      ),
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
    );

    if (!isFullWidth) return btn;
    return SizedBox(width: double.infinity, child: btn);
  }
}
