import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imersao_mobile/model/restaurant_model.dart';

class RestaurantData extends ChangeNotifier {
  List<Restaurant> listRestaurants = [];

  Future<void> getRestaurants() async {
    String jsonString = await rootBundle.loadString('assets/data.json');
    Map<String, dynamic> data = json.decode(jsonString);

    List<dynamic> restaurantData = data['restaurants'];

    for (var restaurantData in restaurantData) {
      Restaurant restaurant = Restaurant.fromMap(restaurantData);
      listRestaurants.add(restaurant);
    }
  }
}
