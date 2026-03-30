import 'package:flutter/material.dart';
import 'package:trucker_connect/core/theme.dart';
import 'package:trucker_connect/widgets/custom_container.dart';
import 'package:trucker_connect/widgets/custom_icon.dart';

import '../Header.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;
    final String imagepath;
  final Color? imageColor;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
     required this.imagepath,
    this.imageColor,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(

        backgroundColor: AppTheme.backgroundWhite.withValues(alpha: 0.1),
           borderColor:AppTheme.backgroundWhite.withValues(alpha: 0.2),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomIcon(
            imagePath: imagepath,
            color: AppTheme.accentRed,
            size: 24,
          ),
          const SizedBox(height: 10),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              title,

              style: const TextStyle(
                color: AppTheme.subtitle,
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
