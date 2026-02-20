import 'package:flutter/material.dart';
import 'package:banking/features/dashboard/presentation/widgets/master_card_widget.dart';

class CardsTab extends StatefulWidget {
  const CardsTab({super.key});

  @override
  State<CardsTab> createState() => _CardsTabState();
}

class _CardsTabState extends State<CardsTab> {
  int _chip = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 110),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Text("Your Cards", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
              Spacer(),
              Icon(Icons.open_in_new_rounded, color: Colors.black54),
            ],
          ),
          const SizedBox(height: 6),
          const Text("2 physical, 1 virtual debit card", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w600)),
          const SizedBox(height: 14),

          Row(
            children: [
              _seg("Physical Card", _chip == 0, () => setState(() => _chip = 0)),
              const SizedBox(width: 10),
              _seg("Virtual Card", _chip == 1, () => setState(() => _chip = 1)),
            ],
          ),

          const SizedBox(height: 14),

          const MasterCardWidget(
            holder: "Michael James",
            number: "5412 7512 3412 3456",
            validThru: "24-25",
          ),

          const SizedBox(height: 18),
          const Text("Card Settings", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800, color: Colors.black54)),
          const SizedBox(height: 12),

          _toggleRow("Contactless Payment", true),
          const SizedBox(height: 10),
          _toggleRow("Online Payments", false),
          const SizedBox(height: 10),
          _toggleRow("ATM Withdraws", false),
        ],
      ),
    );
  }

  Widget _seg(String text, bool active, VoidCallback onTap) {
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          curve: Curves.easeOut,
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: active ? const Color(0xFF4B5CC4) : const Color(0xFFDDF3F3),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: active ? Colors.white : Colors.black87,
                fontWeight: FontWeight.w800,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _toggleRow(String text, bool on) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 14,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.settings_input_component_rounded, color: Colors.black54.withOpacity(0.8)),
          const SizedBox(width: 10),
          Expanded(child: Text(text, style: const TextStyle(fontWeight: FontWeight.w700))),
          Switch(value: on, onChanged: (_) {}),
        ],
      ),
    );
  }
}