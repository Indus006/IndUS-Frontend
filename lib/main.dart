import 'package:flutter/material.dart';
import 'package:indus/routes/app_routes.dart';
import 'package:indus/routes/route_names.dart';
import 'package:indus/views/business/business_profile_screen.dart';
import 'package:indus/views/business/business_home_screen.dart';
import 'package:indus/views/business/job_posting_screen.dart';
import 'package:indus/views/business/offers_screen.dart';
import 'package:indus/views/business/settings_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IndUS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false, // Disable the debug banner
      home: BusinessHomeScreen(),
      routes: {
        '/home': (context) => BusinessHomeScreen(),
        '/profile': (context) => BusinessProfileScreen(),
        '/post-job': (context) => PostJobScreen(),
        '/offers': (context) => OffersScreen(),
        '/settings': (context) => SettingsScreen(),
      },
    );
  }
}
