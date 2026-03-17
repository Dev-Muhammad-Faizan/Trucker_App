import 'package:flutter/material.dart';
import 'package:trucker_connect/widgets/Header.dart';
import 'package:trucker_connect/widgets/custom_container.dart';
import '../core/theme.dart';
import 'primary_button.dart';

class RoleSelectionCard extends StatelessWidget {
  final String title;
  final String description;
  final Color themeColor;
  final String buttonText;
  final String image;
  final VoidCallback onSelect;

  const RoleSelectionCard({
    super.key,
    required this.title,
    required this.description,
    required this.themeColor,
    required this.buttonText,
    required this.onSelect,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        children: [
          Row(
            children: [
              Header(size: 64, imagePath: image),
              const SizedBox(width: 16),
              Text(
                title,
                style: TextStyle(color: AppTheme.primaryTeal,fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(

            description,
            style: TextStyle(color: AppTheme.textLight,fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),

            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 24),
          PrimaryButton(
            text: buttonText,
            onPressed: onSelect,
            backgroundColor: themeColor,
          ),
        ],
      ),
    );
  }
}
