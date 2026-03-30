import 'package:flutter/material.dart';
import 'package:trucker_connect/widgets/Header.dart';
import 'package:trucker_connect/widgets/custom_container.dart';
import 'package:trucker_connect/widgets/primary_button.dart';
import '../../../core/theme.dart';
import '../../routes/routes_name.dart';
import '../custom_icon.dart';

class JobCard extends StatelessWidget {
  final String title;
  final String? status;
  final String pickupLocation;
  final String deliveryLocation;
  final String time;
  final String price;
  final VoidCallback onViewDetails;

  const JobCard({
    super.key,
    required this.title,
     this.status,
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
                const   CustomIcon(
                  imagePath: 'assets/images/all/truck.svg',
                  size: 20,
                ),
              ],
            ),
            const SizedBox(height: 3),
   if(status != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.blue.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                status!,
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 12),

            _buildLocationRow(
              imagePath: 'assets/images/all/location.svg',
              imageColor: AppTheme.textLight,
               label: 'Pickup:',
              value: pickupLocation,
            ),
            const SizedBox(height: 8),

             _buildLocationRow(
               imagePath: 'assets/images/all/location.svg',
               imageColor: AppTheme.accentRed,
              label: 'Delivery:',
              value: deliveryLocation,
            ),
            const SizedBox(height: 8),

             Row(
              children: [

                CustomIcon(imagePath: 'assets/images/all/card.svg',size: 16,),
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
            const SizedBox(height: 8),

            // Price Row
            Row(
              children: [
                CustomIcon(imagePath: 'assets/images/navigation/payment.svg',size: 16,color: AppTheme.accentRed,),
                const SizedBox(width: 8),
                Text(
                  price.replaceAll('\$', '').trim(),
                  style: const TextStyle(
                    color: AppTheme.accentRed,
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            PrimaryButton(
              text: 'View Details',
              onPressed: () {
                onViewDetails();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLocationRow({

    required String imagePath,
    required Color imageColor,
    required String label,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         CustomIcon(imagePath: imagePath,color: imageColor,size:  16),
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
                subtitle: value,
                subtitleSize: 14,
                subtitleColor: AppTheme.textLight,
                crossAxisAlignment: CrossAxisAlignment.start,
                space: 2,
              ),

            ],
          ),
        ),
      ],
    );
  }
}
