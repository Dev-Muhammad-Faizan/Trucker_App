import 'package:flutter/material.dart';
import 'package:trucker_connect/routes/routes_name.dart';
import 'package:trucker_connect/widgets/custom_icon.dart';

import '../../core/theme.dart';
import '../../widgets/Header.dart';
import '../../widgets/broker/row_header.dart';
import '../../widgets/custom_container.dart';
import '../../widgets/primary_button.dart';
class DriverJobDetails extends StatefulWidget {
  final Map<String, dynamic>? job;

  const DriverJobDetails({super.key,this.job});

  @override
  State<DriverJobDetails> createState() => _DriverJobDetailsState();
}

class _DriverJobDetailsState extends State<DriverJobDetails> {
  @override
  Widget build(BuildContext context) {
    final jobData = widget.job ?? {
      'title': 'Local Freight Pickup',
      'company': 'Acme Logistics Inc.',
      'pickupLocation': 'Dallas Warehouse, 1234 Industrial Blvd, Dallas, TX 75201',
      'deliveryLocation': 'Houston Distribution Center, 5678 Commerce St, Houston, TX 77002',
      'time': 'March 15, 2026 - 9:00 AM',
      'loadType': 'Dry Van',
      'price': '\$1,200',
      'description': 'Standard freight delivery requiring careful handling. Load consists of packaged goods that need to arrive by end of day.',
      'instructions': 'Call dispatcher 30 minutes before arrival at both pickup and delivery locations. Signature required at delivery.',
    };

    return Scaffold(
      backgroundColor: AppTheme.backgroundWhite,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(130),
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
                  icon: const Icon(Icons.arrow_back, color: AppTheme.backgroundWhite, size: 20),
                  onPressed: () => Navigator.pop(context),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Text('Back',
                      style: TextStyle(
                          color: AppTheme.backgroundWhite,
                          fontSize: 16,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500)),
                )
              ],
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Header(
                  title: jobData['title'],
                  titleSize: 24,
                  titleColor: AppTheme.backgroundWhite,
                  titleFontWeight: FontWeight.w700,
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
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
                  children: [
                    RowHeader(
                      imagePath: 'assets/images/all/company.svg',
                      iconColor: AppTheme.primaryTeal,
                      title: 'Broker Company',
                      subtitle: jobData['company'],
                      subtitleFontWeight: FontWeight.w600,
                      titlesize: 14,
                    ),
                    const SizedBox(height: 16),
                    const Divider(color: AppTheme.inputBorder),
                    const SizedBox(height: 16),
                    RowHeader(
                      imagePath: 'assets/images/all/location.svg',
                      iconColor: AppTheme.textLight,
                      title: 'Pickup Address',
                      subtitle: jobData['pickupLocation'],
                      titlesize: 14,

                    ),
                    const SizedBox(height: 16),
                    RowHeader(
                      imagePath: 'assets/images/all/location.svg',
                      iconColor: AppTheme.accentRed,
                      title: 'Delivery Address',
                      subtitle: jobData['deliveryLocation'],
                      titlesize: 14,

                    ),
                    const SizedBox(height: 16),
                    const Divider(color: AppTheme.inputBorder),
                    const SizedBox(height: 16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: RowHeader(
                            imagePath: 'assets/images/all/card.svg',
                             imgSize: 11,
                             height: 20,
                             iconColor: AppTheme.textLight,
                            title: 'Date & Time',
                            subtitle: jobData['time'],
                            titlesize: 14,
                            crossAxisAlignment: CrossAxisAlignment.start,

                          ),
                        ),
                        Expanded(
                          child: RowHeader(
                            imagePath: 'assets/images/all/box.svg',
                            iconColor: AppTheme.textLight,
                            title: 'Load Type',
                            subtitle: jobData['loadType'],
                            titlesize: 14,
                            crossAxisAlignment: CrossAxisAlignment.start,

                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    CustomContainer(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),

                        backgroundColor: AppTheme.accentRed.withValues(alpha: 0.1),
                        borderColor: AppTheme.accentRed.withValues(alpha: 0.1),
                        child: Row(
                        children: [
                          CustomIcon(imagePath: 'assets/images/all/cash.svg',size: 24,),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Payment Rate',
                                style: TextStyle(
                                  color: AppTheme.textLight.withValues(alpha: 0.8),
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                jobData['price'],
                                style: const TextStyle(
                                  color: AppTheme.accentRed,
                                  fontSize: 24,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

               CustomContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
CustomIcon(imagePath: 'assets/images/navigation/doc.svg',size: 20,color: AppTheme.primaryTeal,),                        const SizedBox(width: 12),
                        const Header(
                          title: 'Description',
                          titleColor: AppTheme.primaryTeal,
                          titleSize: 16,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      jobData['description'] ?? '',
                      style: TextStyle(
                        color: AppTheme.textDark.withValues(alpha: 0.8),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

               CustomContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Header(
                      title: 'Additional Instructions',
                      titleColor: AppTheme.primaryTeal,
                      titleSize: 16,
                      titleFontWeight: FontWeight.w700,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      jobData['instructions'] ?? '',
                      style: TextStyle(
                        color: AppTheme.textDark.withValues(alpha: 0.8),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

               Row(
                children: [
                  Expanded(
                    child: PrimaryButton(
                      text: 'Reject Job',
                      textColor: AppTheme.primaryTeal,
                      backgroundColor: Colors.transparent,
                      isOutlined: true,
                      OutlineColor: AppTheme.inputBorder,
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: PrimaryButton(
                      text: 'Accept Job',
                      backgroundColor: AppTheme.accentRed,
                      onPressed: () {
                         Navigator.pushNamed(context, RoutesName.acceptjob, arguments: jobData);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
