import 'package:flutter/material.dart';
import 'package:food_order_app/routers/user_router.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/box_shadow_helper.dart';

enum MainScreenType {
  explore,
  orders,
  favourite,
  profile,
}

extension MainScreensExtension on MainScreenType {
  String label() {
    return "${name[0].toUpperCase()}${name.substring(1).toLowerCase()}";
  }

  UserPages get userPage {
    switch (this) {
      case MainScreenType.explore:
        return UserPages.exploration;
      case MainScreenType.orders:
        return UserPages.orders;
      case MainScreenType.favourite:
        return UserPages.favourite;
      case MainScreenType.profile:
        return UserPages.settings;
    }
    throw StateError("MainScreenType not found");
  }

  String routeName() {
    return userPage.routeName();
  }

  IconData iconData() {
    switch (this) {
      case MainScreenType.explore:
        return Icons.explore_outlined;
      case MainScreenType.orders:
        return Icons.file_copy_outlined;
      case MainScreenType.favourite:
        return Icons.favorite_border_outlined;
      case MainScreenType.profile:
        return Icons.account_box_outlined;
    }
    throw StateError("MainScreenType not found");
  }
}

class FoodAppBottomBar extends StatelessWidget {
  const FoodAppBottomBar({required this.mainScreen});
  final MainScreenType mainScreen;

  List<BottomNavigationBarItem> _items() {
    return MainScreenType.values.map(
      (MainScreenType mainScreen) {
        return BottomNavigationBarItem(
          icon: Icon(mainScreen.iconData()),
          label: mainScreen.label(),
        );
      },
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadowHelper.defaultCardShadow(),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: mainScreen.index,
        onTap: (int index) {
          Navigator.of(context).pushNamed(
            MainScreenType.values[index].routeName(),
          );
        },
        items: _items(),
      ),
    );
  }
}
