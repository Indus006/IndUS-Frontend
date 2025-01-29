import 'package:flutter/material.dart';
import 'routes/app_routes.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     // theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.splashScreen,
      routes: AppRoutes.getRoutes(),
    );
  }
}
