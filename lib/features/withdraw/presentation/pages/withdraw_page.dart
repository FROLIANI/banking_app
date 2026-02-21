import 'package:flutter/material.dart';
import 'package:banking/app/theme/app_theme.dart';
import 'package:banking/core/widgets/primary_button.dart';

class WithdrawPage extends StatefulWidget {
  const WithdrawPage({super.key});

  @override
  State<WithdrawPage> createState() => _WithdrawPageState();
}

class _WithdrawPageState extends State<WithdrawPage> {
  final TextEditingController _amountController = TextEditingController();
  final double _availableBalance = 4500000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bg,
      appBar: AppBar(
        title: const Text("Withdraw"),
        backgroundColor: AppTheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _balanceCard(),
            const SizedBox(height: 30),
            _amountField(),
            const SizedBox(height: 40),
            PrimaryButton(
              label: "Withdraw Money",
              onPressed: _confirmWithdraw,
            ),
          ],
        ),
      ),
    );
  }

  Widget _balanceCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.primary,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Available Balance",
            style: TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 8),
          Text(
            "TZS ${_availableBalance.toStringAsFixed(0)}",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _amountField() {
    return TextField(
      controller: _amountController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Amount to Withdraw",
        prefixText: "TZS ",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  void _confirmWithdraw() {
    final amount = double.tryParse(_amountController.text) ?? 0;

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Confirm Withdrawal"),
        content: Text("Withdraw TZS ${amount.toStringAsFixed(0)}?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.bg,
            ),
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Withdrawal Successful")),
              );
            },
            child: const Text("Confirm"),
          )
        ],
      ),
    );
  }
}