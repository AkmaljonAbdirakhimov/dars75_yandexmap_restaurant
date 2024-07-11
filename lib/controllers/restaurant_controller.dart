import 'package:dars75_yandexmap_restaurant/models/restaurant.dart';
import 'package:flutter/material.dart';

class RestaurantController with ChangeNotifier {
  List<Restaurant> _list = [];

  List<Restaurant> get list {
    return [..._list];
  }
}
