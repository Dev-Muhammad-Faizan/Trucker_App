import 'package:flutter/material.dart';
import 'package:trucker_connect/widgets/custom_icon.dart';

import '../../core/theme.dart';
import '../../routes/routes_name.dart';
import '../../widgets/Header.dart';
import '../../widgets/broker/row_header.dart';
 import '../../widgets/custom_container.dart';
import '../../widgets/primary_button.dart';

class DriverProfileTab extends StatefulWidget {
  const DriverProfileTab({super.key});

  @override
  State<DriverProfileTab> createState() => _DriverProfileTabState();
}

class _DriverProfileTabState extends State<DriverProfileTab> {
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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Header(
                    imagePath: 'assets/images/navigation/profile.svg',
                    backgroundSize: 80,
                    size: 40,
                    imageBackgroundColor: AppTheme.backgroundWhite.withValues(
                      alpha: 0.2,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Header(
                          title: 'John Smith.',
                          titleSize: 24,
                          subtitle: 'Professional Driver',
                          subtitleColor: AppTheme.subtitle,
                          subtitleSize: 16,
                          space: 0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          child: Column(
            children: [
              CustomContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Header(
                      title: 'Driver Information',
                      titleSize: 18,
                      titleFontWeight: FontWeight.w700,
                      titleColor: AppTheme.primaryTeal,
                    ),
                    const SizedBox(height: 16),
                    const RowHeader(
                      imagePath: 'assets/images/all/truck.svg',
                      iconColor: AppTheme.primaryTeal,
                      title: 'Truck Info',
                      subtitle: '2020 Freightliner cascadia',
                    ),

                    const SizedBox(height: 12),
                    const RowHeader(
                      imagePath: 'assets/images/all/location.svg',
                      iconColor: AppTheme.primaryTeal,
                      title: 'License Number',
                      subtitle: 'D1234567',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              CustomContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Header(
                      title: 'Performance Stats',
                      titleSize: 18,
                      titleFontWeight: FontWeight.w700,
                      titleColor: AppTheme.primaryTeal,
                    ),
                    const SizedBox(height: 16),
                    IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: _buildStatCard(
                              'Rating',
                              '4.8',
                             imagePath: 'assets/images/all/rating.svg',
                              bottomWidget: Row(
                                children: List.generate(5, (index) {
                                  if (index < 4) {
                                    return const Icon(
                                      Icons.star,
                                      size: 16,
                                      color: AppTheme.accentRed,
                                    );
                                  }
                                  return const Icon(
                                    Icons.star_border,
                                    size: 16,
                                    color: AppTheme.textLight,
                                  );
                                }),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _buildStatCard('Completed\nJobs', '142'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    PrimaryButton(
                      text: 'View Reviews',
                      textColor: AppTheme.primaryTeal,
                      onPressed: () {},
                      isOutlined: true,
                      OutlineColor: AppTheme.inputBorder,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              CustomContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Header(
                      title: 'Account Settings ',
                      titleColor: AppTheme.primaryTeal,
                      titleSize: 18,
                      titleFontWeight: FontWeight.w700,
                    ),
                    const SizedBox(height: 12),

                    _setting(
                      imagepath: 'assets/images/navigation/profile.svg',
                      title: 'Edit Profile',
                      onTap: () {},
                    ),

                    const SizedBox(height: 8),
                    _setting(
                      imagepath: 'assets/images/all/truck.svg',
                      title: 'Update Truck Info',
                      onTap: () {},
                    ),

                    const SizedBox(height: 8),
                    _setting(
                      imagepath: 'assets/images/all/pay.svg',
                      imageColor: AppTheme.accentRed,
                      title: 'Pay Ticket',
                      onTap: () {},
                    ),

                    const SizedBox(height: 8),
                    _setting(
                      imagepath: 'assets/images/all/bell.svg',
                      title: 'Notification Settings',
                      onTap: () {
                        Navigator.pushNamed(context, RoutesName.notificationScreen);
                      },
                    ),

                    const SizedBox(height: 8),
                    _setting(
                      imagepath: 'assets/images/all/setting.svg',
                      title: 'App Settings',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              CustomContainer(
                backgroundColor: AppTheme.lightGrey.withValues(alpha: 0.5),
                 child: Column(
                  children: [
                    RowHeader(
                       iconColor: AppTheme.textLight,
                      imagePath: 'assets/images/all/card.svg',
                      title: 'Member Since',
                      subtitle: 'January 2024',
                    ),
                    const SizedBox(height: 12),
                    RowHeader(
                      imagePath: 'assets/images/all/mail.svg',
                      iconColor: AppTheme.textLight,
                      title: 'Email',
                      subtitle: 'john.smith@gmail.com',
                    ),
                    const SizedBox(height: 12),
                    RowHeader(
                      imagePath: 'assets/images/all/phone.svg',
                      iconColor: AppTheme.textLight,
                      title: 'Phone',
                      subtitle: '(555) 123-4567',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              PrimaryButton(
                text: 'Sign Out',
                textColor: AppTheme.accentRed,
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    RoutesName.loginScreen,
                    (route) => false,
                  );
                },
                isOutlined: true,
                OutlineColor: AppTheme.inputBorder,
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  Widget _setting({
    required imagepath,
    required title,
    required onTap,
   Color? imageColor,
  }) {
    return PrimaryButton(
      mainAxisAlignment: MainAxisAlignment.start,
      isOutlined: true,
      OutlineColor: AppTheme.inputBorder,
      imagePath: imagepath,
      imageColor: imageColor ?? AppTheme.primaryTeal ,
      backgroundColor: AppTheme.backgroundWhite,
      textColor: AppTheme.primaryTeal,
      text: title,
      onPressed: onTap,
    );
  }

  Widget _buildStatCard(
    String label,
    String value, {
    Color? valueColor,
     String? imagePath,
     Widget? bottomWidget,
  }) {
    return CustomContainer(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
         backgroundColor: AppTheme.lightGrey.withValues(alpha: 0.5),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (imagePath != null) ...[
                CustomIcon(imagePath: imagePath, size: 20),
                const SizedBox(width: 6),
              ],
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(
                    color: AppTheme.textLight,
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Text(
              value,
              style: TextStyle(
                color: valueColor ?? AppTheme.primaryTeal,
                fontSize: 24,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          if (bottomWidget != null) ...[
            const SizedBox(height: 6),
            bottomWidget,
          ],
        ],
      ),
    );
  }
}
