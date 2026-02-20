import 'package:flutter/material.dart';
import 'package:banking/app/routes.dart';
import 'package:banking/core/widgets/app_text_field.dart';
import 'package:banking/core/widgets/primary_button.dart';
import 'package:banking/core/widgets/app_checkbox_tile.dart';
import 'package:banking/core/widgets/social_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _agreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),

              /// ===== Title =====
              const Text(
                "Welcome!",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 12),

              /// ===== Subtitle =====
              const Text(
                "Please provide following details\nfor your new account",
                style: TextStyle(
                  fontSize: 20,
                  height: 1.6,
                  fontWeight: FontWeight.w700,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 40),

              /// ===== Full Name =====
              const Text(
                "Full Name",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              const AppTextField(
                hint: "Enter your full name",
              ),

              const SizedBox(height: 24),

              /// ===== Email =====
              const Text(
                "Email Address",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              const AppTextField(
                hint: "Enter your email address",
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 24),

              /// ===== Phone =====
              const Text(
                "Phone Number",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              const AppTextField(
                hint: "Enter your phone number",
                keyboardType: TextInputType.phone,
              ),

              const SizedBox(height: 24),

              /// ===== Terms Checkbox =====
              AppCheckboxTile(
                value: _agreed,
                text:
                "By creating your account you have to agree with our Terms and Conditions.",
                onChanged: (v) {
                  setState(() {
                    _agreed = v ?? false;
                  });
                },
              ),

              const SizedBox(height: 28),

              /// ===== Primary Button =====
              PrimaryButton(
                label: "Sign up my account",
                onPressed: _agreed
                    ? () => Navigator.pushNamed(
                  context,
                  AppRoutes.phoneRegistration,
                )
                    : null,
              ),

              const SizedBox(height: 16),

              /// ===== Apple Button =====
              SocialButton(
                label: "Sign up with Apple ID",
                icon: Icons.apple,
                onPressed: () {},
              ),

              const SizedBox(height: 40),

              /// ===== Bottom Link =====
              Center(
                child: GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(context, AppRoutes.signIn),
                  child: const Text(
                    "Already have an account? Sign In",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF4B5CC4),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}