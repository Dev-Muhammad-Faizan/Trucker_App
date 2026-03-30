import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIcon extends StatelessWidget {
  final String imagePath;
  final double size;
  final Color? color;
  final double? height;

  const CustomIcon({
    super.key,
    required this.imagePath,
    this.size = 24.0,
    this.color,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    if (imagePath.toLowerCase().endsWith('.svg')) {
      return SvgPicture.asset(
        imagePath,
        width: size,
        height: size ?? height,
        colorFilter: color != null
            ? ColorFilter.mode(color!, BlendMode.srcIn)
            : null,
      );
    }

    return Image.asset(
      imagePath,
      width: size,
      height: size,
      color: color,
      fit: BoxFit.contain,
    );
  }
}
