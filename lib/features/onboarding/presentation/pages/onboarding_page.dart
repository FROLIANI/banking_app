import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:banking/app/routes.dart';
import 'package:banking/core/widgets/page_dots.dart';
import 'package:banking/core/widgets/primary_button.dart';
import 'package:banking/core/widgets/text_button_link.dart';

import 'package:banking/features/onboarding/presentation/slides/encrypted_slide.dart';
import 'package:banking/features/onboarding/presentation/slides/meela_slide.dart';
import 'package:banking/features/onboarding/presentation/slides/easy_to_use_slide.dart';
import 'package:banking/features/onboarding/presentation/slides/watch_tutorial_slide.dart';
import 'package:banking/features/onboarding/presentation/slides/fast_secure_slide.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late final PageController _controller;
  int _index = 0;

  final List<Widget> slides = const [
    EncryptedSlide(),
    MeelaSlide(),
    EasyToUseSlide(),
    WatchTutorialSlide(),
    FastSecureSlide(),
  ];

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool get _isLast => _index == slides.length - 1;

  // Based on your UI: skip appears on slide 0, 2, 4
  bool get _showSkip => _index == 0 || _index == 2 || _index == 4;

  Future<void> _goNextOrFinish() async {
    HapticFeedback.selectionClick();

    if (_isLast) {
      Navigator.pushReplacementNamed(context, AppRoutes.signUp);
      return;
    }

    await _controller.nextPage(
      duration: const Duration(milliseconds: 320),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // ✅ top-right skip (only on specific slides)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (_showSkip)
                    TextButtonLink(label: "Skip", onTap: _goNextOrFinish)
                  else
                    const SizedBox(height: 40),
                ],
              ),
            ),

            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: slides.length,
                onPageChanged: (i) => setState(() => _index = i),
                itemBuilder: (_, i) => slides[i],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 6, bottom: 14),
              child: PageDots(count: slides.length, index: _index),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
              child: PrimaryButton(label: "Next", onPressed: _goNextOrFinish),
            ),
          ],
        ),
      ),
    );
  }
}
