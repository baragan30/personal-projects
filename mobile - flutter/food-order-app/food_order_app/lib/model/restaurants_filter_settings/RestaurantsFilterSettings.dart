import 'package:food_order_app/model/types/cuisine_type.dart';
import 'package:food_order_app/model/types/filter_type.dart';
import 'package:food_order_app/model/types/sort_by_type.dart';

class RestaurantsFilterSettings {
  late Map<CuisineType, bool> cuisinesMap;
  SortByType sortByType;
  late Map<FilterType, bool> filters;

  RestaurantsFilterSettings({
    List<CuisineType> activeCuisines = const [],
    this.sortByType = SortByType.none,
    List<FilterType> activeFilters = const [],
  }) {
    cuisinesMap = <CuisineType, bool>{
      for (var cuisine in CuisineType.values)
        cuisine: activeCuisines.contains(cuisine)
    };
    filters = <FilterType, bool>{
      for (var filter in FilterType.values)
        filter: activeFilters.contains(filter)
    };
  }

  void resetToDefault() {
    sortByType = SortByType.none;

    cuisinesMap.clear();
    cuisinesMap.addAll(<CuisineType, bool>{
      for (var cuisine in CuisineType.values) cuisine: false,
    });

    filters.clear();
    filters.addAll(<FilterType, bool>{
      for (var filter in FilterType.values) filter: false
    });
  }
}
