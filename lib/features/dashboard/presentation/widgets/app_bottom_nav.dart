import 'package:flutter/material.dart';
import 'package:banking/app/theme/app_theme.dart';

class AppBottomNav extends StatelessWidget {
  final int index;
  final ValueChanged<int> onChanged;

  const AppBottomNav({
    super.key,
    required this.index,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final items = const [
      _NavItem(icon: Icons.home_rounded, label: "Home"),
      _NavItem(icon: Icons.credit_card_rounded, label: "Cards"),
      _NavItem(icon: Icons.send_rounded, label: "Send"),
      _NavItem(icon: Icons.tune_rounded, label: "Amount"),
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 0, 18, 18),
      child: Container(
        height: 64,
        decoration: BoxDecoration(
          color: AppTheme.primary,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.10),
              blurRadius: 18,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          children: List.generate(items.length, (i) {
            final active = i == index;
            return Expanded(
              child: InkWell(
                borderRadius: BorderRadius.circular(18),
                onTap: () => onChanged(i),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  curve: Curves.easeOut,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Center(
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 180),
                      opacity: active ? 1 : 0.65,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(items[i].icon, color: Colors.white),
                          const SizedBox(height: 4),
                          Text(
                            items[i].label,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11.5,
                              fontWeight: active ? FontWeight.w700 : FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}

class _NavItem {
  final IconData icon;
  final String label;
  const _NavItem({required this.icon, required this.label});
}