import 'package:flutter/material.dart';
import 'package:food_order_app/model/restaurant/restaurant_model.dart';
import 'package:food_order_app/model/types/cuisine_type.dart';
import 'package:food_order_app/presentation/primitive_widget/combo_row.dart';
import 'package:food_order_app/presentation/widgets/card_details_widgets/featured_image.dart';
import 'package:food_order_app/presentation/widgets/card_details_widgets/program_row.dart';
import 'package:food_order_app/presentation/widgets/card_details_widgets/rating_row.dart';
import 'package:food_order_app/presentation/widgets/card_details_widgets/title_and_price_row.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/custom_sizes_helper.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/edge_insets_helper.dart';

class RestaurantHorizontalCard extends StatelessWidget {
  const RestaurantHorizontalCard({required this.restaurant});

  final RestaurantModel restaurant;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    final double imageHeight = CustomSizeHelper.veryBigSize();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        /// Featured Image
        Container(
          margin: EdgeInsetsHelper.verticalSmallEdgeInsets(),
          child: FeaturedImage(
            imageUrl: restaurant.imageUrl,
            offersList: restaurant.offers,
            height: imageHeight,
          ),
        ),

        /// Card Details
        TitleAndPriceRow(
          restaurant: restaurant,
          textStyle: textTheme.headlineLarge,
        ),

        ///Cuisine List
        if (restaurant.cuisine.isNotEmpty)
          Text(
            restaurant.cuisine.titlesString(),
            overflow: TextOverflow.ellipsis,
          ),

        /// Rating and Program
        ComboRow(
          mainWidget: RatingRow(
            rating: restaurant.rating,
            numberOfRatings: restaurant.numberOfRatings,
          ),
          secondaryWidget: ProgramRow(
            openDays: restaurant.openDays,
            startTime: restaurant.startTime,
            endTime: restaurant.endTime,
            expanded: false,
          ),
        ),
      ],
    );
  }
}
