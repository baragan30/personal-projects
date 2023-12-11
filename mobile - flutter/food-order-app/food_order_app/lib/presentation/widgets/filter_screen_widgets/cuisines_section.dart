import 'package:flutter/material.dart';
import 'package:food_order_app/model/types/cuisine_type.dart';
import 'package:food_order_app/presentation/widgets/filter_screen_widgets/cuisine_outline_button.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/edge_insets_helper.dart';

class FilterCuisinesSection extends StatefulWidget {
  FilterCuisinesSection({required this.cuisinesMap});
  final Map<CuisineType, bool> cuisinesMap;
  @override
  State<FilterCuisinesSection> createState() => _FilterCuisinesSectionState();
}

class _FilterCuisinesSectionState extends State<FilterCuisinesSection> {
  void _updateCuisine(CuisineType cuisine) {
    setState(() {
      widget.cuisinesMap[cuisine] = !widget.cuisinesMap[cuisine]!;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    return Padding(
      padding: EdgeInsetsHelper.horizontalSmallEdgeInsets(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "CUISINES",
            style: textTheme.headlineMedium,
          ),
          Wrap(
            verticalDirection: VerticalDirection.down,
            children: widget.cuisinesMap.keys.map((CuisineType cuisine) {
              return CuisineOutlineButton(
                cuisine: cuisine,
                onPressed: () {
                  _updateCuisine(cuisine);
                },
                isActive: widget.cuisinesMap[cuisine]!,
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
