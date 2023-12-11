import 'dart:math';

import 'package:food_order_app/model/featured/extensions/offers_randomizer.dart';
import 'package:food_order_app/model/featured/offers_model.dart';
import 'package:food_order_app/model/food/food_model.dart';
import 'package:food_order_app/model/mock_data_randomizer.dart';
import 'package:food_order_app/model/types/food_category_type.dart';
import 'package:food_order_app/utils/list/list_helpers.dart';

import 'food_mock_data.dart';

extension FoodRandomizer on FoodModel {
  static FoodModel randomFood() {
    Random random = Random();

    //description
    String? description;
    if (random.hasData(chance: 20)) {
      description = kFoodDescriptions.fetchRandomElement();
    }

    //offers
    List<OffersModel>? offers;
    if (random.hasData(chance: 6)) {
      offers = OfferRandomizer.randomOffers();
    }

    //rating
    double? rating;
    int? numberOfRatings;
    if (random.hasData(chance: 5)) {
      rating = random.randomRatingNumber();
      numberOfRatings = random.randomNumber();
    }

    return FoodModel(
      name: kFoodNames.fetchRandomElement(),
      imageUrl: kFoodImagesUrls.fetchRandomElement(),
      price: random.randomPrice(),
      description: description,
      offers: offers ?? [],
      foodCategory: FoodCategory.values.fetchRandomElements(),
      rating: rating,
      numberOfRatings: numberOfRatings,
    );
  }

  //List of random foods
  static List<FoodModel> randomFoods() {
    Random random = Random();
    List<FoodModel> foods = [];
    int count = random.nextInt(25);

    for (int i = 0; i < count; i++) {
      foods.add(randomFood());
    }

    return foods;
  }
}
