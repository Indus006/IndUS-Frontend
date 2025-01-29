import 'package:flutter/material.dart';
import '../../services/accommodation_service.dart';

class AccommodationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final accommodations = AccommodationService.fetchNearbyRooms();

    return Scaffold(
      appBar: AppBar(
        title: Text("Discover Your New Room!"),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16.0),
        itemCount: accommodations.length,
        itemBuilder: (context, index) {
          final room = accommodations[index];
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 4,
            child: ListTile(
              leading: Icon(Icons.image, size: 50),
              title: Text(room.title),
              subtitle: Text(room.location),
              trailing: Text(room.price),
            ),
          );
        },
      ),
    );
  }
}
