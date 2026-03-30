import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  final Color? imagecolor;
  final Color? imageBackgroundColor;
  final double? backgroundSize;

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
    this.space = 8,
    this.imagecolor,
    this.imageBackgroundColor,
    this.backgroundSize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        if (imagePath != null && size != null)
          SizedBox(
            width: backgroundSize ?? size,
            height: backgroundSize ?? size,
            child: ClipOval(
              child: Container(
                color: imageBackgroundColor,
                alignment: Alignment.center,
                child: SizedBox(
                  width: size,
                  height: size,
                  child: imagePath!.toLowerCase().endsWith('.svg')
                      ? SvgPicture.asset(
                          imagePath!,
                          fit: BoxFit.contain,
                          colorFilter: imagecolor != null
                              ? ColorFilter.mode(imagecolor!, BlendMode.srcIn)
                              : null,
                        )
                      : Image.asset(
                          imagePath!,
                          fit: BoxFit.contain,
                          color: imagecolor,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(Icons.broken_image, size: size, color: AppTheme.textLight);
                          },
                        ),
                ),
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


