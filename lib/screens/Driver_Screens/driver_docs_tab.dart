import 'package:flutter/material.dart';
import 'package:trucker_connect/widgets/custom_container.dart';

import '../../core/theme.dart';
import '../../widgets/Header.dart';
import '../../widgets/primary_button.dart';

class DriverDocsTab extends StatefulWidget {
  const DriverDocsTab({super.key});

  @override
  State<DriverDocsTab> createState() => _DriverDocsTabState();
}

class _DriverDocsTabState extends State<DriverDocsTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(130),
        child: AppBar(
          backgroundColor: AppTheme.primaryTeal,
          automaticallyImplyLeading: false,
          elevation: 0,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Header(
                    title: 'Upload Documents',
                    subtitle: 'Add job-related documents',
                    titleSize: 24,
                    titleColor: AppTheme.backgroundWhite,
                    subtitleColor: AppTheme.backgroundWhite.withValues(
                      alpha: 0.8,
                    ),
                    space: 4,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      backgroundColor: AppTheme.backgroundWhite,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              CustomContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Header(
                      title: 'Upload Options',
                      titleFontWeight: FontWeight.w600,
                      titleColor: AppTheme.primaryTeal,
                      titleSize: 18,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                    const SizedBox(height: 11),
                    _buildOptioncard(
                      imagepath: 'assets/images/all/camera.svg',
                      imageColor: AppTheme.primaryTeal,
                      imageBackgroundColor: AppTheme.primaryTeal.withValues(
                        alpha: 0.1,
                      ),
                      title: 'Take Photo',
                      subtitle: 'Use camera',
                    ),
                    const SizedBox(height: 12),
                    _buildOptioncard(
                      imagepath: 'assets/images/navigation/doc.svg',
                      imageColor: AppTheme.accentRed,
                      imageBackgroundColor: AppTheme.accentRed.withValues(
                        alpha: 0.1,
                      ),
                      title: 'Upload PDF',
                      subtitle: 'From files',
                    ),
                    const SizedBox(height: 12),
                    _buildOptioncard(
                      imagepath: 'assets/images/all/upload.svg',
                      imageColor: AppTheme.backgroundGreen,
                      imageBackgroundColor: AppTheme.backgroundGreen.withValues(
                        alpha: 0.1,
                      ),
                      title: 'Upload Image',
                      subtitle: 'From gallery',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              CustomContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Header(
                      title: 'Uploaded Files',
                      titleFontWeight: FontWeight.w600,
                      titleColor: AppTheme.primaryTeal,
                      titleSize: 18,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                    const SizedBox(height: 20),
                    _buildFileCard(
                      imagepath: 'assets/images/navigation/doc.svg',
                      imageColor: AppTheme.primaryTeal,
                      imageBackgroundColor: AppTheme.primaryTeal.withValues(
                        alpha: 0.1,
                      ),
                      title: 'Bill of lading.pdf',
                      subtitle: 'PDF',
                    ),

                    const SizedBox(height: 12),
                    _buildFileCard(
                      imagepath: 'assets/images/navigation/doc.svg',
                      imageColor: AppTheme.primaryTeal,
                      imageBackgroundColor: AppTheme.primaryTeal.withValues(
                        alpha: 0.1,
                      ),
                      title: 'DeliveryPhoto.jpg',
                      subtitle: 'IMAGE',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              PrimaryButton(
                text: 'Submit Documents',
                backgroundColor: AppTheme.accentRed,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptioncard({
    required String imagepath,
    required String title,
    required String subtitle,
    Color? imageColor,
    Color? imageBackgroundColor,
  }) {
    return CustomContainer(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          Header(
            imagePath: imagepath,
            backgroundSize: 48,
            size: 16,
            imagecolor: imageColor,
            imageBackgroundColor: imageBackgroundColor,
          ),
          const SizedBox(width: 16),
          Header(
            title: title,
            titleFontWeight: FontWeight.w600,
            titleSize: 14,
            titleColor: AppTheme.primaryTeal,
            subtitle: subtitle,
            subtitleSize: 14,
            subtitleFontWeight: FontWeight.w500,
            subtitleColor: AppTheme.textLight,
            space: 0,
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ],
      ),
    );
  }

  Widget _buildFileCard({
    required String imagepath,
    required String title,
    required String subtitle,
    Color? imageColor,
    Color? imageBackgroundColor,
  }) {
    return CustomContainer(
      padding: EdgeInsets.zero,
      width: double.infinity,
      backgroundColor: AppTheme.lightGrey.withValues(alpha: 0.5),
      child: Center(
        child: ListTile(
          leading: Header(
            imagePath: imagepath,
            backgroundSize: 40,
            size: 20,
            imageBackgroundColor: imageBackgroundColor,
            imagecolor: imageColor,
          ),
          title: Header(
            crossAxisAlignment: CrossAxisAlignment.start,
            title: title,
            titleSize: 14,
            titleColor: AppTheme.primaryTeal,
            titleFontWeight: FontWeight.w500,
          ),
          subtitle: Header(
            crossAxisAlignment: CrossAxisAlignment.start,
            subtitle: subtitle,
            subtitleSize: 12,
            subtitleColor: AppTheme.textLight,
          ),
          trailing: IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: const Icon(Icons.close, color: AppTheme.accentRed, size: 16),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
