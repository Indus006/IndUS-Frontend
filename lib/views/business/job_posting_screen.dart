import 'package:flutter/material.dart';

class PostJobScreen extends StatefulWidget {
  @override
  _PostJobScreenState createState() => _PostJobScreenState();
}

class _PostJobScreenState extends State<PostJobScreen> {
  final _formKey = GlobalKey<FormState>();

  String jobTitle = '';
  String description = '';
  String salary = '';
  String location = '';
  String jobType = 'Full-time';
  DateTime? deadline;

  void navigateToJobPostingScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PostJobScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Post a Job')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text("Post a Job",
                  style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 10),
              Text("Share job opportunities with potential candidates."),
              const SizedBox(height: 20),

              // Job Title Field
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Job Title',
                  hintText: 'e.g., Sales Executive',
                  prefixIcon: Icon(Icons.work),
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.isEmpty ? 'Enter job title' : null,
                onChanged: (value) => setState(() => jobTitle = value),
              ),
              const SizedBox(height: 15),

              // Description Field
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Description',
                  hintText: 'Describe the responsibilities and requirements.',
                  prefixIcon: Icon(Icons.description),
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                validator: (value) =>
                    value!.isEmpty ? 'Enter job description' : null,
                onChanged: (value) => setState(() => description = value),
              ),
              const SizedBox(height: 15),

              // Salary Field
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Salary',
                  hintText: 'e.g., ₹25,000 per month',
                  prefixIcon: Icon(Icons.money),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? 'Enter salary' : null,
                onChanged: (value) => setState(() => salary = value),
              ),
              const SizedBox(height: 15),

              // Location Field
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Location',
                  hintText: 'Enter location',
                  prefixIcon: Icon(Icons.location_on),
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.isEmpty ? 'Enter location' : null,
                onChanged: (value) => setState(() => location = value),
              ),
              const SizedBox(height: 15),

              // Job Type Dropdown
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Job Type',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.work_outline),
                ),
                value: jobType,
                items: ['Full-time', 'Part-time', 'Contract']
                    .map((type) =>
                        DropdownMenuItem(value: type, child: Text(type)))
                    .toList(),
                onChanged: (value) => setState(() => jobType = value!),
              ),
              const SizedBox(height: 15),

              // Application Deadline
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Application Deadline',
                  hintText: 'dd-mm-yyyy',
                  prefixIcon: Icon(Icons.calendar_today),
                  border: OutlineInputBorder(),
                ),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      deadline = pickedDate;
                    });
                  }
                },
                validator: (value) =>
                    deadline == null ? 'Select deadline' : null,
                controller: TextEditingController(
                  text: deadline != null
                      ? '${deadline!.day}-${deadline!.month}-${deadline!.year}'
                      : '',
                ),
              ),
              const SizedBox(height: 15),

              // Upload Job Flyer
              GestureDetector(
                onTap: () {
                  // Implement file picker logic here
                },
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.cloud_upload, size: 40, color: Colors.grey),
                        Text("Upload Job Flyer",
                            style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Preview job posting logic here
                      }
                    },
                    child: Text("Preview Job"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Job Posted Successfully!')),
                        );
                      }
                    },
                    child: Text("Post Job"),
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
