import 'package:flutter/material.dart';
import 'package:trucker_connect/widgets/Header.dart';
import 'package:trucker_connect/widgets/custom_container.dart';
import 'package:trucker_connect/widgets/custom_icon.dart';
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
        statusBgColor = const Color(0xFFDCFCE7);
        statusTextColor = const Color(0xFF008236);
        break;
      case 'processing':
        statusBgColor = const Color(0xFFDBEAFE);
        statusTextColor = const Color(0xFF1447E6);
        break;
      case 'pending':
        statusBgColor = const Color(0xFFFEF3C6);
        statusTextColor = const Color(0xFFBB4D00);
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
              titleFontWeight: FontWeight.w600,
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            const SizedBox(height: 4),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: statusBgColor,
                borderRadius: BorderRadius.circular(14),
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
            const SizedBox(height: 12),

            Row(
              children: [

                CustomIcon(imagePath: 'assets/images/all/money.svg',size: 16,),
                const SizedBox(width: 8),
                Text(
                  amount
                      .replaceAll('-', '')
                      .trim(),
                  style: const TextStyle(
                    color: AppTheme.accentRed,
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),

            Row(
              children: [
                CustomIcon(imagePath: 'assets/images/all/ach.svg',size: 16,),

                const SizedBox(width: 8),

                Header(
                  subtitle: method,
                  subtitleSize: 14,
                  subtitleColor: AppTheme.textLight,
                ),
              ],
            ),
            const SizedBox(height: 6),

            Row(
              children: [
                CustomIcon(imagePath: 'assets/images/all/card.svg',size: 16,),

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
