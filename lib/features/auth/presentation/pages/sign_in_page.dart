import 'dart:async';
import 'package:flutter/material.dart';
import 'package:banking/app/routes.dart';
import 'package:banking/core/widgets/app_text_field.dart';
import 'package:banking/core/widgets/primary_button.dart';
import 'package:banking/core/widgets/social_button.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  String? _usernameErr;
  String? _passwordErr;

  bool _loading = false;

  bool _isValidEmail(String v) {
    final s = v.trim();
    final re = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
    return re.hasMatch(s);
  }

  void _validateUsername(String v) {
    final s = v.trim();
    if (s.isEmpty) {
      setState(() => _usernameErr = "Username or email is required.");
      return;
    }
    if (s.contains("@") && !_isValidEmail(s)) {
      setState(() => _usernameErr = "Enter a valid email address.");
      return;
    }
    setState(() => _usernameErr = null);
  }

  void _validatePassword(String v) {
    final s = v.trim();
    if (s.isEmpty) {
      setState(() => _passwordErr = "Password is required.");
      return;
    }
    if (s.length < 6) {
      setState(() => _passwordErr = "Password must be at least 6 characters.");
      return;
    }
    setState(() => _passwordErr = null);
  }

  bool _validateAll() {
    _validateUsername(_usernameCtrl.text);
    _validatePassword(_passwordCtrl.text);
    return _usernameErr == null && _passwordErr == null;
  }

  Future<void> _submit() async {
    if (_loading) return;

    if (!_validateAll()) return;

    setState(() => _loading = true);

    // sample: simulate request
    await Future.delayed(const Duration(milliseconds: 650));
    if (!mounted) return;

    setState(() => _loading = false);

    // ✅ go dashboard (clear stack)
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.dashboard,
          (route) => false,
    );
  }

  @override
  void dispose() {
    _usernameCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

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
              const Text(
                "Sign In\nTo Account",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  height: 1.2,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Sign in with username or email and\npassword to use your account.",
                style: TextStyle(
                  fontSize: 15,
                  height: 1.6,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 40),

              const Text(
                "Username or Email",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              AppTextField(
                hint: "Enter your username or email",
                controller: _usernameCtrl,
                onChanged: _validateUsername,
                errorText: _usernameErr,
                autofillHints: const [AutofillHints.username, AutofillHints.email],
              ),

              const SizedBox(height: 24),
              const Text(
                "Password",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              AppTextField(
                hint: "Enter your password",
                obscureText: true,
                controller: _passwordCtrl,
                onChanged: _validatePassword,
                errorText: _passwordErr,
                autofillHints: const [AutofillHints.password],
              ),

              const SizedBox(height: 32),

              PrimaryButton(
                label: "Sign in",
                isLoading: _loading,
                onPressed: _submit,
              ),

              const SizedBox(height: 16),

              SocialButton(
                label: "Sign in with Apple ID",
                icon: Icons.apple,
                onPressed: () {},
              ),

              const SizedBox(height: 40),

              Center(
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, AppRoutes.signUp),
                  child: const Text(
                    "Don't have an account? Sign Up",
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