import 'package:flutter/material.dart';
import 'package:trucker_connect/screens/Driver_Screens/driver_docs_tab.dart';
import 'package:trucker_connect/screens/Driver_Screens/driver_home_tab.dart';
import 'package:trucker_connect/screens/Driver_Screens/driver_job_tab.dart';
import 'package:trucker_connect/screens/Driver_Screens/driver_payment_tab.dart';
import 'package:trucker_connect/screens/Driver_Screens/driver_profile_tab.dart';
import 'package:trucker_connect/widgets/Header.dart';
import 'package:trucker_connect/widgets/custom_icon.dart';
import '../../core/theme.dart';
 class DriverMainScreen extends StatefulWidget {
  const DriverMainScreen({super.key});

  @override
  State<DriverMainScreen> createState() => _DriverMainScreenState();
}

class _DriverMainScreenState extends State<DriverMainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const DriverHomeTab(),
    const DriverJobTab(),
    const DriverDocsTab(),
    const DriverPaymentTab(),
    const DriverProfileTab(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundWhite,
      body: _pages[_selectedIndex],
      bottomNavigationBar: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 20,
                spreadRadius: 2,
                offset: const Offset(0, -2), // Shadow going upwards
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            child: Theme(
              data: Theme.of(context).copyWith(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: BottomNavigationBar(
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white, // Ensure it's opaque white
                selectedItemColor: AppTheme.accentRed,
                unselectedItemColor: AppTheme.textLight,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                selectedLabelStyle: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 10,
                    fontWeight: FontWeight.w600
                ),
                unselectedLabelStyle: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 10,
                    fontWeight: FontWeight.w400
                ),
                elevation: 0,
                items: [
                  _buildNavItem('assets/images/navigation/home.svg', 'Home', 0),
                  _buildNavItem('assets/images/navigation/job.svg', 'Jobs', 1),
                  _buildNavItem('assets/images/navigation/doc.svg', 'Docs', 2),
                  _buildNavItem('assets/images/navigation/payment.svg', 'Payments', 3),
                  _buildNavItem('assets/images/navigation/profile.svg', 'Profile', 4),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(String imagePath, String label, int index) {
    final isSelected = _selectedIndex == index;

    return BottomNavigationBarItem(
      icon: Container(
        margin: const EdgeInsets.only(bottom: 10, top: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.accentRed : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
          boxShadow: isSelected ? [
            BoxShadow(
              color: AppTheme.accentRed.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            )
          ] : null,
        ),
        child: CustomIcon(
          color: isSelected ? AppTheme.backgroundWhite : AppTheme.textLight,
          imagePath: imagePath,
          size: 22,
        ),
      ),
      label: label,
    );
  }
}
