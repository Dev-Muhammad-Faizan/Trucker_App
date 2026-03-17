import 'package:flutter/material.dart';
import '../../../core/theme.dart';

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: AppTheme.primaryTeal,
                     fontSize: 16,
                     fontFamily: 'Poppins',
                     fontWeight: FontWeight.w700,
                  ),
                ),
              ),
               Icon(Icons.local_shipping_outlined, color: AppTheme.accentRed, size: 20),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
               status,
               style: TextStyle(
                 color: Colors.blue,
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
               ),
            ),
          ),
          const SizedBox(height: 16),
          _buildLocationRow(Icons.location_on_outlined, 'Pickup:', pickupLocation),
          const SizedBox(height: 8),
          _buildLocationRow(Icons.flag_outlined, 'Delivery:', deliveryLocation),
          const SizedBox(height: 12),
          Row(
             children: [
               Icon(Icons.calendar_today_outlined, size: 16, color: AppTheme.textLight),
               const SizedBox(width: 8),
               Text(
                 time,
                   style: TextStyle(
                     color: AppTheme.textLight,
                     fontSize: 12,
                     fontFamily: 'Poppins',
                     fontWeight: FontWeight.w400,
                  ),
               ),
             ]
          ),
          const SizedBox(height: 16),
          Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
                Text(
                 price,
                 style: TextStyle(
                   color: AppTheme.accentRed,
                   fontSize: 16,
                   fontFamily: 'Poppins',
                   fontWeight: FontWeight.w700,
                 ),
               ),
               ElevatedButton(
                  onPressed: onViewDetails,
                  style: ElevatedButton.styleFrom(
                     backgroundColor: AppTheme.primaryTeal,
                     foregroundColor: AppTheme.backgroundWhite,
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(8),
                     ),
                  ),
                  child: const Text('View Details'),
               ),
             ],
          ),
        ],
      ),
    );
  }

  Widget _buildLocationRow(IconData icon, String label, String value) {
     return Row(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
          Icon(icon, size: 18, color: AppTheme.textLight),
          const SizedBox(width: 8),
          Expanded(
             child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Text(
                       label,
                       style: TextStyle(
                          color: AppTheme.textDark,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                       ),
                    ),
                    Text(
                      value,
                      style: TextStyle(
                         color: AppTheme.textLight,
                         fontSize: 12,
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
