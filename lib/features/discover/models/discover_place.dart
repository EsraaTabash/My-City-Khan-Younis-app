import 'package:latlong2/latlong.dart';

class DiscoverPlace {
  final String name;
  final String mainCategory;
  final String category;
  final String categoryIcon;
  final String? imagePath;
  final String address;
  final String distance;
  final String rating;
  final LatLng location;

  final String? facebookUrl;
  final String? whatsappUrl;
  final String? email;
  final String? phone;

  const DiscoverPlace({
    required this.name,
    required this.mainCategory,
    required this.category,
    required this.categoryIcon,
    required this.imagePath,
    required this.address,
    required this.distance,
    required this.rating,
    required this.location,
    this.facebookUrl,
    this.whatsappUrl,
    this.email,
    this.phone,
  });
}
