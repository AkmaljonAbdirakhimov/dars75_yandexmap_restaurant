import 'package:dars75_yandexmap_restaurant/views/screens/map_screen.dart';
import 'package:flutter/material.dart';

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
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return const ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.amber,
            ),
            title: Text("Nomdor"),
            subtitle: Text("9-mavze Chilonzor"),
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
        child: Icon(Icons.add),
      ),
    );
  }
}
