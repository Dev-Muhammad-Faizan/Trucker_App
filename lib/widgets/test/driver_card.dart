import 'package:flutter/material.dart';
import '../../../core/theme.dart';

class DriverCard extends StatelessWidget {
  final String name;
  final String rating;
  final String truckInfo;
  final String jobsCompleted;
  final String phone;
  final String email;
  final VoidCallback onLeaveReview;
  final VoidCallback onViewProfile;

  const DriverCard({
    super.key,
    required this.name,
    required this.rating,
    required this.truckInfo,
    required this.jobsCompleted,
    required this.phone,
    required this.email,
    required this.onLeaveReview,
    required this.onViewProfile,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.blue.shade50,
                      child: const Icon(Icons.person, color: Colors.blue, size: 28),
                   ),
                   const SizedBox(width: 16),
                   Expanded(
                      child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                             Text(
                                name,
                                style: TextStyle(
                                   color: AppTheme.primaryTeal,
                                   fontSize: 18,
                                   fontFamily: 'Poppins',
                                   fontWeight: FontWeight.w700,
                                ),
                             ),
                             const SizedBox(height: 4),
                             Row(
                                children: [
                                   _buildStars(double.parse(rating)),
                                   const SizedBox(width: 8),
                                   Text(
                                     rating,
                                     style: TextStyle(
                                       color: AppTheme.textDark,
                                       fontSize: 14,
                                       fontFamily: 'Poppins',
                                       fontWeight: FontWeight.w600,
                                     ),
                                   ),
                                ],
                             ),
                         ],
                      ),
                   ),
                ],
             ),
             const SizedBox(height: 16),
             _buildInfoRow(Icons.local_shipping_outlined, truckInfo),
             const SizedBox(height: 8),
             _buildInfoRow(Icons.check_circle_outline, '\$jobsCompleted jobs completed'),
             const SizedBox(height: 8),
             _buildInfoRow(Icons.phone_outlined, phone),
             const SizedBox(height: 8),
             _buildInfoRow(Icons.email_outlined, email),
             const SizedBox(height: 16),
             Row(
                children: [
                   Expanded(
                      child: OutlinedButton(
                         onPressed: onLeaveReview,
                         style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: AppTheme.inputBorder),
                            shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(8),
                            ),
                         ),
                         child: const Text('Leave Review', style: TextStyle(color: AppTheme.textDark)),
                      ),
                   ),
                   const SizedBox(width: 12),
                   Expanded(
                      child: ElevatedButton(
                         onPressed: onViewProfile,
                         style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.primaryTeal,
                            foregroundColor: AppTheme.backgroundWhite,
                            shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(8),
                            ),
                         ),
                         child: const Text('View Profile'),
                      ),
                   ),
                ],
             ),
         ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
     return Row(
        children: [
           Icon(icon, size: 16, color: AppTheme.textLight),
           const SizedBox(width: 8),
           Text(
              text,
              style: TextStyle(
                 color: AppTheme.textLight,
                 fontSize: 14,
                 fontFamily: 'Poppins',
                 fontWeight: FontWeight.w400,
              ),
           ),
        ],
     );
  }

  Widget _buildStars(double rating) {
     int filledStars = rating.floor();
     bool hasHalfStar = (rating - filledStars) >= 0.5;
     
     return Row(
       children: List.generate(5, (index) {
          if (index < filledStars) {
             return const Icon(Icons.star, color: Colors.orange, size: 16);
          } else if (index == filledStars && hasHalfStar) {
             return const Icon(Icons.star_half, color: Colors.orange, size: 16);
          } else {
             return const Icon(Icons.star_border, color: Colors.orange, size: 16);
          }
       }),
     );
  }
}
