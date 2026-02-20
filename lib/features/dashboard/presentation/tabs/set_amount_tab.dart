import 'package:flutter/material.dart';
import 'package:banking/app/theme/app_theme.dart';
import 'package:banking/features/dashboard/presentation/widgets/contact_avatar.dart';
import 'package:banking/features/dashboard/presentation/widgets/quick_amount_chip.dart';

class SetAmountTab extends StatefulWidget {
  const SetAmountTab({super.key});

  @override
  State<SetAmountTab> createState() => _SetAmountTabState();
}

class _SetAmountTabState extends State<SetAmountTab> {
  int _amount = 7000;
  int _quick = 1;

  void _add(int v) => setState(() => _amount += v);
  void _minus(int v) => setState(() => _amount = (_amount - v).clamp(0, 9999999));

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 110),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Text("Set Amount", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
              Spacer(),
              Icon(Icons.open_in_new_rounded, color: Colors.black54),
            ],
          ),
          const SizedBox(height: 8),
          const Text("How much you would like to send?", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w700)),
          const SizedBox(height: 16),

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
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _squareBtn(Icons.remove_rounded, () => _minus(500)),
                    const SizedBox(width: 14),
                    Text(
                      "\$${_amount.toString()}",
                      style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: Colors.black87),
                    ),
                    const SizedBox(width: 14),
                    _squareBtn(Icons.add_rounded, () => _add(500)),
                  ],
                ),
                const SizedBox(height: 16),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Quick Actions", style: TextStyle(fontWeight: FontWeight.w900, color: Colors.black54)),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(child: QuickAmountChip(label: "\$500", active: _quick == 0, onTap: () { setState(() { _quick = 0; _amount = 500; }); })),
                    const SizedBox(width: 10),
                    Expanded(child: QuickAmountChip(label: "\$1500", active: _quick == 1, onTap: () { setState(() { _quick = 1; _amount = 1500; }); })),
                    const SizedBox(width: 10),
                    Expanded(child: QuickAmountChip(label: "\$3000", active: _quick == 2, onTap: () { setState(() { _quick = 2; _amount = 3000; }); })),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 14),

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
              children: [
                const Text("To whom you want to send?", style: TextStyle(fontWeight: FontWeight.w900, color: Colors.black87)),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    ContactAvatar(name: "Rio", imageUrl: "https://i.pravatar.cc/100?img=21"),
                    ContactAvatar(name: "Marry", imageUrl: "https://i.pravatar.cc/100?img=22"),
                    ContactAvatar(name: "Alex", imageUrl: "https://i.pravatar.cc/100?img=23"),
                    ContactAvatar(name: "Susan", imageUrl: "https://i.pravatar.cc/100?img=24"),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(child: _pillBtn("Transfer", true)),
                    const SizedBox(width: 10),
                    Expanded(child: _pillBtn("Cancel", false)),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _squareBtn(IconData icon, VoidCallback onTap) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: const Color(0xFFDDF3F3),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Icon(icon, color: Colors.black87),
      ),
    );
  }

  Widget _pillBtn(String text, bool primary) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: primary ? AppTheme.primary : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: primary ? Colors.transparent : const Color(0xFFE6E8EE)),
        boxShadow: primary
            ? [
          BoxShadow(
            color: AppTheme.primary.withOpacity(0.20),
            blurRadius: 16,
            offset: const Offset(0, 10),
          ),
        ]
            : [],
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: primary ? Colors.white : AppTheme.primary,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}