import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoritemealsNotifier extends StateNotifier<List<Meal>> {
  FavoritemealsNotifier() : super([]);

  bool togleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal);
    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoritemealsNotifier, List<Meal>>((ref) {
  return FavoritemealsNotifier();
});
