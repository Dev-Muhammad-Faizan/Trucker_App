import 'package:flutter/material.dart';
import 'package:trucker_connect/widgets/Header.dart';
import 'package:trucker_connect/widgets/custom_container.dart';
import 'package:trucker_connect/widgets/primary_button.dart';
import '../../../core/theme.dart';
import '../../routes/routes_name.dart';

class JobCard extends StatelessWidget {
  final String title;
  final String status;
  final String pickupLocation;
  final String deliveryLocation;
  final String time;
  final String price;
  final VoidCallback onViewDetails;

  const JobCard({
    super.key,
    required this.title,
    required this.status,
    required this.pickupLocation,
    required this.deliveryLocation,
    required this.time,
    required this.price,
    required this.onViewDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: CustomContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Header(
                    title: title,
                    titleSize: 18,
                    titleColor: AppTheme.primaryTeal,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
                const Icon(
                  Icons.local_shipping_outlined,
                  color: AppTheme.accentRed,
                  size: 24,
                ),
              ],
            ),
            const SizedBox(height: 8),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.blue.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                status,
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 20),

            _buildLocationRow(
              icon: Icons.location_on_outlined,
              iconColor: AppTheme.textLight,
              label: 'Pickup:',
              value: pickupLocation,
            ),
            const SizedBox(height: 12),

             _buildLocationRow(
              icon: Icons.location_on_outlined,
              iconColor: AppTheme.accentRed,
              label: 'Delivery:',
              value: deliveryLocation,
            ),
            const SizedBox(height: 16),

             Row(
              children: [
                const Icon(
                  Icons.calendar_today_outlined,
                  size: 18,
                  color: AppTheme.textLight,
                ),
                const SizedBox(width: 8),
                Text(
                  time,
                  style: const TextStyle(
                    color: AppTheme.primaryTeal,
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Price Row
            Row(
              children: [
                const Text(
                  '\$',
                  style: TextStyle(
                    color: AppTheme.accentRed,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  price.replaceAll('\$', '').trim(),
                  style: const TextStyle(
                    color: AppTheme.accentRed,
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            PrimaryButton(
              text: 'View Details',
              onPressed: () {
                Navigator.pushNamed(context, RoutesName.jobDetail);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationRow({
    required IconData icon,
    required Color iconColor,
    required String label,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: iconColor),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(
                title: label,
                titleSize: 14,
                titleColor: AppTheme.primaryTeal,
                titleFontWeight: FontWeight.w600,
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  color: AppTheme.textLight,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
