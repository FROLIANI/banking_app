import 'package:flutter/material.dart';
import 'package:banking/app/routes.dart';
import 'package:banking/core/widgets/app_text_field.dart';
import 'package:banking/core/widgets/primary_button.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text(
                "Welcome!",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 8),
              const Text(
                "Please provide following\n details for your new account",
                style: TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 22),

              const AppTextField(hint: "Full Name"),
              const SizedBox(height: 12),
              const AppTextField(hint: "Email Address", keyboardType: TextInputType.emailAddress),
              const SizedBox(height: 12),
              const AppTextField(hint: "Phone Number", keyboardType: TextInputType.phone),
              const SizedBox(height: 16),

              Row(
                children: [
                  Checkbox(value: true, onChanged: (_) {}),
                  const Expanded(
                    child: Text(
                      "By creating your account you have to agree\nwith our Terms and Conditions.",
                      style: TextStyle(fontSize: 12, color: Colors.black54),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10),
              PrimaryButton(
                label: "Sign up my account",
                onPressed: () => Navigator.pushNamed(context, AppRoutes.phoneRegistration),
              ),
              const SizedBox(height: 10),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.apple),
                  label: const Text("Sign up with Apple ID"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ),

              const Spacer(),
              Center(
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, AppRoutes.signIn),
                  child: const Text(
                    "Already have an account?  Sign In",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
