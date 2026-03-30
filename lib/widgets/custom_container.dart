import 'package:flutter/material.dart';

import '../core/theme.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  final Color? color;
  final double? borderRadius;
  final double? width;
  final double? height;
  final Color? borderColor;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;


  const CustomContainer({
    super.key,
    required this.child,
    this.color,
    this.borderRadius,
    this.width,
    this.height,
    this.borderColor,
    this.padding,
    this.backgroundColor=Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding ?? const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color:backgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: borderColor ??AppTheme.inputBorder ,
          width: 1.0,
        ),
      ),
      child: child,
    );
  }
}