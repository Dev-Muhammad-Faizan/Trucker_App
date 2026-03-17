import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import '../core/theme.dart';

class BottomTextLink extends StatelessWidget {
  final String normalText;
  final String linkText;
  final VoidCallback onTapped;
  final Color? linkColor;

  const BottomTextLink({
  super.key,
    required this.normalText,
    required this.linkText,
    required this.onTapped,
    this.linkColor,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          style: TextStyle(
            color: AppTheme.primaryTeal,
            fontSize: 12,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
          children: [
            TextSpan(text: '$normalText '),
            TextSpan(
              text: linkText,
              style: TextStyle(
                color: AppTheme.accentRed,
                fontSize: 12,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
              recognizer: TapGestureRecognizer()..onTap = onTapped,
            ),
          ],
        ),
      ),
    );
  }
}
