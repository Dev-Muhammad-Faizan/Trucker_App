import 'package:flutter/material.dart';
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
    Color statusColor;
    if (status.toLowerCase() == 'paid') {
      statusColor = Colors.green;
    } else if (status.toLowerCase() == 'processing') {
      statusColor = Colors.blue;
    } else {
      statusColor = Colors.orange;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.backgroundWhite,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: AppTheme.primaryTeal,
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              status,
              style: TextStyle(
                color: statusColor,
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      amount,
                      style: TextStyle(
                        color: AppTheme.accentRed,
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.account_balance_outlined, size: 14, color: AppTheme.textLight),
                        const SizedBox(width: 4),
                        Text(
                          method,
                          style: TextStyle(
                            color: AppTheme.textLight,
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.calendar_today_outlined, size: 14, color: AppTheme.textLight),
                        const SizedBox(width: 4),
                        Text(
                          date,
                          style: TextStyle(
                            color: AppTheme.textLight,
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Icon(Icons.chevron_right, color: AppTheme.textLight),
            ],
          ),
        ],
      ),
    );
  }
}
