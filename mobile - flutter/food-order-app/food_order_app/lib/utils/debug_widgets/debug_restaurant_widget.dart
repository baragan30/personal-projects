import 'package:flutter/material.dart';
import 'package:food_order_app/model/featured/offers_model.dart';
import 'package:food_order_app/model/restaurant/restaurant_model.dart';
import 'package:food_order_app/model/types/cuisine_type.dart';
import 'package:food_order_app/model/types/day_type.dart';

class DebugRestauratWidget extends StatelessWidget {
  final RestaurantModel restaurant;

  DebugRestauratWidget({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.withOpacity(0.2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(restaurant.name),
          Image.network(restaurant.imageUrl),
          Wrap(
            children: restaurant.cuisine
                .map((CuisineType e) => Text(e.title() + " "))
                .toList(),
          ),
          const Text("---"),
          Wrap(
            children: restaurant.openDays
                .map((DayOfWeek e) => Text(e.title() + " "))
                .toList(),
          ),
          const Text("---"),
          Wrap(
            children: restaurant.offers
                .map((OffersModel e) => Text(e.title + "; "))
                .toList(),
          ),
          const Text("---"),
          restaurant.startTime != null
              ? Text(
                  "Opens at ${restaurant.startTime!.hour} - ${restaurant.startTime!.minute}")
              : Container(),
          restaurant.endTime != null
              ? Text(
                  "Closes at ${restaurant.endTime!.hour} - ${restaurant.endTime!.minute}")
              : Container(),
          const Text("---"),
          restaurant.rating != null
              ? Text("rating ${restaurant.rating!.toString()}")
              : Container(),
          restaurant.numberOfRatings != null
              ? Text(
                  "number of ratings ${restaurant.numberOfRatings!.toString()}")
              : Container(),
          const Text("---"),
          restaurant.priceRange != null
              ? Text("Price ${restaurant.priceRange!.toString()}")
              : Container(),
        ],
      ),
    );
  }
}
