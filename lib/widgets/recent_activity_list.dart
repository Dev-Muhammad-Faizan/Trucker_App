import 'package:flutter/material.dart';
import 'package:trucker_connect/widgets/custom_container.dart';

class RecentActivityList extends StatefulWidget {
  const RecentActivityList({super.key});

  @override
  State<RecentActivityList> createState() => _RecentActivityListState();
}

class _RecentActivityListState extends State<RecentActivityList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: 10,
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        return CustomContainer(
          padding: EdgeInsets.zero,
          width: double.infinity,
          child: Center(
            child: ListTile(
              leading: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
              title: const Text('Job Completed', overflow: TextOverflow.ellipsis, maxLines: 1),
              subtitle: const Text('Driver: John Smith - Dallas Route', overflow: TextOverflow.ellipsis, maxLines: 1),
              trailing: const Text('1h ago'),
            ),
          ),
        );
      },
    );
  }
}
