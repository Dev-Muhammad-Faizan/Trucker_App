import 'package:flutter/material.dart';
import 'package:trucker_connect/widgets/Header.dart';
import '../../core/theme.dart';
import '../../widgets/test/driver_card.dart';

class BrokerDriversTab extends StatelessWidget {
  const BrokerDriversTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundWhite,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(130),
        child: AppBar(
          backgroundColor: AppTheme.primaryTeal,
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Padding(
              padding: const EdgeInsets.only(left: 24.0, bottom: 24.0, right: 24.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Header(
                      title: 'Drivers',
                      titleSize: 24,
                      titleColor: AppTheme.backgroundWhite,
                    ),
                    const SizedBox(height: 4,),
                    Header(
                      subtitle: 'Manage your driver network',
                      subtitleSize: 14,
                      subtitleColor: AppTheme.backgroundWhite,

                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        children: [
          DriverCard(
            name: 'John Smith',
            rating: '4.8',
            truckInfo: '2020 Freightliner Cascadia',
            jobsCompleted: '142',
            phone: '(555) 123-4567',
            email: 'john.smith@email.com',
            onLeaveReview: () {},
            onViewProfile: () {},
          ),
          DriverCard(
            name: 'Sarah Johnson',
            rating: '4.9',
            truckInfo: '2021 Kenworth T680',
            jobsCompleted: '98',
            phone: '(555) 234-5678',
            email: 'sarah.j@email.com',
            onLeaveReview: () {},
            onViewProfile: () {},
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
