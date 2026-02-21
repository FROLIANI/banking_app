import 'package:flutter/material.dart';
import 'package:banking/app/theme/app_theme.dart';
import 'package:banking/core/widgets/primary_button.dart';

class DepositPage extends StatefulWidget {
  const DepositPage({super.key});

  @override
  State<DepositPage> createState() => _DepositPageState();
}

class _DepositPageState extends State<DepositPage> {
  final TextEditingController _amountController = TextEditingController();

  String _selectedMethod = "Bank Transfer";

  final List<String> _methods = [
    "Bank Transfer",
    "Mobile Money",
    "Card Deposit"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bg,
      appBar: AppBar(
        title: const Text("Deposit"),
        backgroundColor: AppTheme.bg,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _depositMethodSelector(),
            const SizedBox(height: 20),
            _amountField(),
            const SizedBox(height: 40),
            PrimaryButton(
              label: "Deposit Funds",
              onPressed: _confirmDeposit,
            ),
          ],
        ),
      ),
    );
  }

  Widget _depositMethodSelector() {
    return DropdownButtonFormField<String>(
      value: _selectedMethod,
      decoration: InputDecoration(
        labelText: "Deposit Method",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      items: _methods
          .map((method) => DropdownMenuItem(
        value: method,
        child: Text(method),
      ))
          .toList(),
      onChanged: (value) {
        setState(() {
          _selectedMethod = value!;
        });
      },
    );
  }

  Widget _amountField() {
    return TextField(
      controller: _amountController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Amount to Deposit",
        prefixText: "TZS ",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  void _confirmDeposit() {
    final amount = double.tryParse(_amountController.text) ?? 0;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Confirm Deposit"),
        content: Text(
            "Deposit TZS ${amount.toStringAsFixed(0)} via $_selectedMethod?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primary,
            ),
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Deposit Successful")),
              );
            },
            child: const Text("Confirm"),
          )
        ],
      ),
    );
  }
}