import 'package:flutter/material.dart';
import 'package:banking/app/theme/app_theme.dart';

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bg,
      appBar: AppBar(
        title: const Text("Analytics"),
        backgroundColor: AppTheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _statCard("Income", "TZS 2,500,000"),
            const SizedBox(height: 20),
            _statCard("Expenses", "TZS 1,200,000"),
            const SizedBox(height: 20),
            _statCard("Savings", "TZS 1,300,000"),
          ],
        ),
      ),
    );
  }

  Widget _statCard(String title, String amount) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 16)),
          Text(amount,
              style:
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ],
      ),
    );
  }
}