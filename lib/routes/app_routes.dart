import 'package:flutter/material.dart';
import '../views/student/accommodation_screen.dart';
import '../views/student/student_home_screen.dart';

class AppRoutes {
  static const splashScreen = '/';
  static const homeScreen = '/home';
  static const accommodationScreen = '/accommodation';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      splashScreen: (_) => StudentHomeScreen(),
      homeScreen: (_) => StudentHomeScreen(),
      accommodationScreen: (_) => AccommodationScreen(),
    };
  }
}
