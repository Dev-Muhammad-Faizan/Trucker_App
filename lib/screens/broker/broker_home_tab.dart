import 'package:flutter/material.dart';
import '../../core/theme.dart';
import '../../widgets/Header.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/test/stat_card.dart';
import '../../widgets/broker/recent_activity_card.dart';
import '../../widgets/broker/quick_stats_card.dart';
import '../../widgets/recent_activity_list.dart';

class BrokerHomeTab extends StatelessWidget {
  const BrokerHomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryTeal,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // Fixed Top Header
            _buildHeaderAndStats(),
            
            // Scrollable White Body
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: AppTheme.backgroundWhite,
                
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Create New Job Button
                      PrimaryButton(
                        text: '+ Create New Job',
                        backgroundColor: AppTheme.accentRed,
                        onPressed: () {
                          // TODO: Navigate to create job screen
                        },
                      ),
                      const SizedBox(height: 32),
                      Header( title: 'Recent Activity',
                        titleFontWeight: FontWeight.w600,
                        size: 20,
                        titleColor: AppTheme.primaryTeal,
                        crossAxisAlignment: CrossAxisAlignment.start,),
                      const SizedBox(height: 16),
                      // Recent Activity Section
                      Container(
                          width: double.infinity,
                          height: 300,
                          child: const RecentActivityList()),

                      const SizedBox(height: 32),
                      // Quick Stats Section
                      const QuickStatsCard(
                        thisWeekValue: '24 Jobs',
                        thisMonthValue: '98 Jobs',
                      ),
                      
                      const SizedBox(height: 32),
                      // Add extra space at the bottom to account for the floating navbar
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderAndStats() {
    return Container(
      height: 406,
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Header(
                title: 'Welcome,',
                subtitle: 'Logistics Inc.',
                fontFamily: 'Poppins',
                titleFontWeight: FontWeight.w700,
                subtitleFontWeight: FontWeight.w400,
                crossAxisAlignment: CrossAxisAlignment.start,
                titleSize: 26,
                subtitleSize: 18,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Icon(
                  Icons.notifications_none,
                  color: AppTheme.backgroundWhite,
                  size: 28,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Expanded(
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.5, // Wider aspect ratio fits the rectangle cards in design and prevents overflow
              children: const [
                StatCard(
                  title: 'Active Jobs',
                  value: '8',
                  icon: Icons.work_outline,
                  iconColor: AppTheme.accentRed,
                ),
                StatCard(
                  title: 'Drivers Assigned',
                  value: '12',
                  icon: Icons.people_outline,
                  iconColor: AppTheme.accentRed,
                ),
                StatCard(
                  title: 'Invoices Pending',
                  value: '5',
                  icon: Icons.receipt_long_outlined,
                  iconColor: AppTheme.accentRed,
                ),
                StatCard(
                  title: 'Payments Sent',
                  value: '\$18.5K',
                  icon: Icons.attach_money,
                  iconColor: AppTheme.accentRed,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }}
