
import 'package:flutter/material.dart';
import 'package:banking/app/theme/app_theme.dart';

class PageDots extends StatelessWidget {
  final int count;
  final int index;

  const PageDots({super.key, required this.count, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (i) {
        final selected = i == index;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOut,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: selected ? 26 : 10,
          height: 10,
          decoration: BoxDecoration(
            color: selected ? AppTheme.primary : Colors.black12,
            borderRadius: BorderRadius.circular(999),
          ),
        );
      }),
    );
  }
}
