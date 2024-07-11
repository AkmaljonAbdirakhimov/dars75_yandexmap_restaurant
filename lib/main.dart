import 'package:dars75_yandexmap_restaurant/controllers/restaurant_controller.dart';
import 'package:dars75_yandexmap_restaurant/views/screens/restaurants_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'views/screens/map_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return RestaurantController();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorSchemeSeed: Colors.blue,
        ),
        home: const RestaurantsScreen(),
      ),
    );
  }
}
