import 'package:flutter/material.dart';
import 'package:food_order_app/presentation/screens/login_screen.dart';
import 'package:food_order_app/presentation/screens/register_screen.dart';
import 'package:food_order_app/routers/abstract_router.dart';

enum AuthPages {
  register,
  login,
}

extension AuthPagesNames on AuthPages {
  String routeName() {
    switch (this) {
      case AuthPages.login:
        return "/login";
      case AuthPages.register:
        return "/register";
    }
    throw StateError("AuthPagesNames extension route name default exception");
  }
}

class AuthRouter extends AbstractRouter<AuthPages> {
  static final AuthRouter _instance = AuthRouter._internal();

  factory AuthRouter() {
    return _instance;
  }

  AuthRouter._internal();

  @override
  Route? generateRoute(RouteSettings settings) {
    for (AuthPages type in AuthPages.values) {
      if (type.routeName() == settings.name) {
        switch (type) {
          case AuthPages.login:
            return MaterialPageRoute(
              builder: (BuildContext context) => LoginScreen(),
              settings: settings,
              fullscreenDialog: false,
            );
          case AuthPages.register:
            return MaterialPageRoute(
              builder: (BuildContext context) => RegisterScreen(),
              settings: settings,
              fullscreenDialog: false,
            );
        }
        throw StateError("AuthRouter class generateRoute exception");
      }
    }
    return null;
  }

  @override
  String? getInitialRoute() {
    return AuthPages.login.routeName();
  }
}
