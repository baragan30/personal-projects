import 'package:flutter/material.dart';
import 'package:food_order_app/model/food/food_model.dart';
import 'package:food_order_app/model/restaurant/restaurant_model.dart';
import 'package:food_order_app/presentation/primitive_widget/horizontal_section.dart';
import 'package:food_order_app/presentation/primitive_widget/vertical_section.dart';
import 'package:food_order_app/presentation/widgets/nav_bars/navigation_icon_button.dart';
import 'package:food_order_app/presentation/widgets/restaurant_details_widgets/food_brief_card.dart';
import 'package:food_order_app/presentation/widgets/restaurant_details_widgets/food_description_card.dart';
import 'package:food_order_app/presentation/widgets/restaurant_details_widgets/pick_up_bar.dart';
import 'package:food_order_app/presentation/widgets/restaurant_details_widgets/restaurant_header.dart';
import 'package:food_order_app/utils/ui_helpers/sized_box_ui_helper.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/custom_sizes_helper.dart';

class RestaurantDetailsScreen extends StatefulWidget {
  const RestaurantDetailsScreen({required this.restaurant});
  final RestaurantModel restaurant;

  @override
  State<RestaurantDetailsScreen> createState() =>
      _RestaurantDetailsScreenState();
}

class _RestaurantDetailsScreenState extends State<RestaurantDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: NavigationIconButton.backButton(onTap: () {
          Navigator.pop(context);
        }),
        // title: Text(widget.restaurant.name),
        actions: [
          NavigationIconButton.bookmarkButton(onTap: () {}),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          RestaurantHeader(restaurant: widget.restaurant),
          PickUpSection(
            onOrderNow: () {},
          ),
          SizedBoxUiHelper.bigSizedBox(),
          _featuredItemsSection(),
          SizedBoxUiHelper.bigSizedBox(),
          _foodSection(),
        ],
      ),
    );
  }

  Widget _featuredItemsSection() {
    return HorizontalSection(
      title: "Featured Items",
      childSpacing: CustomSizeHelper.bigOffset(),
      children: widget.restaurant.foodsList
          .map((FoodModel food) => FoodBriefCard(food: food))
          .toList(),
    );
  }

  Widget _foodSection() {
    return VerticalSection(
      title: "Food",
      childSpacing: CustomSizeHelper.bigOffset(),
      children: widget.restaurant.foodsList
          .map((FoodModel food) => FoodDescriptionCard(food: food))
          .toList(),
    );
  }
}
