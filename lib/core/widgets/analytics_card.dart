import 'package:flutter/material.dart';

class AnalyticsCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  AnalyticsCard({required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Icon(icon, size: 30, color: Colors.blue),
              SizedBox(height: 5),
              Text(value,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 3),
              Text(label, style: TextStyle(fontSize: 14, color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}
