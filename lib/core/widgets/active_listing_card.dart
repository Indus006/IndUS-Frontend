import 'package:flutter/material.dart';

class ActiveListingCard extends StatelessWidget {
  final String title;
  final String status;

  ActiveListingCard({required this.title, required this.status});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        trailing: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          decoration: BoxDecoration(
            color: status == "Active" ? Colors.green : Colors.red,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            status,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
