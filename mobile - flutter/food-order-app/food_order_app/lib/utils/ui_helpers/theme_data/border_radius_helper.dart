import 'package:flutter/material.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/custom_sizes_helper.dart';

extension BorderRadiusHelper on BorderRadius {
  static BorderRadius defaultTopCircleBorderRadius() {
    return BorderRadius.vertical(
      bottom: Radius.zero,
      top: Radius.circular(CustomSizeHelper.defaultOffset()),
    );
  }

  static BorderRadius smallCircleBorderRadius() {
    return BorderRadius.circular(CustomSizeHelper.smallOffset());
  }

  static BorderRadius defaultCircleBorderRadius() {
    return BorderRadius.circular(CustomSizeHelper.defaultOffset());
  }

  static BorderRadius bigCircleBorderRadius() {
    return BorderRadius.circular(CustomSizeHelper.bigOffset());
  }

  static BorderRadius veryBigCircleBorderRadius() {
    return BorderRadius.circular(CustomSizeHelper.veryBigOffset());
  }
}
