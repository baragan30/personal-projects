import 'package:flutter/material.dart';
import 'package:food_order_app/model/types/food_category_type.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/border_radius_helper.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/box_shadow_helper.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/custom_sizes_helper.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/edge_insets_helper.dart';

class FoodCategoryCard extends StatelessWidget {
  FoodCategoryCard({required this.foodCategory});

  final FoodCategory foodCategory;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    final double iconSize = CustomSizeHelper.defaultSize();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsetsHelper.verticalSmallEdgeInsets(),
          width: iconSize,
          height: iconSize,
          decoration: BoxDecoration(
            borderRadius: BorderRadiusHelper.smallCircleBorderRadius(),
            color: Colors.white,
            image: DecorationImage(
              image: NetworkImage(foodCategory.imageUrl()),
              fit: BoxFit.fill,
            ),
            boxShadow: [
              BoxShadowHelper.defaultCardShadow(),
            ],
          ),
        ),
        Text(
          foodCategory.title(),
          style: textTheme.headlineLarge,
        ),
        const Text(
          "645 places",
        ),
        // Text("Alceva"),
      ],
    );
  }
}
