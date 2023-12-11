import 'package:flutter/material.dart';
import 'package:food_order_app/utils/ui_helpers/sized_box_ui_helper.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/edge_insets_helper.dart';

class FilterPriceRangeSection extends StatefulWidget {
  const FilterPriceRangeSection({Key? key}) : super(key: key);

  @override
  State<FilterPriceRangeSection> createState() =>
      _FilterPriceRangeSectionState();
}

class _FilterPriceRangeSectionState extends State<FilterPriceRangeSection> {
  late double _minValue;
  late double _maxValue;

  @override
  void initState() {
    super.initState();
    _minValue = 0;
    _maxValue = 100;
  }

  //convert double into double with max 2 decimals
  double _convertDouble(double value) {
    return double.parse(value.toStringAsFixed(2));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsHelper.horizontalSmallEdgeInsets(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBoxUiHelper.defaultSizedBox(),
          Text(
            "PRICE",
            style: Theme.of(context).textTheme.headlineMedium,
          ),

          ///Select Price Range Bar
          Container(
            margin: EdgeInsetsHelper.verticalSmallEdgeInsets(),
            child: RangeSlider(
              min: 0,
              max: 300,
              values: RangeValues(_minValue, _maxValue),
              labels: RangeLabels(
                "\$${_minValue.toStringAsFixed(2)}",
                "\$${_maxValue.toStringAsFixed(2)}",
              ),
              divisions: 300,
              onChanged: (values) {
                setState(
                  () {
                    _minValue = _convertDouble(values.start);
                    _maxValue = _convertDouble(values.end);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
