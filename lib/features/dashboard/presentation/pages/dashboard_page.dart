import 'package:flutter/material.dart';
import 'package:banking/features/dashboard/presentation/tabs/cards_tab.dart';
import 'package:banking/features/dashboard/presentation/tabs/home_tab.dart';
import 'package:banking/features/dashboard/presentation/tabs/send_money_tab.dart';
import 'package:banking/features/dashboard/presentation/tabs/set_amount_tab.dart';
import 'package:banking/features/dashboard/presentation/widgets/app_bottom_nav.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _index = 0;

  final _pages = const [
    HomeTab(),
    CardsTab(),
    SendMoneyTab(),
    SetAmountTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 220),
          switchInCurve: Curves.easeOut,
          switchOutCurve: Curves.easeIn,
          child: _pages[_index],
        ),
      ),
      bottomNavigationBar: AppBottomNav(
        index: _index,
        onChanged: (i) => setState(() => _index = i),
      ),
    );
  }
}