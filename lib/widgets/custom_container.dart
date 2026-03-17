import 'package:flutter/material.dart';

import '../core/theme.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  final Color? color;
  final double? borderRadius;
  final double? width;
  final double? height;
  final Color? borderColor;


  const CustomContainer({
    super.key,
    required this.child,
    this.color,
    this.borderRadius,
    this.width,
    this.height,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding:  EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppTheme.inputBorder,
          width: 1.0,
        ),
      ),
      child: child,
    );
  }
}