import 'package:flutter/material.dart';
import '../core/theme.dart';

class Header extends StatelessWidget {
  final double? size;
  final String? imagePath;
  final String? title;
  final String? subtitle;
  final Color? titleColor;
  final Color? subtitleColor;
  final String? fontFamily;
  final double titleSize;
  final double subtitleSize;
  final FontWeight titleFontWeight;
  final FontWeight subtitleFontWeight;
  final CrossAxisAlignment crossAxisAlignment;
  final TextAlign textAlign;
  final double imagespce;

  const Header({
    super.key,
    this.size,
    this.imagePath,
    this.title,
    this.subtitle,
    this.titleColor,
    this.subtitleColor,
    this.fontFamily = 'Poppins',
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textAlign = TextAlign.center,
    this.titleSize = 30,
    this.subtitleSize = 16,
    this.titleFontWeight = FontWeight.w700,
    this.subtitleFontWeight = FontWeight.w400,
    this.imagespce = 32,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        /// IMAGE
        if (imagePath != null && size != null)
          SizedBox(
            width: size,
            height: size,
            child: ClipOval(
              child: Image.asset(
                imagePath!,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.broken_image, size: size, color: AppTheme.textLight);
                },
              ),
            ),
          ),

        /// SPACE BETWEEN IMAGE & TITLE
        if (imagePath != null && title != null)
           SizedBox(height: imagespce),

        /// TITLE
        if (title != null)
          Text(
            title!,
            style: TextStyle(
              color: titleColor ?? AppTheme.backgroundWhite,
              fontSize: titleSize,
              fontFamily: fontFamily,
              fontWeight: titleFontWeight,
            ),
            textAlign: textAlign,
          ),

        /// SPACE BETWEEN TITLE & SUBTITLE
        if (title != null && subtitle != null)
          const SizedBox(height: 8),

        /// SUBTITLE
        if (subtitle != null)
          Text(
            subtitle!,
            style: TextStyle(
              color: subtitleColor ?? AppTheme.backgroundWhite,
              fontSize: subtitleSize,
              fontFamily: fontFamily,
              fontWeight: subtitleFontWeight,
            ),
            textAlign: textAlign,
          ),
      ],
    );
  }
}


