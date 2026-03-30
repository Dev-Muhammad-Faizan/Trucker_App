import 'package:flutter/material.dart';
import 'package:trucker_connect/widgets/custom_container.dart';
import '../../core/theme.dart';
import '../../widgets/Header.dart';
import '../../widgets/custom_icon.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final List<Map<String, dynamic>> _notifications = [
    {
      'title': 'New job assigned',
      'body': 'Local Freight Pickup - Dallas to Houston',
      'time': '5 minutes ago',
      'image': 'assets/images/navigation/job.svg',
       'color': AppTheme.primaryTeal,
      'bgColor': const Color(0xFFE0F2F1),
    },
    {
      'title': 'Invoice received',
      'body': 'John Smith submitted invoice #INV-2026-042',
      'time': '1 hour ago',
      'image': 'assets/images/all/invoice.svg',
       'color': AppTheme.accentRed,
      'bgColor': const Color(0xFFFFEBEE),
    },
    {
      'title': 'Payment recorded',
      'body': '\$1,200 sent via ACH Transfer',
      'time': '3 hours ago',
      'image': 'assets/images/all/cash.svg',
      'color': AppTheme.backgroundGreen,
      'bgColor': const Color(0xFFE8F5E9),
    },
    {
      'title': 'Review submitted',
      'body': 'New rating received - 5 stars',
      'time': '5 hours ago',
      'image': 'assets/images/all/invoice.svg',
      'color': AppTheme.backgroundOrange,
      'bgColor': const Color(0xFFFFF8E1),
    },
    {
      'title': 'Job completed',
      'body': 'Austin Distribution Run marked as complete',
      'time': '1 day ago',
      'icon': Icons.work_outline,
      'color': AppTheme.primaryTeal,
      'bgColor': const Color(0xFFE0F2F1),
    },
    {
      'title': 'Payment received',
      'body': '\$1,800 deposited to your account',
      'time': '2 days ago',
      'image': 'assets/images/all/cash.svg',
      'color': AppTheme.backgroundGreen,
      'bgColor': const Color(0xFFE8F5E9),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundWhite,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(160),
        child: AppBar(
          backgroundColor: AppTheme.primaryTeal,
          elevation: 0,
          leadingWidth: double.infinity,
          leading: Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: AppTheme.backgroundWhite,
                    size: 20,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Text(
                    'Back',
                    style: TextStyle(
                      color: AppTheme.backgroundWhite,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(90),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // ),
                  Header(
                    title: 'Notifications',
                    titleColor: AppTheme.backgroundWhite,
                    titleSize: 24,
                    space: 3,
                    subtitle: '${_notifications.length} new updates',
                    subtitleColor: AppTheme.subtitle,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                  CustomIcon(imagePath: 'assets/images/all/bell.svg', size: 32),
                ],
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        physics: const BouncingScrollPhysics(),
        itemCount: _notifications.length,
        itemBuilder: (context, index) {
          final notification = _notifications[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: _buildLocationRow(
              imagePath:
                  notification['image'] ?? 'assets/images/navigation/home.svg',
              imageColor: notification['color'],
              bgColor: notification['bgColor'],
              label: notification['title'],
              value: notification['body'],
              time: notification['time'],
            ),
          );
        },
      ),
    );
  }

  Widget _buildLocationRow({
    required String imagePath,
    required Color imageColor,
    required Color bgColor,
    required String label,
    required String value,
    required String time,
  }) {
    return CustomContainer(
      padding: const EdgeInsets.all(16),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Header(
            imagePath: imagePath,
            imagecolor: imageColor,
            imageBackgroundColor: bgColor,
            size: 24,
            backgroundSize: 48,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Header(
                  title: label,
                  titleSize: 18,
                  titleColor: AppTheme.primaryTeal,
                  titleFontWeight: FontWeight.w600,
                  subtitle: value,
                  subtitleSize: 14,
                  subtitleColor: AppTheme.textLight,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  space: 4,
                ),
                const SizedBox(height: 8),
                Header(
                  subtitle: time,

                  subtitleColor: AppTheme.textLight,
                  subtitleSize: 12,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
