import 'package:flutter/material.dart';
import 'package:trucker_connect/widgets/custom_container.dart';
import '../../core/theme.dart';
import '../../widgets/Header.dart';
import '../../widgets/custom_icon.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/test/stat_card.dart';
import '../../widgets/broker/recent_activity_card.dart';
import '../../widgets/broker/quick_stats_card.dart';
import '../../widgets/recent_activity_list.dart';

class DriverHomeTab extends StatefulWidget {
  const DriverHomeTab({super.key});

  @override
  State<DriverHomeTab> createState() => _DriverHomeTabState();
}

class _DriverHomeTabState extends State<DriverHomeTab> {
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
            flexibleSpace: FlexibleSpaceBar(background: _buildHeaderAndStats()),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: const BoxDecoration(color: AppTheme.backgroundWhite),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 24,
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Header(
                      title: 'Quick  Actions',
                      titleFontWeight: FontWeight.w600,
                      size: 20,
                      titleColor: AppTheme.primaryTeal,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                    const SizedBox(height: 12),
                    GestureDetector(
                      onTap: () {},
                      child: CustomContainer(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),

                        width: double.infinity,
                        child: Header(
                          imagePath: 'assets/images/all/truck.svg',
                          imageBackgroundColor: AppTheme.accentRed.withValues(alpha: 0.1),
                          size: 24,
                          backgroundSize: 48,
                          imagespce: 12,
                          space: 0,
                          title: 'View Jobs',
                          titleSize: 18,
                          titleFontWeight: FontWeight.w600,
                          titleColor: AppTheme.primaryTeal,
                          subtitle: 'Browse available loads',
                          subtitleSize: 14,
                          subtitleFontWeight: FontWeight.w400,
                          subtitleColor: AppTheme.textLight,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    GestureDetector(
                      onTap: () {},
                      child: CustomContainer(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),

                        width: double.infinity,
                        child: Header(
                          imagePath: 'assets/images/navigation/doc.svg',
                          imagecolor: AppTheme.primaryTeal,
                          imageBackgroundColor: AppTheme.primaryTeal.withValues(alpha: 0.1),
                          size: 24,
                          backgroundSize: 48,
                          imagespce: 12,
                          space: 0,
                          title: 'View Jobs',
                          titleSize: 18,
                          titleFontWeight: FontWeight.w600,
                          titleColor: AppTheme.primaryTeal,
                          subtitle: 'Browse available loads',
                          subtitleSize: 14,
                          subtitleFontWeight: FontWeight.w400,
                          subtitleColor: AppTheme.textLight,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    GestureDetector(
                      onTap: () {},
                      child: CustomContainer(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),

                        width: double.infinity,
                        child: Header(
                          imagePath: 'assets/images/all/invoice.svg',
                          imageBackgroundColor: AppTheme.accentRed.withValues(alpha: 0.1),
                          size: 24,
                          backgroundSize: 48,
                          imagespce: 12,
                          space: 0,
                          title: 'View Jobs',
                          titleSize: 18,
                          titleFontWeight: FontWeight.w600,
                          titleColor: AppTheme.primaryTeal,
                          subtitle: 'Browse available loads',
                          subtitleSize: 14,
                          subtitleFontWeight: FontWeight.w400,
                          subtitleColor: AppTheme.textLight,
                        ),
                      ),
                    ),

                    const SizedBox(height: 28),
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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Header(
                  title: 'Welcome,',
                  titleSize: 24,
                  subtitleSize: 20,
                  space: 0,
                  subtitle: 'Logistics Inc.',

                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: CustomIcon(
                    imagePath: 'assets/images/all/bell.svg',
                    size: 16,
                    color: AppTheme.backgroundWhite,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            GridView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                mainAxisExtent: 146,
              ),
              children: const [
                StatCard(
                  title: 'Active Jobs',
                  value: '1',
                  imagepath: 'assets/images/navigation/job.svg',
                  imageColor: AppTheme.accentRed,
                ),
                StatCard(
                  title: 'Miles',
                  value: '2,340',
                  imagepath: 'assets/images/all/location.svg',
                  imageColor: AppTheme.accentRed,
                ),
                StatCard(
                  title: 'This Week',
                  value: '\$3,200',
                  imagepath: 'assets/images/all/cash.svg',
                  imageColor: AppTheme.accentRed,
                ),
                StatCard(
                  title: 'Hours',
                  value: '38.5',
                  imagepath: 'assets/images/all/clock.svg',
                  imageColor: AppTheme.accentRed,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}
