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
  final double space;

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
    this.textAlign = TextAlign.start,
    this.titleSize = 30,
    this.subtitleSize = 16,
    this.titleFontWeight = FontWeight.w700,
    this.subtitleFontWeight = FontWeight.w400,
    this.imagespce = 32,
    this.space =8,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: crossAxisAlignment,
      children: [
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

        if (imagePath != null && title != null)
           SizedBox(height: imagespce),

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

        if (title != null && subtitle != null)
           SizedBox(height: space),

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


