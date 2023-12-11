import 'package:flutter/material.dart';

class NavigationIconButton extends StatelessWidget {
  IconData iconData;
  VoidCallback? onTap;
  Color? iconColor;

  NavigationIconButton({
    required this.iconData,
    this.onTap,
    this.iconColor,
  });

  factory NavigationIconButton.backButton({required VoidCallback onTap}) {
    return NavigationIconButton(
      iconData: Icons.arrow_back,
      onTap: onTap,
    );
  }

  factory NavigationIconButton.filterButton({required VoidCallback onTap}) {
    return NavigationIconButton(
      iconData: Icons.filter_alt_outlined,
      onTap: onTap,
    );
  }
  factory NavigationIconButton.bookmarkButton({required VoidCallback onTap}) {
    return NavigationIconButton(
      iconData: Icons.bookmark_add_outlined,
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Icon(
        iconData,
        size: 32,
        color: iconColor,
      ),
    );
  }
}
