import 'package:flutter/material.dart';
import 'package:indus/views/driver/home_screen.dart';
import 'package:indus/views/student/student_home_screen.dart';
import 'package:indus/views/business/business_home_screen.dart'; // Ensure this import is correct and the file exists

import 'bussiness_signup_screen.dart';
import 'student_driver_signup_screen.dart'; // Import the StudentDriverSignUpScreen

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String selectedRole = "Student"; // Default role

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Welcome Back!",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "Log in to continue your journey.",
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                SizedBox(height: 24),

                // Role Selection Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildRoleButton("Student", Icons.school),
                    SizedBox(width: 8),
                    _buildRoleButton("Driver", Icons.directions_car),
                    SizedBox(width: 8),
                    _buildRoleButton("Business", Icons.business),
                  ],
                ),
                SizedBox(height: 24),

                // Email/Username Field
                TextField(
                  decoration: InputDecoration(
                    labelText: "Email/Username",
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                SizedBox(height: 16),

                // Password Field
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                SizedBox(height: 8),

                // Remember Me and Forgot Password Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: false,
                          onChanged: (value) {
                            // Handle Remember Me checkbox state
                          },
                        ),
                        Text("Remember Me"),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        // Handle Forgot Password
                      },
                      child: Text("Forgot Password?"),
                    ),
                  ],
                ),
                SizedBox(height: 16),

                // Login Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Handle Login
                      print(
                          "Login button pressed. Selected role: $selectedRole");
                      _navigateToHomeScreen(context);
                    },
                    child: Text("Login"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24),

                // Sign Up Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account? "),
                    GestureDetector(
                      onTap: () {
                        _navigateToSignUpScreen(context);
                      },
                      child: Text(
                        "Sign Up Now",
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRoleButton(String role, IconData icon) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedRole = role;
            print("Selected role: $selectedRole");
          });
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: selectedRole == role ? Colors.blue : Colors.grey[200],
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            children: [
              Icon(
                icon,
                color: selectedRole == role ? Colors.white : Colors.grey,
              ),
              SizedBox(height: 4),
              Text(
                role,
                style: TextStyle(
                  color: selectedRole == role ? Colors.white : Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToHomeScreen(BuildContext context) {
    print("Navigating to home screen for role: $selectedRole");
    if (selectedRole == "Student") {
      Navigator.pushNamed(context, '/studentHome').then((_) {
        print("Navigation to StudentHomeScreen completed.");
      }).catchError((error) {
        print("Error navigating to StudentHomeScreen: $error");
      });
    } else if (selectedRole == "Driver") {
      Navigator.pushNamed(context, '/driverHome').then((_) {
        print("Navigation to DriverHomeScreen completed.");
      }).catchError((error) {
        print("Error navigating to DriverHomeScreen: $error");
      });
    } else if (selectedRole == "Business") {
      Navigator.pushNamed(context, '/businessHome').then((_) {
        print("Navigation to BusinessHomeScreen completed.");
      }).catchError((error) {
        print("Error navigating to BusinessHomeScreen: $error");
      });
    } else {
      print("Unknown role: $selectedRole");
    }
  }

  void _navigateToSignUpScreen(BuildContext context) {
    print("Navigating to sign-up screen for role: $selectedRole");
    if (selectedRole == "Business") {
      Navigator.pushNamed(context, '/businessSignUp').then((_) {
        print("Navigation to BusinessSignUpScreen completed.");
      }).catchError((error) {
        print("Error navigating to BusinessSignUpScreen: $error");
      });
    } else if (selectedRole == "Student" || selectedRole == "Driver") {
      Navigator.pushNamed(context, '/studentDriverSignUp').then((_) {
        print("Navigation to StudentDriverSignupScreen completed.");
      }).catchError((error) {
        print("Error navigating to StudentDriverSignupScreen: $error");
      });
    } else {
      print("Unknown role: $selectedRole");
    }
  }
}
