
import 'package:flutter/material.dart';
import 'package:banking/app/theme/app_theme.dart';
import 'package:banking/core/widgets/primary_button.dart';
import 'package:banking/core/widgets/secondary_button.dart';

class TransferSuccessPage extends StatelessWidget {
  const TransferSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: AppTheme.primary,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 16),
            child: Column(
              children: [
                const Spacer(),
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.check, size: 60, color: Colors.white),
                ),
                const SizedBox(height: 18),
                const Text(
                  "Transferred\nSuccessfully",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Dear user your amount has been\ntransferred to your requested receipt.\nThank you for using our service.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70),
                ),
                const Spacer(),
                SecondaryButton(label: "View Details", onPressed: () {}),
                const SizedBox(height: 10),
                PrimaryButton(label: "Continue", onPressed: () {}),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
