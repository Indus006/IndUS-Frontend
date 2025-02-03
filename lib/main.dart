import 'package:flutter/material.dart';
import 'package:indus/routes/app_routes.dart';
import 'package:indus/routes/route_names.dart';

import 'views/business/job_posting_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteNames.login,
      routes: AppRoutes.getRoutes(),
      onGenerateRoute: (settings) {
        if (settings.name == '/post-job') {
          // Return the appropriate widget for the '/post-job' route
          return MaterialPageRoute(builder: (context) => PostJobScreen());
        }
        // Handle other routes here if necessary
        return null;
      },
    );
  }
}
