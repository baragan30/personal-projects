import 'package:flutter/material.dart';
import 'package:food_order_app/model/image_urls_utils.dart';
import 'package:food_order_app/model/restaurant/restaurant_model.dart';
import 'package:food_order_app/presentation/screens/filter_screen.dart';
import 'package:food_order_app/presentation/widgets/nav_bars/navigation_icon_button.dart';
import 'package:food_order_app/presentation/widgets/restaurant_horizontal_card2.dart';
import 'package:food_order_app/provider/restaurant_provider.dart';
import 'package:food_order_app/utils/ui_helpers/sized_box_ui_helper.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/color_helper.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/edge_insets_helper.dart';
import 'package:provider/provider.dart';

import 'abstract_screens/carousel_screen.dart';

class RestaurantsListScreen extends CarouselScreen {
  RestaurantsListScreen()
      : super(
          imageUrls: ImageUrlUtils.loginScreenImages,
          borderRadius: 0,
          backgroundColor: ColorHelper.gray3Color,
        );

  @override
  RestaurantsScreenState createState() => RestaurantsScreenState();
}

class RestaurantsScreenState
    extends CarouselScreenState<RestaurantsListScreen> {
  @override
  PreferredSizeWidget? appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: NavigationIconButton.backButton(
        onTap: () {
          Navigator.of(context).pop();
        },
      ),
      actions: [
        NavigationIconButton.filterButton(
          onTap: () {
            FilterScreen.showFilterScreen(context: context);
          },
        ),
      ],
    );
  }

  @override
  Widget? child() {
    return Consumer<RestaurantProvider>(builder:
        (BuildContext context, RestaurantProvider restaurantProvider, child) {
      final List<Widget> bodyChildren =
          _bodyChildren(restaurantProvider.filteredRestaurants);
      return Padding(
        padding: EdgeInsetsHelper.allVerySmallEdgeInsets(),
        child: ListView.builder(
          padding: EdgeInsetsHelper.topSmallEdgeInsets(),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: bodyChildren.length,
          itemBuilder: (BuildContext context, int index) {
            return bodyChildren[index];
          },
        ),
      );
    });
  }

  List<Widget> _bodyChildren(List<RestaurantModel> restaurantsList) {
    final ThemeData theme = Theme.of(context);
    final TextTheme textTheme = theme.textTheme;

    return [
      //Section Title
      SizedBoxUiHelper.smallSizedBox(),
      Text(
        "${restaurantsList.length} places found",
        style: textTheme.headlineSmall,
      ),

      //Restaurants Cards
      ...restaurantsList.map((RestaurantModel restaurantModel) {
        return Container(
          margin: EdgeInsetsHelper.verticalVerySmallEdgeInsets(),
          child: RestaurantHorizontalCard2(
            restaurant: restaurantModel,
          ),
        );
      }).toList(),
    ];
  }
}
