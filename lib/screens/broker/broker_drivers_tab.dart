import 'package:flutter/material.dart';
import 'package:trucker_connect/data/mock_drivers.dart';
import 'package:trucker_connect/screens/broker/driver_review.dart';
import 'package:trucker_connect/widgets/Header.dart';
import '../../core/theme.dart';
import '../../widgets/test/driver_card.dart';

class BrokerDriversTab extends StatefulWidget {
  const BrokerDriversTab({super.key});

  @override
  State<BrokerDriversTab> createState() => _BrokerDriversTabState();
}

class _BrokerDriversTabState extends State<BrokerDriversTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundWhite,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(160),
        child: AppBar(
          backgroundColor: AppTheme.primaryTeal,
          automaticallyImplyLeading: false,
          elevation: 0,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 40, 24, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Header(
                    title: 'Drivers',
                    titleSize: 24,
                    titleColor: AppTheme.backgroundWhite,
                    titleFontWeight: FontWeight.w700,
                  ),
                  const SizedBox(height: 4),
                  Header(
                    subtitle: 'Manage your driver network',
                    subtitleSize: 14,
                    subtitleColor: AppTheme.backgroundWhite.withValues(alpha: 0.8),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        itemCount: MockDrivers.drivers.length,
        itemBuilder: (context, index) {
          final driver = MockDrivers.drivers[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: DriverCard(
              name: driver['name'],
              rating: driver['rating'].toString(),
              truckInfo: driver['truckInfo'],
              jobsCompleted: driver['jobsCompleted'].toString(),
              phone: driver['phone'],
              email: driver['email'],
              onLeaveReview: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DriverReview(driverId: driver['id']),
                  ),
                );
                 if (result == true) {
                  setState(() {});
                }
              },
              onViewProfile: () {},
            ),
          );
        },
      ),
    );
  }
}

