import 'package:flutter/material.dart';
import '../../core/theme.dart';
import '../../widgets/test/job_card.dart';

class BrokerJobsTab extends StatefulWidget {
  const BrokerJobsTab({super.key});

  @override
  State<BrokerJobsTab> createState() => _BrokerJobsTabState();
}

class _BrokerJobsTabState extends State<BrokerJobsTab> {
  final List<String> _filters = ['Open', 'Assigned', 'Active', 'Done'];
  String _selectedFilter = 'Open';

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
                 'Job Management',
                 style: TextStyle(
                    color: AppTheme.backgroundWhite,
                    fontSize: 24,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                 ),
               ),
               Text(
                 'Track all your posted jobs',
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

