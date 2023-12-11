import 'package:flutter/material.dart';
import 'package:food_order_app/model/food/food_model.dart';
import 'package:food_order_app/presentation/primitive_widget/rounded_image.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/color_helper.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/custom_sizes_helper.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/edge_insets_helper.dart';

class FoodBriefCard extends StatelessWidget {
  const FoodBriefCard({required this.food});

  final FoodModel food;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final double width = CustomSizeHelper.ultraBigSize();
    final double imageHeight = CustomSizeHelper.bigSize();
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RoundedImage(
            imageUrl: food.imageUrl,
            margin: EdgeInsetsHelper.verticalSmallEdgeInsets(),
            height: imageHeight,
          ),
          Text(
            food.name,
            style: textTheme.displaySmall,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            "\$ ${food.price.toStringAsFixed(2)}",
            style: const TextStyle(color: ColorHelper.pink2Color),
          ),
        ],
      ),
    );
  }
}
