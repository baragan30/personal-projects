import 'package:food_order_app/model/featured/offers_model.dart';
import 'package:food_order_app/model/types/food_category_type.dart';

class FoodModel {
  late String id;
  late String name;
  late String imageUrl;
  late String? description;
  late double price;
  late List<OffersModel> offers;
  late List<FoodCategory> foodCategory;
  late double? rating;
  late int? numberOfRatings;

  FoodModel({
    required this.name,
    required this.imageUrl,
    required this.price,
    this.description,
    this.offers = const <OffersModel>[],
    this.foodCategory = const <FoodCategory>[],
    this.rating,
    this.numberOfRatings,
  }) {
    id = name;
  }
}
