import 'package:flutter/material.dart';
import 'package:trucker_connect/widgets/Header.dart';
import 'package:trucker_connect/widgets/custom_container.dart';
import '../../../core/theme.dart';

class PaymentCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String status;
  final String amount;
  final String method;
  final String date;

  const PaymentCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.status,
    required this.amount,
    required this.method,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    Color statusBgColor;
    Color statusTextColor;

    switch (status.toLowerCase()) {
      case 'paid':
        statusBgColor = const Color(0xFFE8F5E9);
        statusTextColor = const Color(0xFF4CAF50);
        break;
      case 'processing':
        statusBgColor = const Color(0xFFE3F2FD);
        statusTextColor = const Color(0xFF2196F3);
        break;
      case 'pending':
        statusBgColor = const Color(0xFFFFF3E0);
        statusTextColor = const Color(0xFFFFA726);
        break;
      default:
        statusBgColor = Colors.grey.shade100;
        statusTextColor = Colors.grey;
    }

    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: CustomContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(
              title: title,
              titleSize: 16,
              titleColor: AppTheme.primaryTeal,
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            const SizedBox(height: 8),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: statusBgColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                status,
                style: TextStyle(
                  color: statusTextColor,
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 20),

            Row(
              children: [
                const Icon(
                  Icons.account_balance_wallet_outlined,
                  size: 20,
                  color: AppTheme.accentRed,
                ),
                const SizedBox(width: 8),
                Text(
                  amount
                      .replaceAll('-', '')
                      .trim(), // Remove negative sign from display
                  style: const TextStyle(
                    color: AppTheme.accentRed,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            Row(
              children: [
                const Icon(
                  Icons.credit_card_outlined,
                  size: 18,
                  color: AppTheme.textLight,
                ),
                const SizedBox(width: 8),

                Header(
                  subtitle: method,
                  subtitleSize: 14,
                  subtitleColor: AppTheme.textLight,
                ),
              ],
            ),
            const SizedBox(height: 8),

            Row(
              children: [
                const Icon(
                  Icons.calendar_today_outlined,
                  size: 18,
                  color: AppTheme.textLight,
                ),
                const SizedBox(width: 8),
                Header(
                  subtitle: date,
                  subtitleSize: 14,
                  subtitleColor: AppTheme.textLight,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
