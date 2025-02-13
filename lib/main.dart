import 'package:flutter/material.dart';
import 'package:indus/views/common/login_screen.dart';
import 'package:indus/views/driver/home_screen.dart';
import 'package:indus/views/student/student_home_screen.dart';
import 'package:indus/views/business/business_home_screen.dart';
import 'package:indus/views/common/bussiness_signup_screen.dart';
import 'package:indus/views/common/student_driver_signup_screen.dart';

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
      debugShowCheckedModeBanner: false, // Remove the debug banner
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/studentHome': (context) => StudentHomeScreen(),
        '/driverHome': (context) => DriverHomeScreen(),
        '/businessHome': (context) => BusinessHomeScreen(),
        '/businessSignUp': (context) => BusinessSignUpScreen(),
        '/studentDriverSignUp': (context) => StudentDriverSignupScreen(),
      },
    );
  }
}
