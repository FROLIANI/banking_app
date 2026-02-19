import 'package:flutter/material.dart';

class OnboardingSlide extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String description;

  // ✅ optional styling for special screens like "Meela"
  final Color? titleColor;
  final Color? descriptionColor;
  final Color? imageTint;

  const OnboardingSlide({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.description,
    this.titleColor,
    this.descriptionColor,
    this.imageTint,
  });

  @override
  Widget build(BuildContext context) {
    final baseTitleStyle = Theme.of(context).textTheme.titleLarge;
    final baseDescStyle = Theme.of(context).textTheme.bodyMedium;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: Center(
              child: Image.asset(
                imageAsset,
                height: 180,
                fit: BoxFit.contain,
                color: imageTint,
              ),
            ),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: baseTitleStyle?.copyWith(color: titleColor),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            textAlign: TextAlign.center,
            style: baseDescStyle?.copyWith(color: descriptionColor),
          ),
          const SizedBox(height: 18),
        ],
      ),
    );
  }
}
