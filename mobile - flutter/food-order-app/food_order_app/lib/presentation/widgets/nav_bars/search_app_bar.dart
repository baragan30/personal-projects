import 'package:flutter/material.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/color_helper.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/edge_insets_helper.dart';

class SearchAppBar extends AppBar {
  SearchAppBar({
    required VoidCallback onFilterButtonPressed,
  }) : super(
          title: const _SearchBarTextField(),
          actions: [
            Container(
              margin: EdgeInsetsHelper.allThinEdgeInsets(),
              child: ElevatedButton(
                onPressed: onFilterButtonPressed,
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  backgroundColor: ColorHelper.gray5Color,
                ),
                child: const Icon(
                  Icons.filter_list_rounded,
                ),
              ),
            ),
          ],
          automaticallyImplyLeading: false,
        );
}

class _SearchBarTextField extends StatelessWidget {
  const _SearchBarTextField();

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    return TextField(
      style: textTheme.bodyLarge,
      decoration: const InputDecoration(
        hintText: "Search",
        prefixIcon: Icon(
          Icons.search_rounded,
        ),
      ),
    );
  }
}
