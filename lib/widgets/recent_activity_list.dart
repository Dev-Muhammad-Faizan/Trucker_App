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
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(), // Allows it to scroll smoothly within its 300px container
      itemCount: 10,
      separatorBuilder: (context, index) => const SizedBox(height: 8), // Adds exactly 8 pixels spacing between every card
      itemBuilder: (context, index) {
        return CustomContainer(
          height: 78,
          width: double.infinity,
          child: ListTile(
            leading: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
            ),
            title: Text('Job Completed',overflow: TextOverflow.ellipsis, maxLines: 1,),
            subtitle: Text('Driver: John Smith - Dallas Route',overflow: TextOverflow.ellipsis, maxLines: 1,),
            trailing: Text('1h ago'),
          ),
        );
      },
    );
  }
}
