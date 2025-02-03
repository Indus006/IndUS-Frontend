import 'package:flutter/material.dart';
import 'package:indus/core/widgets/active_listing_card.dart';
import 'package:indus/core/widgets/analytics_card.dart';
import 'package:indus/core/widgets/notification_card.dart';

class BusinessHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Screen"),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome, Tech Solutions!",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text("Here's a snapshot of your business activity"),
              SizedBox(height: 15),

              // Analytics Cards
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnalyticsCard(
                      icon: Icons.remove_red_eye,
                      label: "Job Views",
                      value: "247"),
                  AnalyticsCard(
                      icon: Icons.card_giftcard,
                      label: "Redemptions",
                      value: "52"),
                  AnalyticsCard(
                      icon: Icons.person,
                      label: "Profile Visits",
                      value: "189"),
                ],
              ),

              SizedBox(height: 15),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text("View Detailed Analytics",
                      style: TextStyle(color: Colors.blue)),
                ),
              ),

              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/post-job');
                    },
                    child: Text("Post Job"),
                  ),
                  OutlinedButton(onPressed: () {}, child: Text("Create Offer")),
                  OutlinedButton(onPressed: () {}, child: Text("Upgrade")),
                ],
              ),

              SizedBox(height: 20),
              Text("Your Active Listings",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

              // Active Listings
              ActiveListingCard(title: "Senior Developer", status: "Active"),
              ActiveListingCard(title: "50% Off Training", status: "Expired"),

              SizedBox(height: 20),
              Text("Notifications",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

              // Notifications
              NotificationCard(
                title: "Your 'Developer Position' offer expires in 2 days",
                time: "2 hours ago",
                icon: Icons.warning_amber_rounded,
              ),
              NotificationCard(
                title: "New application for 'Senior Developer'",
                time: "5 hours ago",
                icon: Icons.notifications_active,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: "Jobs"),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_offer), label: "Offers"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
    );
  }
}
