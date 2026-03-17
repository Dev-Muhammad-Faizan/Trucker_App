import 'package:flutter/material.dart';
import '../../../core/theme.dart';

class ActivityTimelineItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String timeAgo;
  final Color dotColor;
  final bool isLast;

  const ActivityTimelineItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.timeAgo,
    required this.dotColor,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Timeline logic
          SizedBox(
            width: 30,
            child: Column(
              children: [
                const SizedBox(height: 4), // Align dot with title top
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: dotColor,
                    shape: BoxShape.circle,
                  ),
                ),
                if (!isLast) ...[
                  const SizedBox(height: 4),
                  Expanded(
                    child: Container(
                      width: 2,
                      color: AppTheme.inputBorder,
                    ),
                  ),
                ]
              ],
            ),
          ),
          const SizedBox(width: 8),
          
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24.0), // Spacing between items
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
                            fontSize: 14,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Text(
                        timeAgo,
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
                  Text(
                    subtitle,
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
          ),
        ],
      ),
    );
  }
}
