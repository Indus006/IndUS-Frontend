import 'package:flutter/material.dart';

class StudentDriverSignupScreen extends StatefulWidget {
  @override
  _StudentDriverSignupScreen createState() => _StudentDriverSignupScreen();
}

class _StudentDriverSignupScreen extends State<StudentDriverSignupScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedRole = "Student";
  bool _isStudentDriver = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Icon and Title
                  Icon(Icons.school, size: 60, color: Colors.blue),
                  SizedBox(height: 16),
                  Text(
                    "Join Us!",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Sign up as a Student or Student Driver",
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 24),

                  // Full Name
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Full Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your full name";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),

                  // University Email
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "University Email",
                      hintText: "your.email@university.edu",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your university email";
                      }
                      if (!value.contains('@')) {
                        return "Please enter a valid email address";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),

                  // Password
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Password",
                      hintText: "Create a password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please create a password";
                      }
                      if (value.length < 6) {
                        return "Password must be at least 6 characters long";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),

                  // Role Selection Dropdown
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: "Sign up as",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    value: _selectedRole,
                    items: ["Student", "Student Driver"].map((role) {
                      return DropdownMenuItem(
                        value: role,
                        child: Text(role),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedRole = value;
                        _isStudentDriver = value == "Student Driver";
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return "Please select a role";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),

                  // Driving License Upload (Visible for Student Driver)
                  if (_isStudentDriver)
                    GestureDetector(
                      onTap: () {
                        // Handle file upload logic
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.cloud_upload, color: Colors.blue),
                            SizedBox(width: 10),
                            Text(
                              "Upload your driving license\n(PNG, JPG up to 5MB)",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  if (_isStudentDriver) SizedBox(height: 16),

                  // Terms and Conditions Checkbox
                  Row(
                    children: [
                      Checkbox(
                        value: _isStudentDriver,
                        onChanged: (value) {
                          setState(() {
                            _isStudentDriver = value!;
                          });
                        },
                      ),
                      Expanded(
                        child: Text(
                          "I agree to the terms of being a student-driver",
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),

                  // Sign-Up Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Handle successful form submission
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Sign-Up Successful!"),
                            ),
                          );
                        }
                      },
                      child: Text("Sign Up Now"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),

                  // Login Link
                  GestureDetector(
                    onTap: () {
                      // Navigate to Login Screen
                    },
                    child: Text(
                      "Already have an account? Log in",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
