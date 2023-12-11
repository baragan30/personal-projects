import 'package:flutter/material.dart';
import 'package:food_order_app/model/restaurant/restaurant_model.dart';
import 'package:food_order_app/presentation/screens/exploration_screen.dart';
import 'package:food_order_app/presentation/screens/restaurant_details_screen.dart';
import 'package:food_order_app/presentation/screens/restaurants_list_screen.dart';
import 'package:food_order_app/presentation/screens/settings_screen.dart';
import 'package:food_order_app/routers/abstract_router.dart';

enum UserPages {
  exploration,
  restaurantsList,
  restaurantDetails,
  orders,
  settings,
  favourite,
}

extension UserPagesNames on UserPages {
  String routeName() {
    switch (this) {
      case UserPages.exploration:
        return '/exploration';
      case UserPages.restaurantDetails:
        return '/restaurantDetails';
      case UserPages.restaurantsList:
        return '/restaurantsList';
      case UserPages.settings:
        return '/settings';
      case UserPages.orders:
        return '/orders';
      case UserPages.favourite:
        return '/favourite';
    }
    throw StateError("UserPagesNames extension route name default exception");
  }
}

class UserRouter extends AbstractRouter<UserPages> {
  static final UserRouter _instance = UserRouter._internal();

  factory UserRouter() {
    return _instance;
  }

  UserRouter._internal();

  @override
  Route? generateRoute(RouteSettings settings) {
    for (UserPages type in UserPages.values) {
      if (type.routeName() == settings.name) {
        switch (type) {
          case UserPages.exploration:
            return MaterialPageRoute(
              builder: (BuildContext context) => const ExplorationScreen(),
              settings: settings,
              fullscreenDialog: false,
            );
          case UserPages.restaurantsList:
            return MaterialPageRoute(
              builder: (BuildContext context) => RestaurantsListScreen(),
              settings: settings,
              fullscreenDialog: false,
            );
          case UserPages.restaurantDetails:
            RestaurantModel restaurant = settings.arguments as RestaurantModel;
            return MaterialPageRoute(
              builder: (BuildContext context) =>
                  RestaurantDetailsScreen(restaurant: restaurant),
              settings: settings,
              fullscreenDialog: false,
            );
          case UserPages.settings:
            return MaterialPageRoute(
              builder: (BuildContext context) => SettingsPage(),
              settings: settings,
              fullscreenDialog: false,
            );
          case UserPages.orders:
            return MaterialPageRoute(
              builder: (BuildContext context) =>
                  const Center(child: Text("No page yet")),
              settings: settings,
              fullscreenDialog: false,
            );
          case UserPages.favourite:
            return MaterialPageRoute(
              builder: (BuildContext context) =>
                  const Center(child: Text("No page yet")),
              settings: settings,
              fullscreenDialog: false,
            );
        }
        throw StateError("UserRouter class generateRoute exception");
      }
    }
  }

  @override
  String? getInitialRoute() {
    return UserPages.exploration.routeName();
  }
}
