import 'package:flutter/material.dart';
import 'package:indus/views/common/login_screen.dart';
import 'package:indus/views/student/student_home_screen.dart';
import 'package:indus/views/driver/home_screen.dart';
import 'package:indus/views/business/business_home_screen.dart';
import '../views/business/job_posting_screen.dart';
import 'route_names.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.login:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case RouteNames.studentHome:
        return MaterialPageRoute(builder: (_) => StudentHomeScreen());
      case RouteNames.driverHome:
        return MaterialPageRoute(builder: (_) => DriverHomeScreen());
      case RouteNames.businessHome:
        return MaterialPageRoute(builder: (_) => BusinessHomeScreen());
      case RouteNames.postJob:
        return MaterialPageRoute(builder: (_) => PostJobScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(title: Text("Error")),
            body: Center(child: Text("Page Not Found")),
          ),
        );
    }
  }

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      RouteNames.login: (context) => LoginScreen(),
      // Add other routes here
    };
  }
}
