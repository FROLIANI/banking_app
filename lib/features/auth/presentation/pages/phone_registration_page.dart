
import 'package:flutter/material.dart';
import 'package:banking/app/routes.dart';
import 'package:banking/core/widgets/app_text_field.dart';
import 'package:banking/core/widgets/primary_button.dart';

class PhoneRegistrationPage extends StatelessWidget {
  const PhoneRegistrationPage({super.key});

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
                "Phone\nRegistration",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 10),
              const Text(
                "Please enter your valid phone number. We will\nsend you 4-digit code to verify account.",
                style: TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 28),

              const Text("Enter your location", style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF6F6),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Row(
                  children: [
                    Text("🇹🇿"),
                    SizedBox(width: 10),
                    Expanded(child: Text("Africa")),
                    Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              ),

              const SizedBox(height: 22),
              const Text("Enter your phone number", style: TextStyle(fontWeight: FontWeight.w600)),
              const SizedBox(height: 10),
              const AppTextField(hint: "+255 000 000 000", keyboardType: TextInputType.phone),

              const Spacer(),
              PrimaryButton(
                label: "Continue",
                onPressed: () => Navigator.pushNamed(context, AppRoutes.verifyAccount),
              ),
              const SizedBox(height: 14),
              const Center(
                child: Text(
                  "Please review our\nTerms and Conditions Policy",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              const SizedBox(height: 6),
            ],
          ),
        ),
      ),
    );
  }
}
