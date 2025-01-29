import '../models/accommodation.dart';

class AccommodationService {
  static List<Accommodation> fetchNearbyRooms() {
    return [
      Accommodation(
        title: "2BHK House for Rent",
        location: "Vidya Nagar, Ponnur",
        price: "6000/MONTH",
      ),
      Accommodation(
        title: "3BHK House for Rent",
        location: "SPP Road, Ponnur",
        price: "8000/MONTH",
      ),
    ];
  }
}
