import 'package:flutter/material.dart';
import '../../core/theme.dart';
import '../../widgets/Header.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/test/stat_card.dart';
import '../../widgets/broker/recent_activity_card.dart';
import '../../widgets/broker/quick_stats_card.dart';
import '../../widgets/recent_activity_list.dart';
import 'create_job.dart';

class BrokerHomeTab extends StatelessWidget {
  const BrokerHomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundWhite,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: AppTheme.primaryTeal,
            expandedHeight: 460.0,
            automaticallyImplyLeading: false,
            floating: false,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              background: _buildHeaderAndStats(),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(
                color: AppTheme.backgroundWhite,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PrimaryButton(
                      text: '+ Create New Job',
                      backgroundColor: AppTheme.accentRed,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const CreateJob()),
                        );
                      },
                    ),
                    const SizedBox(height: 32),
                    Header(
                      title: 'Recent Activity',
                      titleFontWeight: FontWeight.w600,
                      size: 20,
                      titleColor: AppTheme.primaryTeal,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                    const SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      height: 300,
                      child: const RecentActivityList(),
                    ),
                    const SizedBox(height: 32),
                    const QuickStatsCard(
                      thisWeekValue: '24 Jobs',
                      thisMonthValue: '98 Jobs',
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderAndStats() {
    return Container(
      height: 460,
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 60, 24, 32),
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
          Expanded(
            child: GridView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                mainAxisExtent: 140, // strictly enforce exact squarish height perfectly regardless of emulator width!
              ),
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
  }
}
