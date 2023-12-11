import 'package:flutter/material.dart';
import 'package:food_order_app/model/featured/extensions/offers_model_list_extension.dart';
import 'package:food_order_app/model/featured/offers_model.dart';
import 'package:food_order_app/model/restaurant/restaurant_model.dart';
import 'package:food_order_app/model/types/cuisine_type.dart';
import 'package:food_order_app/presentation/widgets/card_details_widgets/offer_cell.dart';
import 'package:food_order_app/presentation/widgets/card_details_widgets/program_row.dart';
import 'package:food_order_app/utils/list/list_helpers.dart';
import 'package:food_order_app/utils/ui_helpers/sized_box_ui_helper.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/color_helper.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/custom_sizes_helper.dart';

class RestaurantHeader extends StatelessWidget {
  RestaurantHeader({
    required this.restaurant,
    double? height,
  }) {
    this.height = height ?? CustomSizeHelper.carouselImageHeight();
  }

  final RestaurantModel restaurant;
  late final double height;
  @override
  Widget build(BuildContext context) {
    final double contentOffset = CustomSizeHelper.verySmallOffset();
    return SizedBox(
      height: height,
      child: Stack(
        children: [
          ///Background Image
          _backgroundImage(),

          ///Content
          Positioned(
            bottom: contentOffset,
            left: contentOffset,
            right: contentOffset,
            child: _restaurantInformation(context),
          )
        ],
      ),
    );
  }

  Widget _restaurantInformation(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    const double elementsSpacing = 4;

    return DefaultTextStyle.merge(
        style: TextStyle(
          color: ColorHelper.white,
          fontSize: CustomSizeHelper.descriptionSize(),
          fontWeight: FontWeight.normal,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Best Offers
            _offersRow(),

            const SizedBox(height: elementsSpacing),

            ///Title
            Text(
              restaurant.name,
              overflow: TextOverflow.visible,
              maxLines: 2,
              style: textTheme.titleLarge?.copyWith(
                color: ColorHelper.white,
              ),
            ),

            const SizedBox(height: elementsSpacing),

            ///Cuisine
            if (restaurant.cuisine.isNotEmpty)
              Text(
                restaurant.cuisine.maxKElements(2).titlesString(),
                overflow: TextOverflow.fade,
              ),

            const SizedBox(height: elementsSpacing),

            ///Program
            if (restaurant.hasProgram())
              ProgramRow(
                openDays: restaurant.openDays,
                startTime: restaurant.startTime,
                endTime: restaurant.endTime,
                expanded: false,
              ),

            const SizedBox(height: elementsSpacing * 0.5),

            Divider(
              color: Colors.white,
              thickness: CustomSizeHelper.dividerThickness(),
            ),

            ///Bottom Information
            _bottomInformationRow(),
          ],
        ));
  }

  ///Row with maximum 2 offers
  Widget _offersRow() {
    return Row(
      children: restaurant.offers
          .mostImportantKOffers(k: 2)
          .map<Widget>((OffersModel offer) {
        return Container(
          constraints: BoxConstraints(
            maxWidth: CustomSizeHelper.bigSize(),
          ),
          padding: EdgeInsets.only(
            right: CustomSizeHelper.verySmallOffset(),
          ),
          child: OfferCell(offer),
        );
      }).toList(),
    );
  }

  Widget _bottomInformationRow() {
    final String ratingString =
        restaurant.rating?.toStringAsFixed(2) ?? "No data";
    return Padding(
      padding: EdgeInsets.zero,
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _bottomCell(
              iconData: Icons.star,
              title: ratingString,
              subtitle: "210 Ratings",
            ),
            _verticalDivider(),
            _bottomCell(
              iconData: Icons.bookmark,
              title: "90k",
              subtitle: "210 Ratings",
            ),
            _verticalDivider(),
            _bottomCell(
              iconData: Icons.image,
              title: "250",
              subtitle: "Photos",
            ),
          ],
        ),
      ),
    );
  }

  Widget _verticalDivider() {
    return VerticalDivider(
      color: Colors.white,
      width: 1,
      thickness: CustomSizeHelper.dividerThickness(),
    );
  }

  Widget _bottomCell({
    required IconData iconData,
    required String title,
    required String subtitle,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              iconData,
              color: ColorHelper.white,
              size: CustomSizeHelper.descriptionSize(),
            ),

            // to give some space between icon and title
            SizedBoxUiHelper.ultraSmallSizedBox(),

            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Text(
          subtitle,
        ),
      ],
    );
  }

  Widget _backgroundImage() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(restaurant.imageUrl),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.65),
            BlendMode.srcOver,
          ),
        ),
      ),
    );
  }
}
