import 'package:flutter/material.dart';

import '../../core/theme.dart';
import '../../routes/routes_name.dart';
import '../../widgets/Header.dart';
import '../../widgets/broker/payment_card.dart';
import '../../widgets/primary_button.dart';
class DriverPaymentTab extends StatefulWidget {
  const DriverPaymentTab({super.key});

  @override
  State<DriverPaymentTab> createState() => _DriverPaymentTabState();
}

class _DriverPaymentTabState extends State<DriverPaymentTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundWhite,
      body: Column(
        children: [
          _buildHeader(context),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: _buildPaymentsList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppTheme.primaryTeal,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [

              Header(
                title: 'Payments',
                titleSize: 24,
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  _buildStatCard('Total Earn', '\$3,000'),
                  const SizedBox(width: 16),
                  _buildStatCard('Pending', '\$5,500'),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(String label, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                color: AppTheme.backgroundWhite.withValues(alpha: 0.7),
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                color: AppTheme.backgroundWhite,
                fontSize: 24,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentsList() {
    return Column(
      children: const [
        PaymentCard(
          title: 'Dallas Freight Delivery - John Smith',
          subtitle: 'Logistics Haul',
          status: 'Paid',
          amount: '-\$1,200',
          method: 'ACH Transfer',
          date: 'March 20, 2026',
        ),
        PaymentCard(
          title: 'Houston Route - Sarah Johnson',
          subtitle: 'Material Transport',
          status: 'Paid',
          amount: '-\$1,800',
          method: 'Direct Deposit',
          date: 'March 18, 2026',
        ),
        PaymentCard(
          title: 'San Antonio Delivery - Michael Brown',
          subtitle: 'Local Move',
          status: 'Processing',
          amount: '-\$1,400',
          method: 'ACH Transfer',
          date: 'March 16, 2026',
        ),
        PaymentCard(
          title: 'Austin Distribution - Emily Davis',
          subtitle: 'Overnight Run',
          status: 'Pending',
          amount: '-\$1,600',
          method: 'Direct Deposit',
          date: 'March 15, 2026',
        ),
        PaymentCard(
          title: 'El Paso Haul - John Smith',
          subtitle: 'Border Run',
          status: 'Pending',
          amount: '-\$2,500',
          method: 'ACH Transfer',
          date: 'March 14, 2026',
        ),
        SizedBox(height: 90),
      ],
    );
  }
}
