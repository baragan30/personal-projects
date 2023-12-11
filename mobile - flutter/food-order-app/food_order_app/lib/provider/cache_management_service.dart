import 'package:food_order_app/model/restaurants_filter_settings/RestaurantsFilterSettings.dart';
import 'package:food_order_app/model/types/cuisine_type.dart';
import 'package:food_order_app/model/types/filter_type.dart';
import 'package:food_order_app/model/types/sort_by_type.dart';
import 'package:food_order_app/utils/map/map_helpers.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum CacheKeysType {
  activeCuisines,
  sortByType,
  activeFilters,
}

///Singleton class to manage the cache
class CacheManagementService {
  static final CacheManagementService _instance =
      CacheManagementService._internal();

  CacheManagementService._internal();

  factory CacheManagementService() {
    return CacheManagementService._instance;
  }

  Future<RestaurantsFilterSettings> loadFiltersSettings() async {
    final prefs = await SharedPreferences.getInstance();

    ///Get active Cuisines List
    List<CuisineType> activeCuisines = _enumValuesFromStringValues<CuisineType>(
      CuisineType.values,
      prefs.getStringList(CacheKeysType.activeCuisines.name),
    );

    ///Get sortByType
    String? sortByTypeString = prefs.getString(CacheKeysType.sortByType.name);
    SortByType sortByType;
    if (sortByTypeString != null) {
      sortByType = _enumValueFromString<SortByType>(
          SortByType.values, sortByTypeString!);
    } else {
      sortByType = SortByType.none;
    }

    ///Get active Filters List
    List<FilterType> activeFilters = _enumValuesFromStringValues<FilterType>(
        FilterType.values,
        prefs.getStringList(CacheKeysType.activeFilters.name));

    return RestaurantsFilterSettings(
      activeCuisines: activeCuisines,
      sortByType: sortByType,
      activeFilters: activeFilters,
    );
  }

  storeFiltersSettings(RestaurantsFilterSettings settings) async {
    final prefs = await SharedPreferences.getInstance();

    ///Store active Cuisines List
    prefs.setStringList(CacheKeysType.activeCuisines.name,
        _enumValuesToStringValues(settings.cuisinesMap.trueKeys()));

    ///Store sortByType
    prefs.setString(CacheKeysType.sortByType.name, settings.sortByType.name);

    ///Store active Filters List
    prefs.setStringList(
      CacheKeysType.activeFilters.name,
      _enumValuesToStringValues(settings.filters.trueKeys()),
    );
  }

  // Helpers method for converting string to enum and reverse
  static List<T> _enumValuesFromStringValues<T extends Enum>(
      List<T> enumValues, List<String>? stringValues) {
    if (stringValues == null) return [];

    return stringValues.map((String name) {
      return _enumValueFromString<T>(enumValues, name);
    }).toList();
  }

  static List<String> _enumValuesToStringValues<T extends Enum>(
      List<T> enumValues) {
    return enumValues.map((T type) => type.name).toList();
  }

  static T _enumValueFromString<T extends Enum>(
      List<T> enumValues, String name) {
    return enumValues.singleWhere((T type) {
      return type.name == name;
    });
  }
}
