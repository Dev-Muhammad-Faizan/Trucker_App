import 'package:flutter/material.dart';
import 'package:trucker_connect/routes/routes_name.dart';
import 'package:trucker_connect/widgets/broker/row_header.dart';
import 'package:trucker_connect/widgets/custom_container.dart';
import '../../core/theme.dart';
import '../../widgets/Header.dart';
import '../../widgets/primary_button.dart';

class BrokerProfileTab extends StatelessWidget {
  const BrokerProfileTab({super.key});

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
                    imagePath: 'assets/images/all/company.svg',
                    imagecolor: AppTheme.backgroundWhite,
                    size: 40,
                    backgroundSize: 80,
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
                          title: 'Logistics Inc.',
                          titleSize: 24,
                          titleColor: AppTheme.backgroundWhite,
                          titleFontWeight: FontWeight.w700,
                        ),
                        const SizedBox(height: 4),
                        Header(
                          title: 'Freight Broker',
                          titleSize: 16,
                          titleColor: AppTheme.backgroundWhite.withValues(
                            alpha: 0.8,
                          ),
                          titleFontWeight: FontWeight.w400,
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
                      title: 'Company Information',
                      titleSize: 18,
                      titleFontWeight: FontWeight.w700,
                      titleColor: AppTheme.primaryTeal,
                    ),
                    const SizedBox(height: 16),
                    const RowHeader(
                      imagePath: 'assets/images/all/mail.svg',
                      iconColor: AppTheme.primaryTeal,
                      title: 'Email',
                      subtitle: 'contact@logisticsinc.com',
                    ),
                    const SizedBox(height: 12),
                    const RowHeader(
                      imagePath: 'assets/images/all/phone.svg',
                      iconColor: AppTheme.primaryTeal,
                      title: 'Phone',
                      subtitle: '(555) 987-6543',
                    ),
                    const SizedBox(height: 12),
                    const RowHeader(
                      imagePath: 'assets/images/all/location.svg',
                      iconColor: AppTheme.primaryTeal,
                      title: 'Location',
                      subtitle: 'Dallas, TX',
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
                      title: 'Business Stats',
                      titleSize: 18,
                      titleFontWeight: FontWeight.w700,
                      titleColor: AppTheme.primaryTeal,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: _buildStatCard('Total Jobs Posted', '234'),
                        ),
                        const SizedBox(width: 16),
                        Expanded(child: _buildStatCard('Active Drivers', '18')),
                      ],
                    ),
                    const SizedBox(height: 12.15),
                    Row(
                      children: [
                        Expanded(
                          child: _buildStatCard(
                            'This Month',
                            '42 Jobs',
                            valueColor: AppTheme.primaryTeal,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: _buildStatCard(
                            'Total Paid',
                            '\$156K',
                            valueColor: AppTheme.primaryTeal,
                          ),
                        ),
                      ],
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
                      title: 'Account Settings',
                      titleColor: AppTheme.primaryTeal,
                      titleSize: 18,
                      titleFontWeight: FontWeight.w700,
                    ),
                    const SizedBox(height: 16),
                    _setting(
                      imagepath: 'assets/images/all/company.svg',
                      title: 'Edit Company Profile',
                      onTap: () {},
                    ),
                    const SizedBox(height: 8),
                    _setting(
                      imagepath: 'assets/images/all/mail.svg',
                      title: 'Notification Settings',
                      onTap: () {},
                    ),
                    const SizedBox(height: 8),
                    _setting(
                      imagepath: 'assets/images/all/phone.svg',
                      title: 'Update Contact Info',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              CustomContainer(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),
                backgroundColor: AppTheme.lightGrey.withValues(alpha: 0.5),
                child: const RowHeader(
                  imagePath: 'assets/images/all/card.svg',
                  iconColor: AppTheme.textLight,
                  title: 'Member Since',
                  subtitle: 'March 2024',
                ),
              ),
              const SizedBox(height: 16),

              PrimaryButton(
                text: 'Sign Out',
                textColor: AppTheme.accentRed,
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    RoutesName.loginScreen,
                    // (route) => true,
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
      imageColor: imageColor ?? AppTheme.primaryTeal,
      backgroundColor: AppTheme.backgroundWhite,
      textColor: AppTheme.primaryTeal,
      text: title,
      onPressed: onTap,
    );
  }

  Widget _buildStatCard(String label, String value, {Color? valueColor}) {
    return CustomContainer(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      backgroundColor: AppTheme.lightGrey.withValues(alpha: 0.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
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
        ],
      ),
    );
  }
}
