import 'package:flutter/material.dart';
import 'package:food_order_app/model/featured/offers_model.dart';
import 'package:food_order_app/model/food/food_model.dart';
import 'package:food_order_app/model/types/cuisine_type.dart';
import 'package:food_order_app/model/types/day_type.dart';
import 'package:food_order_app/model/types/expensive_type.dart';

class RestaurantModel {
  late String id;
  late String name;
  late String imageUrl;
  late List<CuisineType> cuisine;
  late List<DayOfWeek> openDays;
  late List<OffersModel> offers;
  late List<FoodModel> foodsList;

  TimeOfDay? startTime;
  TimeOfDay? endTime;

  double? rating;
  int? numberOfRatings;

  ExpensiveType? priceRange;

  RestaurantModel({
    required this.name,
    required this.imageUrl,
    List<CuisineType>? cuisine,
    List<DayOfWeek>? openDays,
    List<OffersModel>? offers,
    List<FoodModel>? foodsList,
    this.startTime,
    this.endTime,
    this.rating,
    this.numberOfRatings,
    this.priceRange,
  }) {
    id = name;
    this.cuisine = cuisine ?? <CuisineType>[];
    this.openDays = openDays ?? <DayOfWeek>[];
    this.offers = offers ?? <OffersModel>[];
    this.foodsList = foodsList ?? <FoodModel>[];
  }

  bool hasProgram() {
    return openDays.isNotEmpty || startTime != null || endTime != null;
  }
}
