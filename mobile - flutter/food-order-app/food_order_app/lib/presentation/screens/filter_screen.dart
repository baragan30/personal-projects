import 'package:flutter/material.dart';
import 'package:food_order_app/model/restaurants_filter_settings/RestaurantsFilterSettings.dart';
import 'package:food_order_app/model/types/sort_by_type.dart';
import 'package:food_order_app/presentation/widgets/filter_screen_widgets/cuisines_section.dart';
import 'package:food_order_app/presentation/widgets/filter_screen_widgets/filter_price_range_section.dart';
import 'package:food_order_app/presentation/widgets/filter_screen_widgets/filter_section.dart';
import 'package:food_order_app/presentation/widgets/filter_screen_widgets/sort_by_section.dart';
import 'package:food_order_app/presentation/widgets/filter_screen_widgets/top_bar_section.dart';
import 'package:food_order_app/provider/cache_management_service.dart';
import 'package:food_order_app/provider/restaurant_provider.dart';
import 'package:food_order_app/utils/ui_helpers/sized_box_ui_helper.dart';
import 'package:provider/provider.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({this.onApplyFilters});
  final VoidCallback? onApplyFilters;

  static Future<void> showFilterScreen({
    required BuildContext context,
    VoidCallback? onApplyFilters,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return FilterScreen(
          onApplyFilters: onApplyFilters,
        );
      },
    );
  }

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  late RestaurantsFilterSettings _restaurantsSettings;

  @override
  void initState() {
    super.initState();
    _restaurantsSettings = RestaurantsFilterSettings();
    CacheManagementService()
        .loadFiltersSettings()
        .then((RestaurantsFilterSettings restaurantsSettings) {
      setState(() {
        _restaurantsSettings = restaurantsSettings;
      });
    });
  }

  void _applyFilters() {
    Provider.of<RestaurantProvider>(context, listen: false)
        .applyFilters(_restaurantsSettings);

    CacheManagementService().storeFiltersSettings(_restaurantsSettings);

    Navigator.of(context).pop();
    widget.onApplyFilters?.call();
  }

  void _resetFilters() {
    setState(() {
      _restaurantsSettings.resetToDefault();
    });
  }

  void _setSortByType(SortByType sortByType) {
    _restaurantsSettings.sortByType = sortByType;
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      maxChildSize: 1.0,
      minChildSize: 0.3,
      initialChildSize: 0.55,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          color: Colors.white,
          child: ListView(
            controller: scrollController,
            children: [
              FilterTopBarSection(
                onApply: _applyFilters,
                onReset: _resetFilters,
              ),
              FilterCuisinesSection(
                cuisinesMap: _restaurantsSettings.cuisinesMap,
              ),
              FilterSortBySection(
                sortByType: _restaurantsSettings.sortByType,
                onChangeSortByType: _setSortByType,
              ),
              FilterSection(
                filters: _restaurantsSettings.filters,
              ),
              const FilterPriceRangeSection(),
              SizedBoxUiHelper.veryBigSizedBox(),
            ],
          ),
        );
      },
    );
  }
}
