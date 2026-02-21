import 'package:flutter/material.dart';
import 'package:banking/app/theme/app_theme.dart';

class CardsPage extends StatelessWidget {
  const CardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.bg,
      appBar: AppBar(
        title: const Text("My Cards"),
        backgroundColor: AppTheme.primary,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          _BankCard(
            cardNumber: "**** 3456",
            balance: "TZS 4,500,000",
          ),
          SizedBox(height: 20),
          _BankCard(
            cardNumber: "**** 8899",
            balance: "TZS 850,000",
          ),
        ],
      ),
    );
  }
}

class _BankCard extends StatelessWidget {
  final String cardNumber;
  final String balance;

  const _BankCard({
    required this.cardNumber,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Banking App",
              style: TextStyle(color: Colors.white, fontSize: 16)),
          const Spacer(),
          Text(cardNumber,
              style: const TextStyle(color: Colors.white, fontSize: 18)),
          const SizedBox(height: 8),
          Text(balance,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}