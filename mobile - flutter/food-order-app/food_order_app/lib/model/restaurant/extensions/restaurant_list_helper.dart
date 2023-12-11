import 'package:food_order_app/model/restaurant/restaurant_model.dart';
import 'package:food_order_app/model/types/cuisine_type.dart';
import 'package:food_order_app/model/types/filter_type.dart';
import 'package:food_order_app/model/types/sort_by_type.dart';

extension RestaurantListHelper on List<RestaurantModel> {
  List<RestaurantModel> filterByCuisines(List<CuisineType> cuisines) {
    if (cuisines.isEmpty) {
      return [...this];
    }

    List<RestaurantModel> sortedList = [];
    for (var cuisine in cuisines) {
      sortedList
          .addAll(where((restaurant) => restaurant.cuisine.contains(cuisine)));
    }
    // Remove duplicates and preserve the original order of cuisines
    return sortedList.toSet().toList();
  }

  ///TO DO: Finish implement sortBy
  List<RestaurantModel> sortBy(SortByType sortByType) {
    switch (sortByType) {
      case SortByType.topRated:
        return sortByRating();
      case SortByType.costHighToLow:
        return sortHighToLow();
      case SortByType.costLowToHigh:
        return sortLowToHigh();
      case SortByType.none:
        return [...this];
    }
    throw Exception("sortBy: invalid sortByType");
  }

  List<RestaurantModel> sortByRating() {
    List<RestaurantModel> restaurantsList = [...this];
    restaurantsList
        .sort((RestaurantModel restaurantA, RestaurantModel restaurantB) {
      if (restaurantA.rating == null) {
        return 1;
      }
      if (restaurantB.rating == null) {
        return -1;
      }
      return -1 * restaurantA.rating!.compareTo(restaurantB.rating!);
    });
    return restaurantsList;
  }

  List<RestaurantModel> sortHighToLow() {
    return sortLowToHigh().reversed.toList();
  }

  List<RestaurantModel> sortLowToHigh() {
    List<RestaurantModel> restaurantsList = [...this];
    restaurantsList
        .sort((RestaurantModel restaurantA, RestaurantModel restaurantB) {
      if (restaurantA.priceRange == null && restaurantB.priceRange == null) {
        return 0;
      }
      if (restaurantA.priceRange == null) {
        return -1;
      }
      if (restaurantB.priceRange == null) {
        return 1;
      }
      return restaurantA.priceRange!.index
          .compareTo(restaurantB.priceRange!.index);
    });
    return restaurantsList;
  }

  ///TO DO: Finish implement filterByFilters
  List<RestaurantModel> filterByFilters(List<FilterType> filters) {
    if (filters.isEmpty) {
      return [...this];
    }

    List<RestaurantModel> sortedList = [];
    for (RestaurantModel restaurant in this) {}
    // Remove duplicates and preserve the original order of cuisines
    return sortedList.toSet().toList();
  }
}
