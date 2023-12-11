import 'package:food_order_app/model/featured/offers_model.dart';
import 'package:food_order_app/utils/list/list_helpers.dart';

extension OffersModelListExtension on List<OffersModel> {
  /// Extract k most important Offers from the list
  List<OffersModel> mostImportantKOffers({required int k}) {
    if (k <= 0) {
      return [];
    }
    sort();
    return maxKElements(k);
  }

  OffersModel? mostImportantOffer() {
    List<OffersModel> singleOfferList = mostImportantKOffers(k: 1);
    if (singleOfferList.isNotEmpty) {
      return singleOfferList.first;
    }
    return null;
  }
}
