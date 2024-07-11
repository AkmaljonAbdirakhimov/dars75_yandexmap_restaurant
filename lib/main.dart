import 'package:dars75_yandexmap_restaurant/views/screens/restaurants_screen.dart';
import 'package:flutter/material.dart';

import 'views/screens/map_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: RestaurantsScreen(),
    );
  }
}
