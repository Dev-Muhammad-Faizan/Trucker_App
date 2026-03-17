import 'package:flutter/material.dart';
import 'package:trucker_connect/widgets/Header.dart';
import '../../core/theme.dart';
import '../../widgets/role_selection_card.dart';
import 'driver_registration_screen.dart';
import 'broker_registration_screen.dart';
import 'login_screen.dart';
import '../../routes/routes_name.dart';
class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(
                title: 'Create Account',
                subtitle: 'Choose your account type to get started',
                titleColor: AppTheme.primaryTeal,
                subtitleColor: AppTheme.textLight,
                crossAxisAlignment: CrossAxisAlignment.start,
                fontFamily: 'Poppins',
                titleFontWeight: FontWeight.w700,
                subtitleFontWeight: FontWeight.w400,
              ),
              const SizedBox(height: 24),
              RoleSelectionCard(
                title: "I'm a Truck Driver",
                description: "Find jobs, manage deliveries, upload documents, and receive payments.",
                image: 'assets/images/shiping_icon2.png',
                themeColor: AppTheme.accentRed,
                buttonText: "Continue as Driver",
                onSelect: () {
                  Navigator.pushNamed(context, RoutesName.driverRegistrationScreen);
                },
              ),
              const SizedBox(height: 16),
              RoleSelectionCard(
                title: "I'm a Broker",
                description: "Post loads, assign drivers, review documents, and track payments.",
                image: 'assets/images/icon_3.png',
                themeColor: AppTheme.primaryTeal,
                buttonText: "Continue as Broker",
                onSelect: () {
                  Navigator.pushNamed(context, RoutesName.brokerRegistrationScreen);
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}
