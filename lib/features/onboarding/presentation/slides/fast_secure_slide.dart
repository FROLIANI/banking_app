import 'package:flutter/material.dart';

class FastSecureSlide extends StatelessWidget {
  const FastSecureSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return const _SimpleSlide(
      image: "assets/images/onboarding/secure.png",
      title: "Fast & Secure",
      description:
          "Don't worry about 3rd Party Hacks. It is fast and secure.",
    );
  }
}

class _SimpleSlide extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const _SimpleSlide({
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
            child: Center(child: Image.asset(image, height: 180)),
          ),
          Text(title, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 12),
          Text(description, textAlign: TextAlign.center),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
