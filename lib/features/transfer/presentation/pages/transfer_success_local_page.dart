import 'package:flutter/material.dart';
import 'package:banking/app/theme/app_theme.dart';
import 'package:banking/features/dashboard/presentation/pages/dashboard_page.dart';

class TransferSuccessLocalPage extends StatelessWidget {
  const TransferSuccessLocalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primary,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.2),
                ),
                child: const Icon(Icons.check, size: 60, color: Colors.white),
              ),
              const SizedBox(height: 30),
              const Text(
                "Transfer Successful",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(height: 12),
              const Text(
                "Your money has been sent successfully.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: AppTheme.primary,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const DashboardPage()),
                        (route) => false,
                  );
                },
                child: const Text("Back to Home"),
              )
            ],
          ),
        ),
      ),
    );
  }
}