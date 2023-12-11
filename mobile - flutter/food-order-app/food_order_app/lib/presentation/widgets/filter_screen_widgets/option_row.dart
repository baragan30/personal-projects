import 'package:flutter/material.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/custom_sizes_helper.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/edge_insets_helper.dart';

class OptionRow extends StatelessWidget {
  const OptionRow({
    required this.title,
    required this.onPressed,
    required this.isSelected,
  });

  final String title;
  final VoidCallback onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextStyle? textStyle = themeData.textTheme.displayMedium;
    final Color accentColor = themeData.colorScheme.secondary;

    return Column(
      children: [
        InkWell(
          onTap: onPressed,
          child: Padding(
            padding: EdgeInsetsHelper.horizontalSmallEdgeInsets(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title,
                    style: isSelected
                        ? textStyle?.copyWith(
                            color: accentColor,
                          )
                        : textStyle),
                if (isSelected)
                  Icon(
                    Icons.check,
                    color: accentColor,
                    size: CustomSizeHelper.ultraSmallSize(),
                    weight: 500,
                  ),
              ],
            ),
          ),
        ),
        Divider(
          thickness: CustomSizeHelper.veryThinOffset(),
        ),
      ],
    );
  }
}
