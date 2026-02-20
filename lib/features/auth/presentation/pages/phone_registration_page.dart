import 'package:flutter/material.dart';
import 'package:banking/app/routes.dart';
import 'package:banking/core/widgets/app_text_field.dart';
import 'package:banking/core/widgets/primary_button.dart';
import 'package:banking/core/widgets/country_picker.dart';
import 'package:banking/core/models/country.dart';

class PhoneRegistrationPage extends StatefulWidget {
  const PhoneRegistrationPage({super.key});

  @override
  State<PhoneRegistrationPage> createState() =>
      _PhoneRegistrationPageState();
}

class _PhoneRegistrationPageState
    extends State<PhoneRegistrationPage> {
  Country? _selectedCountry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),

              const Text(
                "Phone\nRegistration",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 14),

              const Text(
                "Please enter your valid phone number. We will send you 4-digit code to verify account.",
                style: TextStyle(
                  fontSize: 15,
                  height: 1.6,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 40),

              const Text(
                "Enter your location",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),

              const SizedBox(height: 12),

              CountryPicker(
                selected: _selectedCountry,
                onSelected: (country) {
                  setState(() {
                    _selectedCountry = country;
                  });
                },
              ),

              const SizedBox(height: 26),

              const Text(
                "Enter your phone number",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),

              const SizedBox(height: 12),

              AppTextField(
                hint: _selectedCountry != null
                    ? "${_selectedCountry!.dialCode} 000 000 000"
                    : "Enter phone number",
                keyboardType: TextInputType.phone,
              ),

              const Spacer(),

              PrimaryButton(
                label: "Continue",
                onPressed: () =>
                    Navigator.pushNamed(context, AppRoutes.verifyAccount),
              ),

              const SizedBox(height: 18),

              const Center(
                child: Text(
                  "Please review our\nTerms and Conditions Policy",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black54,
                  ),
                ),
              ),

              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}