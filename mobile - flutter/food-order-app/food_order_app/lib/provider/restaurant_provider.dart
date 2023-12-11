import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:food_order_app/model/restaurant/extensions/restaurant_list_helper.dart';
import 'package:food_order_app/model/restaurant/extensions/restaurant_randomizer.dart';
import 'package:food_order_app/model/restaurant/restaurant_model.dart';
import 'package:food_order_app/model/restaurants_filter_settings/RestaurantsFilterSettings.dart';
import 'package:food_order_app/utils/map/map_helpers.dart';

class RestaurantProvider extends ChangeNotifier {
  RestaurantProvider() {
    restaurants = RestaurantRandomizer.randomRestaurants();
    filteredRestaurants = [...restaurants];
  }
  late List<RestaurantModel> restaurants;
  late List<RestaurantModel> filteredRestaurants;

  void refreshRestaurants() {
    restaurants.clear();
    restaurants.addAll(RestaurantRandomizer.randomRestaurants());
  }

  void applyFilters(RestaurantsFilterSettings settings) {
    filteredRestaurants = restaurants
        .filterByCuisines(settings.cuisinesMap.trueKeys())
        .sortBy(settings.sortByType)
        .filterByFilters(settings.filters.trueKeys());
    notifyListeners();
  }

  Future<List<RestaurantModel>> fetchRestaurants() async {
    final random = Random();
    int seconds = random.nextInt(6);

    await Future.delayed(Duration(seconds: seconds));

    return RestaurantRandomizer.randomRestaurants();
  }
}
