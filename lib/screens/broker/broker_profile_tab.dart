import 'package:flutter/material.dart';
import '../../core/theme.dart';
import '../../widgets/Header.dart';
import '../../widgets/test/stat_card.dart';
import '../../widgets/primary_button.dart';

class BrokerProfileTab extends StatelessWidget {
  const BrokerProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundWhite,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: AppBar(
          backgroundColor: AppTheme.primaryTeal,
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Padding(
              padding: const EdgeInsets.only(left: 24.0, bottom: 24.0, right: 24.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Header(
                      imagePath: 'assets/images/profile.png',
                      size: 80,
                    ),
                    const SizedBox(width: 16,),
                    Header(
                      title: 'Logistics Inc.',
                      titleSize: 24,
                      titleColor: AppTheme.backgroundWhite,
                      subtitle: 'Freight Broker',
                      subtitleSize: 16,
                      subtitleColor: AppTheme.backgroundWhite,
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),

    );
  }


}
