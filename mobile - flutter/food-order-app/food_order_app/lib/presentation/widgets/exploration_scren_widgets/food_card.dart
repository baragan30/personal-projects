import 'package:flutter/material.dart';
import 'package:food_order_app/model/food/food_model.dart';
import 'package:food_order_app/presentation/primitive_widget/combo_row.dart';
import 'package:food_order_app/presentation/widgets/card_details_widgets/featured_image.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/custom_sizes_helper.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/edge_insets_helper.dart';

import '../card_details_widgets/rating_row.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({required this.foodModel});

  final FoodModel foodModel;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    final double width = CustomSizeHelper.ultraBigSize();
    final double imageHeight = CustomSizeHelper.defaultSize();
    return SizedBox(
      width: width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsetsHelper.verticalSmallEdgeInsets(),
            child: FeaturedImage(
              imageUrl: foodModel.imageUrl,
              offersList: foodModel.offers,
              maxOffers: 2,
              height: imageHeight,
            ),
          ),
          ComboRow(
            mainWidget: Text(
              foodModel.name,
              style: textTheme.headlineLarge,
              overflow: TextOverflow.ellipsis,
            ),
            secondaryWidget: RatingRow(
              rating: foodModel.rating,
            ),
          ),
        ],
      ),
    );
  }
}
