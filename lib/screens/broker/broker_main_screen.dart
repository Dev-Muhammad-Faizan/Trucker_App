import 'package:flutter/material.dart';
import '../../core/theme.dart';
import 'broker_drivers_tab.dart';
import 'broker_home_tab.dart';
import 'broker_jobs_tab.dart';
import 'broker_payments_tab.dart';
import 'broker_profile_tab.dart';

class BrokerMainScreen extends StatefulWidget {
  const BrokerMainScreen({super.key});

  @override
  State<BrokerMainScreen> createState() => _BrokerMainScreenState();
}

class _BrokerMainScreenState extends State<BrokerMainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const BrokerHomeTab(),
    const BrokerJobsTab(),
    const BrokerDriversTab(),
    const BrokerPaymentsTab(),
    const BrokerProfileTab(),
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
                  _buildNavItem(Icons.home_outlined, Icons.home, 'Home', 0),
                  _buildNavItem(Icons.work_outline, Icons.work, 'Jobs', 1),
                  _buildNavItem(Icons.people_outline, Icons.people, 'Drivers', 2),
                  _buildNavItem(Icons.attach_money_outlined, Icons.attach_money, 'Payments', 3),
                  _buildNavItem(Icons.person_outline, Icons.person, 'Profile', 4),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(
      IconData unselectedIcon, IconData selectedIcon, String label, int index) {
    final isSelected = _selectedIndex == index;
    
    return BottomNavigationBarItem(
      icon: Container(
        margin: const EdgeInsets.only(bottom: 10, top: 8), // Adjusted vertical margin within the bar
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
        child: Icon(
          isSelected ? selectedIcon : unselectedIcon,
          color: isSelected ? Colors.white : AppTheme.textLight,
          size: 22,
        ),
      ),
      label: label,
    );
  }
}
