import 'package:flutter/material.dart';

class BusinessSignUpScreen extends StatefulWidget {
  @override
  _BusinessSignUpScreenState createState() => _BusinessSignUpScreenState();
}

class _BusinessSignUpScreenState extends State<BusinessSignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final List<String> _businessTypes = [
    "Retail",
    "Education",
    "Food & Beverage",
    "Health & Fitness",
    "Technology",
    "Other",
  ];

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
                  Icon(Icons.storefront, size: 60, color: Colors.blue),
                  SizedBox(height: 16),
                  Text(
                    "Grow Your Business with Us!",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Sign up to connect with students and grow your network.",
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 24),

                  // Business Name
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Business Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your business name";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),

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

                  // Business Email
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Business Email",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your business email";
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
                      suffixIcon: Icon(Icons.visibility_off),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please create a password";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),

                  // GST Number (Optional)
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "GST Number (Optional)",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),

                  // Business Type Dropdown
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: "Business Type",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    items: _businessTypes.map((type) {
                      return DropdownMenuItem(
                        value: type,
                        child: Text(type),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                      });
                    },
                    validator: (value) {
                      if (value == null) {
                        return "Please select a business type";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16),

                  // Upload Logo/Banner
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
                            "Click to upload or drag and drop\nPNG, JPG up to 5MB",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 24),

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
                      "Already registered? Log in",
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
