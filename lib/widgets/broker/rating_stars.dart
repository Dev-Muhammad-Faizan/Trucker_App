import 'package:flutter/material.dart';
import '../../core/theme.dart';

class RatingStars extends StatelessWidget {
  final int rating;
  final ValueChanged<int> onChanged;
  final double iconSize;

  const RatingStars({
    super.key,
    required this.rating,
    required this.onChanged,
    this.iconSize = 32.0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: () => onChanged(index + 1),
          behavior: HitTestBehavior.opaque,
          child: Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: Icon(
              index < rating ? Icons.star : Icons.star_border,
              color: index < rating ? AppTheme.accentRed : AppTheme.textLight,
              size: iconSize,
            ),
          ),
        );
      }),
    );
  }
}
