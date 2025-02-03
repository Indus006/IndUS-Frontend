import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class BusinessProfileScreen extends StatefulWidget {
  @override
  _BusinessProfileScreenState createState() => _BusinessProfileScreenState();
}

class _BusinessProfileScreenState extends State<BusinessProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  String? businessName;
  String? address;
  String? contactInfo;
  String? businessDescription;
  String? logoFilePath;
  String? bannerFilePath;

  void _pickFile(bool isLogo) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowedExtensions: ['jpg', 'png'],
    );

    if (result != null) {
      setState(() {
        if (isLogo) {
          logoFilePath = result.files.single.path!;
        } else {
          bannerFilePath = result.files.single.path!;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Business Profile"),
        leading: BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text(
                "Update your business information.",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 20),

              // Upload Business Logo
              GestureDetector(
                onTap: () => _pickFile(true),
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: logoFilePath == null
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.camera_alt,
                                  size: 40, color: Colors.grey),
                              Text("Upload Business Logo",
                                  style: TextStyle(color: Colors.grey)),
                              Text("Choose File",
                                  style: TextStyle(color: Colors.blue)),
                            ],
                          ),
                        )
                      : Image.file(
                          File(logoFilePath!),
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              SizedBox(height: 20),

              // Business Name Field
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Business Name",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? "Enter your business name" : null,
                onChanged: (value) => setState(() => businessName = value),
              ),
              SizedBox(height: 15),

              // Address Field
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Address",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? "Enter your business address" : null,
                onChanged: (value) => setState(() => address = value),
              ),
              SizedBox(height: 15),

              // Contact Information Field
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Contact Information",
                  hintText: "Phone number",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                validator: (value) =>
                    value!.isEmpty ? "Enter your contact information" : null,
                onChanged: (value) => setState(() => contactInfo = value),
              ),
              SizedBox(height: 15),

              // Business Description Field
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Business Description",
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                validator: (value) =>
                    value!.isEmpty ? "Describe your business" : null,
                onChanged: (value) =>
                    setState(() => businessDescription = value),
              ),
              SizedBox(height: 20),

              // Upload Banner Image
              GestureDetector(
                onTap: () => _pickFile(false),
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: bannerFilePath == null
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.cloud_upload,
                                  size: 40, color: Colors.grey),
                              Text("Upload Banner Image",
                                  style: TextStyle(color: Colors.grey)),
                              Text(
                                "Recommended size: 1200x300px",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                            ],
                          ),
                        )
                      : Image.file(
                          File(bannerFilePath!),
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              SizedBox(height: 20),

              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      // Preview profile logic
                    },
                    child: Text("Preview Profile"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Save changes logic
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text("Profile updated successfully!")),
                        );
                      }
                    },
                    child: Text("Save Changes"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
