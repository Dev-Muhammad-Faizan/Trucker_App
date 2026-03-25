import 'package:flutter/material.dart';

import '../../core/theme.dart';
import '../Header.dart';

class RowHeader extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final double titlesize;
  final double subtitleSize;
  final FontWeight titleFontWeight;
  final FontWeight subtitleFontWeight;


  const RowHeader({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    this.titlesize = 12,
    this.subtitleSize = 14,
    this.titleFontWeight = FontWeight.w400,
    this.subtitleFontWeight = FontWeight.w500,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, size: 20, color: iconColor),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Header(
                title: title,
                titleColor: AppTheme.textLight,
                titleSize: titlesize,
                fontFamily: 'Poppins',
                titleFontWeight: titleFontWeight,
                crossAxisAlignment: CrossAxisAlignment.start,
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 2),
              Header(
                title: subtitle,
                titleSize: subtitleSize,
                titleColor: AppTheme.primaryTeal,
                titleFontWeight:subtitleFontWeight,
                crossAxisAlignment: CrossAxisAlignment.start,
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
