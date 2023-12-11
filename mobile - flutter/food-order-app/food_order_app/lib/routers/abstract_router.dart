import 'package:flutter/material.dart';

abstract class AbstractRouter<E extends Enum> {
  Route? generateRoute(RouteSettings settings);
  String? getInitialRoute();
}
