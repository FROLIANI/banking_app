import 'package:flutter/material.dart';
import 'package:banking/app/theme/app_theme.dart';

class MetricCard extends StatelessWidget {
  final String title;
  final String value;
  final int percent;
  final bool primary;

  const MetricCard({
    super.key,
    required this.title,
    required this.value,
    required this.percent,
    this.primary = false,
  });

  @override
  Widget build(BuildContext context) {
    final bg = primary ? AppTheme.primary : Colors.white;
    final fg = primary ? Colors.white : Colors.black87;
    final sub = primary ? Colors.white70 : Colors.black54;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 16,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: primary ? Colors.white.withOpacity(0.16) : const Color(0xFFF2F4F7),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                "$percent%",
                style: TextStyle(
                  color: fg,
                  fontWeight: FontWeight.w800,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(color: sub, fontSize: 12, fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text(value, style: TextStyle(color: fg, fontSize: 14.5, fontWeight: FontWeight.w800)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}