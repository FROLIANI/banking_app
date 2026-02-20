import 'package:flutter/material.dart';
import 'package:banking/app/theme/app_theme.dart';
import 'package:banking/features/dashboard/presentation/widgets/contact_avatar.dart';

class SendMoneyTab extends StatefulWidget {
  const SendMoneyTab({super.key});

  @override
  State<SendMoneyTab> createState() => _SendMoneyTabState();
}

class _SendMoneyTabState extends State<SendMoneyTab> {
  int _option = 1;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 110),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Text("Send Money", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
              Spacer(),
              Icon(Icons.open_in_new_rounded, color: Colors.black54),
            ],
          ),
          const SizedBox(height: 14),

          const Text("Select Option", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w700)),
          const SizedBox(height: 12),

          Row(
            children: [
              _opt(Icons.account_balance_rounded, "Bank", 0),
              const SizedBox(width: 10),
              _opt(Icons.phone_android_rounded, "TopUp", 1),
              const SizedBox(width: 10),
              _opt(Icons.qr_code_rounded, "QR Code", 2),
              const SizedBox(width: 10),
              _opt(Icons.location_on_rounded, "Nearby", 3),
            ],
          ),

          const SizedBox(height: 18),

          _sectionCard(
            title: "Recent Receipts",
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                ContactAvatar(name: "Michael", imageUrl: "https://i.pravatar.cc/100?img=11"),
                ContactAvatar(name: "Billy", imageUrl: "https://i.pravatar.cc/100?img=12"),
                ContactAvatar(name: "Mark", imageUrl: "https://i.pravatar.cc/100?img=13"),
                ContactAvatar(name: "James", imageUrl: "https://i.pravatar.cc/100?img=14"),
              ],
            ),
          ),

          const SizedBox(height: 14),

          _sectionCard(
            title: "Add New Contact",
            child: Column(
              children: [
                Container(
                  height: 44,
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F4F7),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: const [
                      Expanded(
                        child: Text("Search contact...", style: TextStyle(color: Colors.black45, fontWeight: FontWeight.w600)),
                      ),
                      Icon(Icons.search_rounded, color: Colors.black45),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                _inviteRow("Sir James", "0 000 0000", invited: true),
                const SizedBox(height: 10),
                _inviteRow("Jimmy", "0 000 0000", invited: false),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _opt(IconData icon, String label, int i) {
    final active = _option == i;
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => setState(() => _option = i),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          curve: Curves.easeOut,
          height: 66,
          decoration: BoxDecoration(
            color: active ? AppTheme.primary : Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 14,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: active ? Colors.white : Colors.black87),
              const SizedBox(height: 6),
              Text(
                label,
                style: TextStyle(
                  color: active ? Colors.white : Colors.black87,
                  fontWeight: FontWeight.w800,
                  fontSize: 11.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _sectionCard({required String title, required Widget child}) {
    return Container(
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
          Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w900)),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }

  Widget _inviteRow(String name, String phone, {required bool invited}) {
    return Row(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage("https://i.pravatar.cc/100?u=$name"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: const TextStyle(fontWeight: FontWeight.w800)),
              const SizedBox(height: 2),
              Text(phone, style: const TextStyle(color: Colors.black54, fontWeight: FontWeight.w600, fontSize: 12)),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: invited ? const Color(0xFFDDF3F3) : AppTheme.primary,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            invited ? "Invited" : "Invite",
            style: TextStyle(
              color: invited ? Colors.black87 : Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}