import 'package:flutter/material.dart';

import '../core/theme.dart';
import 'Header.dart';
import 'custom_container.dart';
import 'custom_icon.dart';
class GridStat extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final Color? imageColor;

  const GridStat({super.key, required this.imagePath, required this.title, required this.subtitle, this.imageColor});

  @override
  Widget build(BuildContext context) {
    return    Expanded(
      child: CustomContainer(
        backgroundColor: AppTheme.backgroundWhite.withValues(
          alpha: 0.1,
        ),
        borderColor: AppTheme.backgroundWhite.withValues(alpha: 0.2),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomIcon(
            imagePath: imagePath,
            color: AppTheme.accentRed,
            size: 24,
          ),
            const SizedBox(height: 10),
            Header(
              title: title,
              subtitle: subtitle,
              titleSize: 12,
              subtitleSize: 20,
              titleColor: AppTheme.subtitle,
              titleFontWeight: FontWeight.w400,
              subtitleColor: AppTheme.backgroundWhite,
              subtitleFontWeight: FontWeight.w700,
              space: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
            )
          ],
        ),
      ),
    );
    // return Column(
    //   children: [
    //     Row(
    //       children: [
    //         Expanded(
    //           child: CustomContainer(
    //             backgroundColor: AppTheme.backgroundWhite.withValues(
    //               alpha: 0.1,
    //             ),
    //             borderColor: AppTheme.backgroundWhite.withValues(alpha: 0.2),
    //
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [ CustomIcon(
    //                 imagePath: imagePath,
    //                 color: AppTheme.accentRed,
    //                 size: 24,
    //               ),
    //                 const SizedBox(height: 10),
    //                 Header(
    //                   title: title,
    //                   subtitle: subtitle,
    //                   titleSize: 12,
    //                   subtitleSize: 20,
    //                   titleColor: AppTheme.subtitle,
    //                   titleFontWeight: FontWeight.w400,
    //                   subtitleColor: AppTheme.backgroundWhite,
    //                   subtitleFontWeight: FontWeight.w700,
    //                   space: 10,
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                 )
    //               ],
    //             ),
    //           ),
    //         ),
    //         const SizedBox(width: 8),
    //         Expanded(
    //           child: CustomContainer(
    //             backgroundColor: AppTheme.backgroundWhite.withValues(
    //               alpha: 0.1,
    //             ),
    //             borderColor: AppTheme.backgroundWhite.withValues(alpha: 0.2),
    //
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [ CustomIcon(
    //                 imagePath: imagePath,
    //                 color: AppTheme.accentRed,
    //                 size: 24,
    //               ),
    //                 const SizedBox(height: 10),
    //                 Header(
    //                   title: title,
    //                   subtitle: subtitle,
    //                   titleSize: 12,
    //                   subtitleSize: 20,
    //                   titleColor: AppTheme.subtitle,
    //                   titleFontWeight: FontWeight.w400,
    //                   subtitleColor: AppTheme.backgroundWhite,
    //                   subtitleFontWeight: FontWeight.w700,
    //                   space: 10,
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                 )
    //               ],
    //             ),
    //           ),
    //         ),
    //
    //       ],
    //     ),
    //     const SizedBox(height: 8),
    //     Row(
    //       children: [
    //         Expanded(
    //           child: CustomContainer(
    //             backgroundColor: AppTheme.backgroundWhite.withValues(
    //               alpha: 0.1,
    //             ),
    //             borderColor: AppTheme.backgroundWhite.withValues(alpha: 0.2),
    //
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [ CustomIcon(
    //                 imagePath: imagePath,
    //                 color: AppTheme.accentRed,
    //                 size: 24,
    //               ),
    //                 const SizedBox(height: 10),
    //                 Header(
    //                   title: title,
    //                   subtitle: subtitle,
    //                   titleSize: 12,
    //                   subtitleSize: 20,
    //                   titleColor: AppTheme.subtitle,
    //                   titleFontWeight: FontWeight.w400,
    //                   subtitleColor: AppTheme.backgroundWhite,
    //                   subtitleFontWeight: FontWeight.w700,
    //                   space: 10,
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                 )
    //               ],
    //             ),
    //           ),
    //         ),
    //         const SizedBox(width: 8),
    //         Expanded(
    //           child: CustomContainer(
    //             backgroundColor: AppTheme.backgroundWhite.withValues(
    //               alpha: 0.1,
    //             ),
    //             borderColor: AppTheme.backgroundWhite.withValues(alpha: 0.2),
    //
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [ CustomIcon(
    //                 imagePath: imagePath,
    //                 color: AppTheme.accentRed,
    //                 size: 24,
    //               ),
    //                 const SizedBox(height: 10),
    //                 Header(
    //                   title: title,
    //                   subtitle: subtitle,
    //                   titleSize: 12,
    //                   subtitleSize: 20,
    //                   titleColor: AppTheme.subtitle,
    //                   titleFontWeight: FontWeight.w400,
    //                   subtitleColor: AppTheme.backgroundWhite,
    //                   subtitleFontWeight: FontWeight.w700,
    //                   space: 10,
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                 )
    //               ],
    //             ),
    //           ),
    //         ),
    //
    //       ],
    //     ),
    //
    //   ],
    // );
  }
}

