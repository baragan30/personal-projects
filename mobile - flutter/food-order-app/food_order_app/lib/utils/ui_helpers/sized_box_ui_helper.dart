import 'package:flutter/material.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/custom_sizes_helper.dart';

extension SizedBoxUiHelper on SizedBox {
  static SizedBox ultraSmallSizedBox() => SizedBox(
        width: CustomSizeHelper.ultraSmallOffset(),
        height: CustomSizeHelper.ultraSmallOffset(),
      );
  static SizedBox verySmallSizedBox() => SizedBox(
        width: CustomSizeHelper.verySmallOffset(),
        height: CustomSizeHelper.verySmallOffset(),
      );
  static SizedBox smallSizedBox() => SizedBox(
        width: CustomSizeHelper.smallOffset(),
        height: CustomSizeHelper.smallOffset(),
      );

  static SizedBox defaultSizedBox() => SizedBox(
        width: CustomSizeHelper.defaultOffset(),
        height: CustomSizeHelper.defaultOffset(),
      );
  static SizedBox bigSizedBox() => SizedBox(
        width: CustomSizeHelper.bigOffset(),
        height: CustomSizeHelper.bigOffset(),
      );
  static SizedBox veryBigSizedBox() => SizedBox(
        width: CustomSizeHelper.veryBigOffset(),
        height: CustomSizeHelper.veryBigOffset(),
      );
}
