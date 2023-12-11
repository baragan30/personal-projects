import 'package:flutter/material.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/border_radius_helper.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/custom_sizes_helper.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/edge_insets_helper.dart';

class FilterTopBarSection extends StatelessWidget {
  const FilterTopBarSection({required this.onReset, required this.onApply});

  final VoidCallback onApply;
  final VoidCallback onReset;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    const TextStyle buttonTextStyle = TextStyle(
      fontWeight: FontWeight.w600,
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsetsHelper.horizontalSmallEdgeInsets(),
          child: Container(
            width: CustomSizeHelper.smallSize(),
            height: CustomSizeHelper.ultraThinSize(),
            margin: EdgeInsetsHelper.allSmallEdgeInsets(),
            decoration: BoxDecoration(
              borderRadius: BorderRadiusHelper.smallCircleBorderRadius(),
              color: themeData.primaryColor,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsetsHelper.horizontalSmallEdgeInsets(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: onReset,
                child: const Text(
                  "Reset",
                  style: buttonTextStyle,
                ),
              ),
              Text(
                "Filters",
                style: textTheme.titleSmall,
              ),
              TextButton(
                onPressed: onApply,
                child: Text(
                  "Done",
                  style: buttonTextStyle.copyWith(
                      color: themeData.colorScheme.secondary),
                ),
              ),
            ],
          ),
        ),
        Divider(
          thickness: CustomSizeHelper.veryThinOffset(),
        ),
      ],
    );
  }
}
