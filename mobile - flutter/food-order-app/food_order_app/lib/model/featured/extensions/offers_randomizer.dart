import 'dart:math';

import 'package:food_order_app/model/featured/offers_model.dart';
import 'package:food_order_app/model/types/priority_type.dart';
import 'package:food_order_app/utils/list/list_helpers.dart';

import 'offers_mock_data.dart';

extension OfferRandomizer on OffersModel {
  static OffersModel randomOffer() {
    return OffersModel(
      title: kOfferNames.fetchRandomElement(),
      priority: PriorityType.values.fetchRandomElement(),
    );
  }

  static List<OffersModel> randomOffers() {
    final random = Random();
    final List<OffersModel> finalOffers = [];
    int count = random.nextInt(5) + 1;

    for (int i = 0; i < count; i++) {
      finalOffers.add(randomOffer());
    }

    return finalOffers;
  }
}
