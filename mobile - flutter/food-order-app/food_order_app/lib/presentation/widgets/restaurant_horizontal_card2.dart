import 'package:flutter/material.dart';
import 'package:food_order_app/model/featured/extensions/offers_model_list_extension.dart';
import 'package:food_order_app/model/featured/offers_model.dart';
import 'package:food_order_app/model/restaurant/restaurant_model.dart';
import 'package:food_order_app/model/types/cuisine_type.dart';
import 'package:food_order_app/presentation/primitive_widget/combo_row.dart';
import 'package:food_order_app/presentation/primitive_widget/rounded_image.dart';
import 'package:food_order_app/utils/ui_helpers/sized_box_ui_helper.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/border_radius_helper.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/box_shadow_helper.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/custom_sizes_helper.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/edge_insets_helper.dart';

import 'card_details_widgets/offer_cell.dart';
import 'card_details_widgets/program_row.dart';
import 'card_details_widgets/rating_row.dart';

class RestaurantHorizontalCard2 extends StatelessWidget {
  const RestaurantHorizontalCard2({required this.restaurant});

  final RestaurantModel restaurant;

  @override
  Widget build(BuildContext context) {
    final double imageWidth = CustomSizeHelper.bigSize();

    ///Decorations
    return Container(
      padding: EdgeInsetsHelper.allSmallEdgeInsets(),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusHelper.smallCircleBorderRadius(),
        boxShadow: [
          BoxShadowHelper.defaultCardShadow(),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RoundedImage(
              imageUrl: restaurant.imageUrl,
              width: imageWidth,
            ),
            SizedBoxUiHelper.verySmallSizedBox(),
            _detailsColumn(context),
          ],
        ),
      ),
    );
  }

  Widget _detailsColumn(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    final EdgeInsets elementsPadding =
        EdgeInsets.only(bottom: CustomSizeHelper.ultraSmallOffset());

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///Name and bookmark icon
          ComboRow(
            mainWidget: Text(
              restaurant.name,
              style: textTheme.headlineLarge,
              overflow: TextOverflow.visible,
              maxLines: 2,
            ),
            secondaryWidget: Icon(
              Icons.bookmark_border_outlined,
              color: themeData.primaryColor,
              size: CustomSizeHelper.ultraSmallSize() * 1.1,
            ),
          ),

          ///Cuisines list
          Padding(
            padding: elementsPadding,
            child: Text(
              restaurant.cuisine.titlesString(),
              overflow: TextOverflow.ellipsis,
            ),
          ),

          ///Program (open days and hours)
          Padding(
            padding: elementsPadding,
            child: ProgramRow(
              openDays: restaurant.openDays,
              startTime: restaurant.startTime,
              endTime: restaurant.endTime,
            ),
          ),

          ///Rating and Offer cell
          ComboRow(
            mainWidget: RatingRow(
              rating: restaurant.rating,
              numberOfRatings: restaurant.numberOfRatings,
            ),
            secondaryWidget: _offerCell(restaurant.offers),
          )
        ],
      ),
    );
  }

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
}
