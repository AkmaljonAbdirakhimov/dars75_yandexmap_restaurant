import 'package:dars75_yandexmap_restaurant/controllers/restaurant_controller.dart';
import 'package:dars75_yandexmap_restaurant/views/screens/map_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RestaurantsScreen extends StatefulWidget {
  const RestaurantsScreen({super.key});

  @override
  State<RestaurantsScreen> createState() => _RestaurantsScreenState();
}

class _RestaurantsScreenState extends State<RestaurantsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<RestaurantController>(
        builder: (context, controller, child) {
          final restaurants = controller.list;

          return ListView.builder(
            itemCount: restaurants.length,
            itemBuilder: (ctx, index) {
              final restaurant = restaurants[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    restaurant.imageUrl,
                  ),
                ),
                title: Text(restaurant.title),
                subtitle: Text(restaurant.address),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) {
                return const MapScreen();
              },
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
