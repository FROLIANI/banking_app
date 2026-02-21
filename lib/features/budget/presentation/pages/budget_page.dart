import 'package:flutter/material.dart';
import 'package:banking/app/theme/app_theme.dart';

class BudgetPage extends StatelessWidget {
  const BudgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bg,
      appBar: AppBar(
        title: const Text("Budget"),
        backgroundColor: AppTheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: const [
            _BudgetTile("Food", "TZS 500,000", 0.7),
            SizedBox(height: 20),
            _BudgetTile("Transport", "TZS 200,000", 0.4),
            SizedBox(height: 20),
            _BudgetTile("Shopping", "TZS 300,000", 0.6),
          ],
        ),
      ),
    );
  }
}

class _BudgetTile extends StatelessWidget {
  final String category;
  final String amount;
  final double progress;

  const _BudgetTile(
      this.category,
      this.amount,
      this.progress,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(category, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        LinearProgressIndicator(
          value: progress,
          backgroundColor: Colors.grey.shade300,
          color: AppTheme.primary,
        ),
        const SizedBox(height: 6),
        Text(amount),
      ],
    );
  }
}