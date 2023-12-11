import 'package:flutter/material.dart';
import 'package:food_order_app/model/types/sort_by_type.dart';
import 'package:food_order_app/presentation/widgets/filter_screen_widgets/option_row.dart';
import 'package:food_order_app/utils/ui_helpers/sized_box_ui_helper.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/custom_sizes_helper.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/edge_insets_helper.dart';

class FilterSortBySection extends StatefulWidget {
  FilterSortBySection({
    required this.sortByType,
    required this.onChangeSortByType,
  });

  SortByType sortByType;
  Function(SortByType) onChangeSortByType;

  @override
  State<FilterSortBySection> createState() => _FilterSortBySectionState();
}

class _FilterSortBySectionState extends State<FilterSortBySection> {
  ///Get option row widgets list
  List<OptionRow> _optionsRowsList() {
    return SortByType.values
        .where((SortByType sortByType) => sortByType != SortByType.none)
        .map((SortByType sortByType) {
      return OptionRow(
        title: sortByType.title,
        onPressed: () {
          setState(() {
            if (widget.sortByType == sortByType) {
              widget.sortByType = SortByType.none;
            } else {
              widget.sortByType = sortByType;
            }
            widget.onChangeSortByType(widget.sortByType);
          });
        },
        isSelected: widget.sortByType == sortByType,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBoxUiHelper.defaultSizedBox(),
        Padding(
          padding: EdgeInsetsHelper.horizontalSmallEdgeInsets(),
          child: Text(
            "SORT BY",
            style: textTheme.headlineMedium,
          ),
        ),

        //filter for none

        Divider(
          thickness: CustomSizeHelper.veryThinOffset(),
        ),

        ..._optionsRowsList(),
      ],
    );
  }
}
