import 'package:flutter/material.dart';
import 'package:banking/app/routes.dart';
import 'package:banking/core/widgets/otp_boxes.dart';
import 'package:banking/core/widgets/primary_button.dart';

class VerifyAccountPage extends StatefulWidget {
  const VerifyAccountPage({super.key});

  @override
  State<VerifyAccountPage> createState() => _VerifyAccountPageState();
}

class _VerifyAccountPageState extends State<VerifyAccountPage> {
  final List<String> digits = ["5", "7", "4", "1"]; // demo UI

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Verify\nAccount!",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 10),
              const Text(
                "Enter 4-digit Code code we have sent to at\n+0 000 000 0000.",
                style: TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 30),

              Center(child: OtpBoxes(digits: digits)),
              const SizedBox(height: 26),

              const Center(
                child: Text(
                  "This session will end in 60 seconds.\nDidn't get code? Resend Code",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black54),
                ),
              ),

              const Spacer(),
              PrimaryButton(
                label: "Continue",
                onPressed: () => Navigator.pushNamed(context, AppRoutes.transferSuccess),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
