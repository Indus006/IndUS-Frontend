import 'package:flutter/material.dart';

class NotificationCard extends StatelessWidget {
  final String title;
  final String time;
  final IconData icon;

  NotificationCard(
      {required this.title, required this.time, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: Colors.blue),
        title: Text(title, style: TextStyle(fontSize: 16)),
        subtitle:
            Text(time, style: TextStyle(fontSize: 12, color: Colors.grey)),
      ),
    );
  }
}
