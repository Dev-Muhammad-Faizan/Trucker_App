import 'package:flutter/material.dart';
import '../../core/theme.dart';
import '../../data/mock_jobs.dart';
import '../../routes/routes_name.dart';
import '../../widgets/Header.dart';
import '../../widgets/broker/job_card.dart';

class BrokerJobsTab extends StatefulWidget {
  const BrokerJobsTab({super.key});

  @override
  State<BrokerJobsTab> createState() => _BrokerJobsTabState();
}

class _BrokerJobsTabState extends State<BrokerJobsTab> {
  final List<String> _filters = ['Open', 'Assigned', 'Active', 'Done'];
  String _selectedFilter = 'Open';

  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: AppTheme.backgroundWhite,

      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(130),
        child: AppBar(
          backgroundColor: AppTheme.primaryTeal,
          automaticallyImplyLeading: false,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: Padding(
              padding: const EdgeInsets.only(left: 24.0, bottom: 24.0, right: 24.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Header(
                      title: 'Job Management',
                      titleSize: 24,
                      titleColor: AppTheme.backgroundWhite,
                    ),
                    const SizedBox(height: 4,),
                    Header(
                      subtitle: 'Track all your posted jobs',
                      subtitleSize: 14,
                      subtitleColor: AppTheme.backgroundWhite,

                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),

      body: Column(
        children: [
          _buildFilters(),
          Expanded(
            child: _buildJobList(),
          ),
        ],
      ),
    );
  }

  Widget _buildFilters() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F6F9),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _filters.map((filter) {
          final isSelected = _selectedFilter == filter;
          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedFilter = filter;
                });
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: isSelected
                    ? BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(26),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      )
                    : const BoxDecoration(),
                alignment: Alignment.center,
                child: Text(
                  filter,
                  style: TextStyle(
                    color: isSelected 
                        ? AppTheme.primaryTeal 
                        : AppTheme.primaryTeal.withValues(alpha: 0.7),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildJobList() {
    final filteredJobs = MockJobs.jobs.where((job) {
      return job['status'] == _selectedFilter;
    }).toList();

    if (filteredJobs.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.assignment_outlined, size: 48, color: AppTheme.textLight.withValues(alpha: 0.5)),
            const SizedBox(height: 16),
            Text(
              'No $_selectedFilter jobs found.',
              style: const TextStyle(
                color: AppTheme.textLight,
                fontFamily: 'Poppins',
                fontSize: 16,
              ),
            ),
          ],
        ),
      );
    }

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      children: [
        ...filteredJobs.map((job) {
          return JobCard(
            title: job['title'],
            status: job['status'],
            pickupLocation: job['pickupLocation'],
            deliveryLocation: job['deliveryLocation'],
            time: job['time'],
            price: job['price'],
            onViewDetails: () {
              Navigator.pushNamed(context, RoutesName.jobDetail, arguments: job);
            },
          );
        }).toList(),
         const SizedBox(height: 90),
      ],
    );
  }

 }

