import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_order_app/model/featured/extensions/offers_randomizer.dart';
import 'package:food_order_app/model/featured/offers_model.dart';
import 'package:food_order_app/model/food/extensions/food_randomizer.dart';
import 'package:food_order_app/model/mock_data_randomizer.dart';
import 'package:food_order_app/model/restaurant/restaurant_model.dart';
import 'package:food_order_app/model/types/cuisine_type.dart';
import 'package:food_order_app/model/types/day_type.dart';
import 'package:food_order_app/model/types/expensive_type.dart';
import 'package:food_order_app/model/types/extensions/time_of_day_helpers.dart';
import 'package:food_order_app/utils/list/list_helpers.dart';

import 'restaurant_mock_data.dart';

extension RestaurantRandomizer on RestaurantModel {
  static RestaurantModel randomRestaurant() {
    Random random = Random();
    List<CuisineType>? cuisine;

    if (random.hasData(chance: 10)) {
      cuisine = CuisineType.values.fetchRandomElements();
    }

    List<DayOfWeek>? openDays;

    if (random.hasData(chance: 6)) {
      openDays = DayOfWeek.values.fetchRandomElements();
    }

    TimeOfDay? startTime;
    TimeOfDay? endTime;

    if (random.hasData(chance: 3)) {
      startTime = TimeOfDayHelpers.random();
      endTime = TimeOfDayHelpers.random();
    }

    double? rating;
    int? numberOfRatings;

    if (random.hasData(chance: 6)) {
      rating = random.randomRatingNumber();
      numberOfRatings = random.randomNumber();
    }

    ExpensiveType? expensive;

    if (random.hasData(chance: 6)) {
      expensive = ExpensiveType.values.fetchRandomElement();
    }

    List<OffersModel>? offers;

    if (random.hasData(chance: 6)) {
      offers = OfferRandomizer.randomOffers();
    }

    return RestaurantModel(
      name: kRestaurantNames.fetchRandomElement(),
      imageUrl: kRestaurantImageUrls.fetchRandomElement(),
      cuisine: cuisine,
      openDays: openDays,
      offers: offers,
      startTime: startTime,
      endTime: endTime,
      rating: rating,
      numberOfRatings: numberOfRatings,
      priceRange: expensive,
      foodsList: FoodRandomizer.randomFoods(),
    );
  }

  static List<RestaurantModel> randomRestaurants() {
    final random = Random();
    final List<RestaurantModel> finalRestaurants = [];
    int count = random.nextInt(25);

    for (int i = 0; i < count; i++) {
      finalRestaurants.add(randomRestaurant());
    }

    return finalRestaurants;
  }
}
