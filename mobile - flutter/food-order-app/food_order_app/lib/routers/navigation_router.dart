import 'package:flutter/material.dart';
import 'package:food_order_app/application/authentification_service.dart';
import 'package:food_order_app/routers/auth_router.dart';
import 'package:food_order_app/routers/user_router.dart';

class NavigationRouter {
  static Route? generateRoute(RouteSettings settings) {
    Route? handeledRoute;

    handeledRoute ??= AuthRouter().generateRoute(settings);

    String? errorMessage;
    if (AuthentificationService.isLoggeIn) {
      handeledRoute ??= UserRouter().generateRoute(settings);
    } else {
      errorMessage = "user not logged in";
    }

    return handeledRoute ?? defaultRoute(settings, errorMessage: errorMessage);
  }

  static defaultRoute(RouteSettings settings, {String? errorMessage}) {
    return MaterialPageRoute(
      builder: (BuildContext context) {
        return MaterialApp(
          home: Scaffold(
            body: Center(
              child: Text("rout not found at ${errorMessage ?? settings.name}"),
            ),
          ),
        );
      },
      settings: settings,
      fullscreenDialog: false,
    );
  }

  static String? getInitialRoute() {
    return AuthentificationService.isLoggeIn
        ? UserRouter().getInitialRoute()
        : AuthRouter().getInitialRoute();
  }
}
