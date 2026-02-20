import 'package:flutter/material.dart';
import 'package:banking/app/theme/app_theme.dart';

class OnboardingSlide extends StatelessWidget {
  final String imageAsset;
  final String title;
  final String description;

  final String primaryButtonLabel;
  final VoidCallback onPrimaryPressed;

  final bool showSkip;
  final VoidCallback? onSkip;

  final Color? titleColor;
  final Color? descriptionColor;
  final Color? imageTint;
  final Color? backgroundColor;

  const OnboardingSlide({
    super.key,
    required this.imageAsset,
    required this.title,
    required this.description,
    required this.primaryButtonLabel,
    required this.onPrimaryPressed,
    this.showSkip = true,
    this.onSkip,
    this.titleColor,
    this.descriptionColor,
    this.imageTint,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final bg = backgroundColor ?? AppTheme.bg;
    final isPrimaryBg = bg == AppTheme.primary;

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: bg,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          children: [

            /// --- TOP CONTENT (centered block like UI) ---
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    imageAsset,
                    height: 150,
                    fit: BoxFit.contain,
                    color: imageTint,
                  ),

                  const SizedBox(height: 40),

                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.2,
                      color: titleColor ??
                          (isPrimaryBg ? Colors.white : Colors.black87),
                    ),
                  ),

                  const SizedBox(height: 14),

                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 280),
                    child: Text(
                      description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.5,
                        height: 1.6,
                        color: descriptionColor ??
                            (isPrimaryBg
                                ? Colors.white.withOpacity(0.85)
                                : Colors.black54),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// --- BOTTOM ACTION AREA ---
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: ElevatedButton(
                    onPressed: onPrimaryPressed,
                    style: ElevatedButton.styleFrom(
                      elevation: 6,
                      shadowColor: Colors.black.withOpacity(0.25),
                      backgroundColor:
                      isPrimaryBg ? Colors.white : AppTheme.primary,
                      foregroundColor:
                      isPrimaryBg ? AppTheme.primary : Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: Text(
                      primaryButtonLabel,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                if (showSkip)
                  GestureDetector(
                    onTap: onSkip,
                    child: Text(
                      "Skip",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: isPrimaryBg
                            ? Colors.white.withOpacity(0.7)
                            : Colors.black.withOpacity(0.45),
                      ),
                    ),
                  ),

                const SizedBox(height: 32),
              ],
            ),
          ],
        ),
      ),
    );
  }
}