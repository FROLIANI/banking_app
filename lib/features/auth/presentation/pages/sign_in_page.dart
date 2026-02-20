import 'package:flutter/material.dart';
import 'package:banking/app/routes.dart';
import 'package:banking/core/widgets/app_text_field.dart';
import 'package:banking/core/widgets/primary_button.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top,
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),

                  /// ===== Title =====
                  const Text(
                    "Sign In\nTo Account",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w800,
                      height: 1.2,
                      letterSpacing: 0.3,
                    ),
                  ),

                  const SizedBox(height: 16),

                  /// ===== Subtitle =====
                  const Text(
                    "Sign in with username or email and\npassword to use your account.",
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.6,
                      color: Colors.black54,
                    ),
                  ),

                  const SizedBox(height: 40),

                  /// ===== Username Label =====
                  const Text(
                    "Username or Email",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const AppTextField(
                    hint: "Enter your username or email",
                  ),

                  const SizedBox(height: 24),

                  /// ===== Password Label =====
                  const Text(
                    "Password",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const AppTextField(
                    hint: "Enter your password",
                    obscureText: true,
                  ),

                  const SizedBox(height: 32),

                  /// ===== Primary Button (Blue Active) =====
                  PrimaryButton(
                    label: "Sign in",
                    onPressed: () {
                      // attach auth logic
                    },
                  ),

                  const SizedBox(height: 16),

                  /// ===== Apple Button =====
                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.apple, size: 20),
                      label: const Text(
                        "Sign in with Apple ID",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                    ),
                  ),

                  const Spacer(),

                  /// ===== Bottom Link =====
                  Center(
                    child: GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, AppRoutes.signUp),
                      child: const Padding(
                        padding: EdgeInsets.only(bottom: 20),
                        child: Text(
                          "Don't have an account?  Sign Up",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}