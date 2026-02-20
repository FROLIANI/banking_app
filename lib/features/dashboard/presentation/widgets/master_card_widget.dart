import 'package:flutter/material.dart';
import 'package:banking/app/theme/app_theme.dart';

class MasterCardWidget extends StatelessWidget {
  final String holder;
  final String number;
  final String validThru;

  const MasterCardWidget({
    super.key,
    required this.holder,
    required this.number,
    required this.validThru,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppTheme.primary,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primary.withOpacity(0.22),
            blurRadius: 22,
            offset: const Offset(0, 14),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "MASTERCARD",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.6,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 14),
          Container(
            width: 34,
            height: 26,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.25),
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            number,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
            ),
          ),
          const Spacer(),
          Row(
            children: [
              Expanded(
                child: Text(
                  holder.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 11.5,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.4,
                  ),
                ),
              ),
              Text(
                validThru,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.9),
                  fontSize: 11.5,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 10),
              _mcLogo(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _mcLogo() {
    return Row(
      children: [
        Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            color: Colors.orange.withOpacity(0.95),
            shape: BoxShape.circle,
          ),
        ),
        Transform.translate(
          offset: const Offset(-6, 0),
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.95),
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}