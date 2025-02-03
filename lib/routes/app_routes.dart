import 'package:flutter/material.dart';
import 'package:indus/views/common/login_screen.dart';
import 'package:indus/views/student/student_home_screen.dart';
import 'package:indus/views/driver/home_screen.dart';
import 'package:indus/views/business/business_home_screen.dart';

class AppRoutes {
  static const login = '/';
  static const studentHome = '/student-home';
  static const driverHome = '/driver-home';
  static const businessHome = '/business-home';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      login: (context) => LoginScreen(),
      studentHome: (context) => StudentHomeScreen(),
      driverHome: (context) => DriverHomeScreen(),
      businessHome: (context) => BusinessHomeScreen(),
    };
  }
}
