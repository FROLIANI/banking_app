import 'package:flutter/material.dart';
import 'package:banking/features/dashboard/presentation/widgets/metric_card.dart';
import 'package:banking/features/dashboard/presentation/widgets/operation_tile.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 110),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _topBar(),
          const SizedBox(height: 18),

          const Text("Overview", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Colors.black54)),
          const SizedBox(height: 12),

          Row(
            children: const [
              Expanded(child: MetricCard(title: "Budget", value: "\$17,000", percent: 50, primary: true)),
              SizedBox(width: 12),
              Expanded(child: MetricCard(title: "Expenses", value: "\$25,000", percent: 60)),
            ],
          ),

          const SizedBox(height: 18),
          const Text("Operations", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Colors.black54)),
          const SizedBox(height: 12),

          GridView.count(
            crossAxisCount: 3,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              OperationTile(icon: Icons.swap_horiz_rounded, label: "Transfer", onTap: () {}),
              OperationTile(icon: Icons.account_balance_wallet_rounded, label: "Withdraw", onTap: () {}),
              OperationTile(icon: Icons.savings_rounded, label: "Deposit", onTap: () {}),
              OperationTile(icon: Icons.credit_card_rounded, label: "My Cards", onTap: () {}),
              OperationTile(icon: Icons.analytics_rounded, label: "Analytics", onTap: () {}),
              OperationTile(icon: Icons.pie_chart_rounded, label: "Budget", onTap: () {}),
            ],
          ),

          const SizedBox(height: 18),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 14,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("Complete Profile", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800)),
                SizedBox(height: 10),
                LinearProgressIndicator(value: 0.6, minHeight: 10),
                SizedBox(height: 8),
                Text("60% Completed", style: TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _topBar() {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Hello", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w600)),
            SizedBox(height: 4),
            Text("Frolian Ernest", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
          ],
        ),
        const Spacer(),
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage("https://i.pravatar.cc/100?img=13"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 10),
        const Icon(Icons.open_in_new_rounded, color: Colors.black54),
      ],
    );
  }
}