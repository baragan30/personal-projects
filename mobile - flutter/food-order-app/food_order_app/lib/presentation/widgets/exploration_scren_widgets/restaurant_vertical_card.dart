import 'package:flutter/material.dart';
import 'package:food_order_app/model/featured/extensions/offers_model_list_extension.dart';
import 'package:food_order_app/model/featured/offers_model.dart';
import 'package:food_order_app/model/restaurant/restaurant_model.dart';
import 'package:food_order_app/model/types/cuisine_type.dart';
import 'package:food_order_app/presentation/primitive_widget/combo_row.dart';
import 'package:food_order_app/presentation/primitive_widget/rounded_image.dart';
import 'package:food_order_app/presentation/widgets/card_details_widgets/offer_cell.dart';
import 'package:food_order_app/presentation/widgets/card_details_widgets/program_row.dart';
import 'package:food_order_app/presentation/widgets/card_details_widgets/rating_row.dart';
import 'package:food_order_app/presentation/widgets/card_details_widgets/title_and_price_row.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/custom_sizes_helper.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/edge_insets_helper.dart';

class RestaurantVerticalCard extends StatelessWidget {
  const RestaurantVerticalCard({required this.restaurant, this.onTap});

  final VoidCallback? onTap;

  final RestaurantModel restaurant;

  Widget? _offerCell(List<OffersModel> offersList) {
    OffersModel? offer = offersList.mostImportantOffer();
    return offer == null
        ? null
        : ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: CustomSizeHelper.bigSize(),
            ),
            child: OfferCell(offer),
          );
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    final double width = CustomSizeHelper.ultraBigSize();
    final double imageHeight = CustomSizeHelper.largeSize();

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /// Image
            Container(
              margin: EdgeInsetsHelper.verticalSmallEdgeInsets(),
              child: RoundedImage(
                imageUrl: restaurant.imageUrl,
                height: imageHeight,
              ),
            ),

            /// Title and Price
            TitleAndPriceRow(
              restaurant: restaurant,
              textStyle: textTheme.headlineLarge,
            ),

            /// Cuisine List
            Text(
              restaurant.cuisine.titlesString(),
              overflow: TextOverflow.ellipsis,
            ),

            ///Program Row
            ProgramRow(
              openDays: restaurant.openDays,
              startTime: restaurant.startTime,
              endTime: restaurant.endTime,
            ),

            /// Rating and Offer
            ComboRow(
              mainWidget: RatingRow(
                rating: restaurant.rating,
                numberOfRatings: restaurant.numberOfRatings,
              ),
              secondaryWidget: _offerCell(restaurant.offers),
            ),
          ],
        ),
      ),
    );
  }
}
