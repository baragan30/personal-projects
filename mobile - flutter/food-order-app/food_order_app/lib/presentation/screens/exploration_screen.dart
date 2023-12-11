import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_order_app/model/food/extensions/food_randomizer.dart';
import 'package:food_order_app/model/food/food_model.dart';
import 'package:food_order_app/model/restaurant/restaurant_model.dart';
import 'package:food_order_app/model/types/food_category_type.dart';
import 'package:food_order_app/presentation/primitive_widget/headered_viewer.dart';
import 'package:food_order_app/presentation/primitive_widget/horizontal_section.dart';
import 'package:food_order_app/presentation/screens/filter_screen.dart';
import 'package:food_order_app/presentation/widgets/exploration_scren_widgets/food_card.dart';
import 'package:food_order_app/presentation/widgets/exploration_scren_widgets/food_category_card.dart';
import 'package:food_order_app/presentation/widgets/exploration_scren_widgets/restaurant_horizontal_card.dart';
import 'package:food_order_app/presentation/widgets/exploration_scren_widgets/restaurant_vertical_card.dart';
import 'package:food_order_app/presentation/widgets/nav_bars/food_app_bottom_bar.dart';
import 'package:food_order_app/presentation/widgets/nav_bars/search_app_bar.dart';
import 'package:food_order_app/presentation/widgets/order_complete_dialog.dart';
import 'package:food_order_app/provider/restaurant_provider.dart';
import 'package:food_order_app/routers/user_router.dart';
import 'package:food_order_app/utils/ui_helpers/sized_box_ui_helper.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/custom_sizes_helper.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/edge_insets_helper.dart';
import 'package:provider/provider.dart';

class ExplorationScreen extends StatefulWidget {
  const ExplorationScreen();

  @override
  State<ExplorationScreen> createState() => _ExplorationScreenState();
}

class _ExplorationScreenState extends State<ExplorationScreen> {
  void _showFilters() async {
    FilterScreen.showFilterScreen(
        context: context,
        onApplyFilters: () {
          Navigator.of(context)
              .pushNamed(UserPages.restaurantsList.routeName());
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(
        onFilterButtonPressed: _showFilters,
      ),

      body: _body(),

      ///Bottom Navigation Bar
      bottomNavigationBar:
          const FoodAppBottomBar(mainScreen: MainScreenType.explore),
    );
  }

  Widget _body() {
    return Consumer<RestaurantProvider>(
      builder:
          (BuildContext context, RestaurantProvider provider, Widget? child) {
        List<RestaurantModel> restaurantsList = provider.filteredRestaurants;
        return SafeArea(
          child: ListView(
            children: [
              SizedBoxUiHelper.defaultSizedBox(),

              ///Temporary pop up show message
              ElevatedButton(
                onPressed: () {
                  OrderCompleteDialog.showOrderCompleteDialog(context: context);
                },
                child: Text("Show pop up"),
              ),

              /// Discovery new Places
              _discoveryNewPlacesSection(context, restaurantsList),
              SizedBoxUiHelper.bigSizedBox(),

              /// Food Categories
              _foodCategorisSection(),
              SizedBoxUiHelper.bigSizedBox(),

              /// Best Offers
              _bestOffersSection(),
              SizedBoxUiHelper.bigSizedBox(),

              /// Restaurants List
              _restaurantsList(restaurantsList),
              SizedBoxUiHelper.bigSizedBox(),

              // RestaurantCellWidget1(),
            ],
          ),
        );
      },
    );
  }

  Widget _discoveryNewPlacesSection(
      BuildContext context, List<RestaurantModel> restaurantsList) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return HorizontalSection(
      title: "Discovery new places",
      titleTextStyle: textTheme.titleMedium,
      headerPadding: EdgeInsetsHelper.leftDefaultEdgeInsets(),
      listViewPadding: EdgeInsetsHelper.horizontalDefaultEdgeInsets(),
      childSpacing: CustomSizeHelper.bigOffset(),
      children: restaurantsList
          .map(
            (RestaurantModel restaurant) => RestaurantVerticalCard(
                restaurant: restaurant,
                onTap: () {
                  Navigator.of(context).pushNamed(
                    UserPages.restaurantDetails.routeName(),
                    arguments: restaurant,
                  );
                }),
          )
          .toList(),
    );
  }

  Widget _foodCategorisSection() {
    List<FoodCategory> foodCategories = FoodCategory.values;
    return HorizontalSection(
      title: "Top Categories",
      onTitleTap: () {
        print("_foodCategorisSection");
      },
      headerPadding: EdgeInsetsHelper.leftDefaultEdgeInsets(),
      listViewPadding: EdgeInsetsHelper.horizontalDefaultEdgeInsets(),
      childSpacing: CustomSizeHelper.verySmallOffset(),
      children: foodCategories
          .map(
            (FoodCategory foodCategory) =>
                FoodCategoryCard(foodCategory: foodCategory),
          )
          .toList(),
    );
  }

  Widget _bestOffersSection() {
    List<FoodModel> foodList = FoodRandomizer.randomFoods();
    return HorizontalSection(
      title: "Best Offers",
      onTitleTap: () {
        print("_bestOffersSection");
      },
      headerPadding: EdgeInsetsHelper.leftDefaultEdgeInsets(),
      listViewPadding: EdgeInsetsHelper.horizontalDefaultEdgeInsets(),
      childSpacing: CustomSizeHelper.defaultOffset(),
      children: foodList
          .map(
            (FoodModel foodModel) => FoodCard(foodModel: foodModel),
          )
          .toList(),
    );
  }

  _restaurantsList(List<RestaurantModel> restaurantsList) {
    return HeaderedViewer(
      title: "Restaurants",
      onTitleTap: () {},
      headerPadding: EdgeInsetsHelper.leftDefaultEdgeInsets(),
      child: Padding(
        padding: EdgeInsetsHelper.horizontalDefaultEdgeInsets(),
        child: ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: min<int>(3, restaurantsList.length),
          itemBuilder: (_, index) {
            return Container(
              margin: EdgeInsetsHelper.verticalSmallEdgeInsets(),
              child: RestaurantHorizontalCard(
                restaurant: restaurantsList[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
