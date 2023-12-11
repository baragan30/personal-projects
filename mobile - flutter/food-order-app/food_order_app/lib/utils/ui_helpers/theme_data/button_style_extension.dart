import 'package:flutter/material.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/edge_insets_helper.dart';

import 'border_radius_helper.dart';
import 'color_helper.dart';

extension ButtonStyleHelper on ButtonStyle {
  static ButtonStyle roundedElevatedButtonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: ColorHelper.pink5Color,
      padding: EdgeInsetsHelper.mostlyHorizontalDefaultEdgeInsets(),
      textStyle: const TextStyle(
        color: ColorHelper.pink2Color,
        fontSize: 20,
        fontWeight: FontWeight.w500,
        height: 1.3,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusHelper.veryBigCircleBorderRadius(),
      ),
    );
  }

  static ButtonStyle lessRoundedElevatedButtonStyle() {
    return roundedElevatedButtonStyle().copyWith(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadiusHelper.smallCircleBorderRadius(),
        ),
      ),
    );
  }
}
