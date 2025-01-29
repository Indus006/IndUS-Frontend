import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_icons.dart';
import '../../core/constants/app_strings.dart';
import 'accommodation_screen.dart';

class StudentHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hi, Alex!"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
          IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Feature Cards Grid
            GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                _buildFeatureCard(
                  icon: AppIcons.rideSharing,
                  title: AppStrings.rideSharing,
                  color: AppColors.primaryColor,
                  onTap: () {
                    // Handle Ride Sharing tap
                  },
                ),
                _buildFeatureCard(
                  icon: AppIcons.jobs,
                  title: AppStrings.jobs,
                  color: AppColors.secondaryColor,
                  onTap: () {
                    // Handle Jobs tap
                  },
                ),
                _buildFeatureCard(
                  icon: AppIcons.offers,
                  title: AppStrings.offers,
                  color: AppColors.accentColor,
                  onTap: () {
                    // Handle Offers tap
                  },
                ),
                _buildFeatureCard(
                  icon: AppIcons.accommodation,
                  title: AppStrings.accommodation,
                  color: AppColors.accentColor,
                  onTap: () {
                    // Navigate to Accommodation Screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AccommodationScreen()),
                    );
                  },
                ),
              ],
            ),
            SizedBox(height: 20),

            // Recent Rides Section
            _buildSectionTitle(context, "Recent Rides"),
            _buildRecentRideTile(),

            SizedBox(height: 20),

            // Featured Jobs Section
            _buildSectionTitle(context, "Featured Jobs"),
            _buildJobFilters(context),
            SizedBox(height: 10),
            _buildJobCard(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: "Explore"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: "Notifications"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
        currentIndex: 0,
        selectedItemColor: AppColors.primaryColor,
      ),
    );
  }

  Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.white),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        TextButton(onPressed: () {}, child: Text("View all")),
      ],
    );
  }

  Widget _buildRecentRideTile() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(
              "https://th.bing.com/th/id/OIP.-4zJrnbhRuBZSWcqAJ5jrAHaLH?rs=1&pid=ImgDetMain"), // Replace with actual image URL
        ),
        title: Text("Sarah M."),
        subtitle: Row(
          children: [
            Icon(Icons.location_on, size: 14, color: Colors.blue),
            SizedBox(width: 5),
            Text("Campus Library -> Downtown Mall"),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("\$15", style: TextStyle(color: Colors.green)),
          ],
        ),
      ),
    );
  }

  Widget _buildJobFilters(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildJobCategoryChip(context, "All Jobs"),
        _buildJobCategoryChip(context, "Retail"),
        _buildJobCategoryChip(context, "Food Service"),
        _buildJobCategoryChip(context, "Tech"),
      ],
    );
  }

  Widget _buildJobCategoryChip(BuildContext context, String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildJobCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Campus Bookstore Assistant",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text("Part-time - \$15/hr"),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Handle Apply Now
              },
              child: Text("Apply Now"),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
