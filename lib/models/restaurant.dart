import 'dart:math';

class Restaurant {
  final String id;
  String title;
  String imageUrl;
  String phone;
  double rating;
  String address;
  Point location;

  Restaurant({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.phone,
    required this.rating,
    required this.address,
    required this.location,
  });
}
