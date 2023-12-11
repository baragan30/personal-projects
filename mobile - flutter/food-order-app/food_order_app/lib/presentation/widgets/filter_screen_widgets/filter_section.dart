import 'package:flutter/material.dart';
import 'package:food_order_app/model/types/filter_type.dart';
import 'package:food_order_app/utils/ui_helpers/sized_box_ui_helper.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/edge_insets_helper.dart';

import 'option_row.dart';

class FilterSection extends StatefulWidget {
  const FilterSection({required this.filters});
  final Map<FilterType, bool> filters;
  @override
  State<FilterSection> createState() => _FilterSectionState();
}

class _FilterSectionState extends State<FilterSection> {
  ///Get option row widgets list
  List<OptionRow> _optionsRowsList() {
    return FilterType.values.map((FilterType filterType) {
      return OptionRow(
        title: filterType.title,
        onPressed: () {
          setState(() {
            widget.filters[filterType] = !widget.filters[filterType]!;
          });
        },
        isSelected: widget.filters[filterType]!,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBoxUiHelper.defaultSizedBox(),
        Padding(
          padding: EdgeInsetsHelper.horizontalSmallEdgeInsets(),
          child: Text(
            "FILTER",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        ..._optionsRowsList(),
      ],
    );
  }
}
