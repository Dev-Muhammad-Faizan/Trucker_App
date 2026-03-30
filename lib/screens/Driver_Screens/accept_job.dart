import 'package:flutter/material.dart';
import 'package:trucker_connect/core/theme.dart';
import 'package:trucker_connect/widgets/broker/row_header.dart';
import 'package:trucker_connect/widgets/custom_icon.dart';
import '../../widgets/Header.dart';
import '../../widgets/custom_container.dart';
import '../../widgets/primary_button.dart';

class AcceptJob extends StatefulWidget {
  final Map<String, dynamic>? job;

  const AcceptJob({super.key, this.job});

  @override
  State<AcceptJob> createState() => _AcceptJobState();
}

class _AcceptJobState extends State<AcceptJob> {
  @override
  Widget build(BuildContext context) {
    final jobData =
        widget.job ??
        {
          'title': 'Local Freight Pickup',
          'pickupLocation': 'Dallas Warehouse, 1234 Industrial Blvd',
          'deliveryLocation': 'Houston Distribution Center, 5678 Commerce St',
        };

    return Scaffold(
      backgroundColor: AppTheme.backgroundWhite,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(160),
        child: AppBar(
          backgroundColor: AppTheme.backgroundRed,
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
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Header(
                      title: jobData['title'],
                      titleSize: 24,
                      titleColor: AppTheme.backgroundWhite,
                      titleFontWeight: FontWeight.w700,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.backgroundOrange,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Assigned',
                        style: TextStyle(
                          color: AppTheme.backgroundWhite,
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          children: [
            CustomContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RowHeader(
                    imagePath: 'assets/images/all/location.svg',
                    iconColor: AppTheme.textLight,
                    title: 'pickup Location',
                    subtitle: jobData['pickupLocation'],
                    titlesize: 14,
                    subtitleSize: 16,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                  const SizedBox(height: 24),
                  PrimaryButton(
                    text: 'Go to Pick-Up',
                    textColor: AppTheme.backgroundWhite,
                    backgroundColor: AppTheme.primaryTeal,
                    icon: Icons.near_me_outlined,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            CustomContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RowHeader(
                    imagePath: 'assets/images/all/location.svg',
                    iconColor: AppTheme.accentRed,
                    title: 'Delivery Location',
                    subtitle: jobData['deliveryLocation'],
                    titlesize: 14,
                    subtitleSize: 16,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                  const SizedBox(height: 24),
                  PrimaryButton(
                    text: 'Go to Delivery Location',
                    textColor: AppTheme.backgroundWhite,
                    backgroundColor: AppTheme.accentRed,
                    icon: Icons.near_me_outlined,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            CustomContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Header(
                    title: 'Upload Documents',
                    titleColor: AppTheme.primaryTeal,
                    subtitle:
                        'Upload delivery documents, bills of lading, or proof of delivery photos.',
                    subtitleColor: AppTheme.textLight,
                    titleFontWeight: FontWeight.w600,
                    titleSize: 18,
                    subtitleSize: 14,
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                  const SizedBox(height: 12),

                  Row(
                    children: [
                      _Header(imagePath: 'assets/images/all/camera.svg', title: 'Take Photo'),
                      const SizedBox(width: 12),
                      _Header(imagePath: 'assets/images/all/upload.svg', title: 'Upload File'),

                      // Expanded(
                      //   child: CustomContainer(
                      //     height: 136,
                      //     padding: const EdgeInsets.symmetric(vertical: 24),
                      //     child: Center(
                      //       child: Header(
                      //         imagePath: 'assets/images/all/upload.svg',
                      //         size: 16,
                      //         title: 'Upload File',
                      //         titleSize: 16,
                      //         titleFontWeight: FontWeight.w500,
                      //         titleColor: AppTheme.primaryTeal,
                      //         imagespce: 8,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Note container
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                color: AppTheme.lightOrange,
                border: Border.all(color: AppTheme.borderOrange),
                borderRadius: BorderRadius.circular(12),
              ),
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    height: 1.5,
                  ),
                  children: [
                    TextSpan(
                      text: 'Note: ',
                      style: TextStyle(
                        color: AppTheme.noteColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextSpan(
                      text:
                          'Remember to call the dispatcher 30 minutes before arrival at both locations.',
                      style: TextStyle(
                        color: AppTheme.noteColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),

            PrimaryButton(
              text: 'Mark Job as Complete',
              backgroundColor: AppTheme.backgroundGreen,
              onPressed: () {},
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _Header({required String imagePath, required String title}) {
    return Expanded(
      child: CustomContainer(
        height: 136,
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomIcon(
                imagePath: imagePath,
                size: 16,
                color: AppTheme.primaryTeal,
              ),
              const SizedBox(height: 12),
              Header(
                title: title,
                titleSize: 14,
                titleFontWeight: FontWeight.w500,
                titleColor: AppTheme.primaryTeal,
                imagespce: 8,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
