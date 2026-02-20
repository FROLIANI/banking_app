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
  bool _loading = false;

  final _fullNameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();

  String? _fullNameErr;
  String? _emailErr;
  String? _phoneErr;

  bool _isValidEmail(String v) {
    final s = v.trim();
    final re = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
    return re.hasMatch(s);
  }

  void _validateFullName(String v) {
    final s = v.trim();
    setState(() => _fullNameErr = s.isEmpty ? "Full name is required." : null);
  }

  void _validateEmailRealtime(String v) {
    final s = v.trim();
    if (s.isEmpty) {
      setState(() => _emailErr = "Email address is required.");
      return;
    }
    setState(() => _emailErr = _isValidEmail(s) ? null : "Enter a valid email address.");
  }

  void _validatePhone(String v) {
    final s = v.trim();
    if (s.isEmpty) {
      setState(() => _phoneErr = "Phone number is required.");
      return;
    }
    // keep light validation (digits count) - you can tighten later
    final digits = s.replaceAll(RegExp(r'\D'), '');
    setState(() => _phoneErr = digits.length < 9 ? "Enter a valid phone number." : null);
  }

  bool _validateAll() {
    _validateFullName(_fullNameCtrl.text);
    _validateEmailRealtime(_emailCtrl.text);
    _validatePhone(_phoneCtrl.text);

    final ok = (_fullNameErr == null && _emailErr == null && _phoneErr == null);
    return ok && _agreed;
  }

  Future<void> _submit() async {
    if (_loading) return;

    final ok = _validateAll();
    if (!ok) return;

    setState(() => _loading = true);

    // simulate request
    await Future.delayed(const Duration(milliseconds: 450));
    if (!mounted) return;

    setState(() => _loading = false);
    Navigator.pushNamed(context, AppRoutes.phoneRegistration);
  }

  @override
  void dispose() {
    _fullNameCtrl.dispose();
    _emailCtrl.dispose();
    _phoneCtrl.dispose();
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
                "Welcome!",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                "Please provide following details\nfor your new account",
                style: TextStyle(
                  fontSize: 15,
                  height: 1.6,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 40),

              const Text(
                "Full Name",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              AppTextField(
                hint: "Enter your full name",
                controller: _fullNameCtrl,
                onChanged: _validateFullName,
                errorText: _fullNameErr,
              ),

              const SizedBox(height: 24),

              const Text(
                "Email Address",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              AppTextField(
                hint: "Enter your email address",
                keyboardType: TextInputType.emailAddress,
                controller: _emailCtrl,
                onChanged: _validateEmailRealtime, // ✅ realtime email validation
                errorText: _emailErr,
                autofillHints: const [AutofillHints.email],
              ),

              const SizedBox(height: 24),

              const Text(
                "Phone Number",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              AppTextField(
                hint: "Enter your phone number",
                keyboardType: TextInputType.phone,
                controller: _phoneCtrl,
                onChanged: _validatePhone,
                errorText: _phoneErr,
                autofillHints: const [AutofillHints.telephoneNumber],
              ),

              const SizedBox(height: 18),

              AppCheckboxTile(
                value: _agreed,
                text:
                "By creating your account you have to agree with our Terms and Conditions.",
                onChanged: (v) {
                  setState(() => _agreed = v ?? false);
                },
              ),

              const SizedBox(height: 22),

              PrimaryButton(
                label: "Sign up my account",
                isLoading: _loading, // ✅ loading animation
                onPressed: _agreed ? _submit : null,
              ),

              const SizedBox(height: 16),

              SocialButton(
                label: "Sign up with Apple ID",
                icon: Icons.apple,
                onPressed: () {},
              ),

              const SizedBox(height: 40),

              Center(
                child: GestureDetector(
                  onTap: () => Navigator.pushNamed(context, AppRoutes.signIn),
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