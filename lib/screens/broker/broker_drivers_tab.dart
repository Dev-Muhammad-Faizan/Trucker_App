import 'package:flutter/material.dart';
import '../../core/theme.dart';
import '../../widgets/test/driver_card.dart';

class BrokerDriversTab extends StatelessWidget {
  const BrokerDriversTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: AppTheme.backgroundWhite,
       appBar: AppBar(
         backgroundColor: AppTheme.primaryTeal,
         elevation: 0,
         toolbarHeight: 80,
         title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                 'Drivers',
                 style: TextStyle(
                    color: AppTheme.backgroundWhite,
                    fontSize: 24,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                 ),
               ),
               Text(
                 'Manage your driver network',
                 style: TextStyle(
                    color: AppTheme.backgroundWhite.withOpacity(0.9),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                 ),
               ),
            ],
         ),
       ),
     );
  }
}
