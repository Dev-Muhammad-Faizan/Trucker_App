import 'package:flutter/material.dart';
import 'package:trucker_connect/routes/routes_name.dart';
import 'package:trucker_connect/widgets/broker/job_card.dart';
import 'package:trucker_connect/widgets/custom_icon.dart';

import '../../core/theme.dart';
import '../../data/mock_jobs.dart';

class DriverJobTab extends StatefulWidget {
  const DriverJobTab({super.key});

  @override
  State<DriverJobTab> createState() => _DriverJobTabState();
}

class _DriverJobTabState extends State<DriverJobTab> {
  final List<Map<String, dynamic>> _allJobs = MockJobs.jobs;

  List<Map<String, dynamic>> _filteredJobs = [];

  @override
  void initState() {
    super.initState();
    _filteredJobs = _allJobs;
  }

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
              padding: const EdgeInsets.fromLTRB(24, 20, 24, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'Available Jobs',
                    style: TextStyle(
                      color: AppTheme.backgroundWhite,
                      fontSize: 24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: AppTheme.backgroundWhite,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          if (value.isEmpty) {
                            _filteredJobs = _allJobs;
                          } else {
                            _filteredJobs = _allJobs.where((job) {
                              return job['title']!
                                  .toString()
                                  .toLowerCase()
                                  .contains(value.toLowerCase());
                            }).toList();
                          }
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Search jobs...',
                        hintStyle: const TextStyle(
                          color: AppTheme.textLight,
                          fontSize: 14,
                          fontFamily: 'Poppins',
                        ),
                        prefixIcon: const Padding(
                          padding: EdgeInsets.only(left: 16, right: 12),
                          child: CustomIcon(
                            imagePath: 'assets/images/all/search.svg',
                            size: 20,
                            color: AppTheme.textLight,
                          ),
                        ),
                        prefixIconConstraints: const BoxConstraints(
                          minWidth: 48,
                          minHeight: 24,
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 64,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              children: [
                _buildFilterChip('Filters', icon: Icons.tune),
                const SizedBox(width: 8),
                _buildFilterChip('Date'),
                const SizedBox(width: 8),
                _buildFilterChip('Payment'),
                const SizedBox(width: 8),
                _buildFilterChip('Location'),

              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
              itemCount: _filteredJobs.length,
              itemBuilder: (context, index) {
                final job = _filteredJobs[index];
                return JobCard(
                  title: job['title']!.toString(),
                  pickupLocation: job['pickupLocation']!.toString(),
                  deliveryLocation: job['deliveryLocation']!.toString(),
                  time: job['time']!.toString(),
                  price: job['price']!.toString(),
                  onViewDetails: () {
                    Navigator.pushNamed(
                      context,
                     RoutesName.driverjobdetails,
                      arguments: job,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, {IconData? icon}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppTheme.backgroundWhite,
        border: Border.all(color: AppTheme.inputBorder),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 16, color: AppTheme.primaryTeal),
            const SizedBox(width: 6),
          ],
          Text(
            label,
            style: const TextStyle(
              color: AppTheme.primaryTeal,
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
