import 'package:flutter/material.dart';
import 'package:trucker_connect/widgets/Header.dart';
import 'package:trucker_connect/widgets/custom_container.dart';
import 'package:trucker_connect/widgets/primary_button.dart';
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
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: CustomContainer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Header(imagePath: 'assets/images/person_icon.png', size: 64),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Header(
                        title: name,
                        titleSize: 18,
                        titleColor: AppTheme.primaryTeal,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          _buildStars(double.parse(rating)),
                          const SizedBox(width: 8),
                          Header(
                            subtitle: rating,
                            subtitleSize: 14,
                            subtitleColor: AppTheme.primaryTeal,
                            subtitleFontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildInfoRow('assets/images/icon.png', truckInfo),
            const SizedBox(height: 8),
            _buildInfoRow(
              'assets/images/icon.png',
              '$jobsCompleted  jobs completed',
            ),
            const SizedBox(height: 8),
            _buildInfoRow('assets/images/icon.png', phone),
            const SizedBox(height: 8),
            _buildInfoRow('assets/images/icon.png', email),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    text: 'Leave Review',
                    onPressed: () {},
                    backgroundColor: AppTheme.backgroundWhite,
                    textColor: AppTheme.primaryTeal,
                    borderradius: 12,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: PrimaryButton(
                    text: 'Leave Review',
                    onPressed: () {},
                    backgroundColor: AppTheme.primaryTeal,
                    borderradius: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String image, String text) {
    return Row(
      children: [
        Header(imagePath: image, size: 16),
        const SizedBox(width: 8),
        Header(
          subtitle: text,
          subtitleSize: 14,
          subtitleColor: AppTheme.textLight,
          subtitleFontWeight: FontWeight.w400,
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
