import 'package:flutter/material.dart';
import 'package:banking/app/theme/app_theme.dart';

class EncryptedSlide extends StatelessWidget {
  const EncryptedSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return _BaseSlide(
      image: "assets/images/onboarding/lock.png",
      title: "Encrypted",
      description:
          "Our new encrypted process makes it more secure between you and your bank.",
    );
  }
}

class _BaseSlide extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const _BaseSlide({
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 30),
          Expanded(
            child: Center(
              child: Image.asset(image, height: 180),
            ),
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 12),
          Text(
            description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
