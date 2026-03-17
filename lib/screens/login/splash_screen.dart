import 'package:flutter/material.dart';
import 'package:trucker_connect/widgets/Header.dart';
import '../../core/theme.dart';
import '../../routes/routes_name.dart';
import '../../widgets/primary_button.dart';
import 'login_screen.dart';
import 'role_selection_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryTeal,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Header(
            imagePath: 'assets/images/shiping_icon1.png',
            size: 96,
            title: 'TruckerConnect',
            subtitle: 'Connecting Drivers and Brokers',
            subtitleColor: AppTheme.backgroundWhite,
            fontFamily: 'Poppins',
            titleFontWeight: FontWeight.w700,
            subtitleFontWeight: FontWeight.w400,
            titleSize: 36,
            subtitleSize: 18,
          ),
              const SizedBox(height: 32),
              // Red Accent Line
              Container(
                width: 64,
                height: 4,
                color: AppTheme.accentRed,
              ),
              const SizedBox(height: 64),
              PrimaryButton(
                text: 'Login',
                backgroundColor: Colors.white,
                textColor: AppTheme.primaryTeal,
                onPressed: () {
                  Navigator.pushNamed(context, RoutesName.loginScreen);
                },
              ),
              const SizedBox(height: 16),
              PrimaryButton(
                text: 'Create Account',
                isOutlined: true,
                onPressed: () {
                  Navigator.pushNamed(context, RoutesName.roleSelectionScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
