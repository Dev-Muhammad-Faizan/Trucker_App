import 'package:flutter/material.dart';

import '../../core/theme.dart';
import '../Header.dart';
import '../custom_icon.dart';

class RowHeader extends StatelessWidget {
   final String? imagePath;
  final Color? iconColor;
  final String title;
  final String subtitle;
  final double titlesize;
  final double subtitleSize;
  final FontWeight titleFontWeight;
  final FontWeight subtitleFontWeight;
  final CrossAxisAlignment crossAxisAlignment;
  final double imgSize;
  final double? height;




  const RowHeader({
    super.key,
     this.imagePath,
    this.iconColor,
    required this.title,
    required this.subtitle,
    this.titlesize = 12,
    this.subtitleSize = 14,
    this.titleFontWeight = FontWeight.w400,
    this.subtitleFontWeight = FontWeight.w500,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.imgSize=20,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        if (imagePath != null)
          CustomIcon(imagePath: imagePath!, size: imgSize, color: iconColor)
        else if (imagePath != null && height != null)
          CustomIcon(imagePath: imagePath!, size: imgSize, height: height,color: iconColor)
        else
          const SizedBox(width: 20),
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
