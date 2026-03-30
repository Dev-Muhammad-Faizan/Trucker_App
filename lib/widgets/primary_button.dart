
import 'package:flutter/material.dart';
import 'package:trucker_connect/core/theme.dart';
import 'package:trucker_connect/widgets/Header.dart';

import 'custom_icon.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double borderradius;
  final bool isLoading;
  final bool isOutlined;
  final Color OutlineColor;
  final double width;
  final IconData? icon;
  final String? imagePath;
  final Color? imageColor;
 final MainAxisAlignment mainAxisAlignment;
  
  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor,
    this.borderradius = 14,
    this.textColor,
    this.isLoading = false,
    this.isOutlined = false,
    this.OutlineColor = Colors.white,
    this.width = 1.5,
    this.icon,
    this.imagePath,
    this.imageColor,
    this.mainAxisAlignment=MainAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    if (isOutlined) {
      return SizedBox(
        width: double.infinity,
        child: OutlinedButton(
          onPressed: isLoading ? null : onPressed,
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: OutlineColor, width: width),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderradius),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          child: isLoading
              ? const SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : Padding(
            padding: EdgeInsets.symmetric(horizontal: 13),
                child: Row(
                    mainAxisAlignment: mainAxisAlignment,
                    children: [
                      if (icon != null) ...[
                        Icon(icon, size: 20, color: textColor ?? AppTheme.backgroundWhite),
                        const SizedBox(width: 8),
                      ],
                      if(imagePath!=null && imageColor!=null) ...[
                        CustomIcon(imagePath: imagePath!, size: 16, color: imageColor)

                      ],
                      SizedBox(width: 20,),
                      Header(
                        title: text,
                        titleColor: textColor ?? AppTheme.backgroundWhite,
                        titleSize: 14,
                      ),
                    ],
                  ),
              ),
        ),
      );
    }

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ??AppTheme.primaryTeal,
          foregroundColor: textColor ?? Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        child: isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    Icon(icon, size: 20, color: textColor ?? Colors.white),
                    const SizedBox(width: 8),
                  ],
                  Text(text),
                ],
              ),
      ),
    );
  }
}
