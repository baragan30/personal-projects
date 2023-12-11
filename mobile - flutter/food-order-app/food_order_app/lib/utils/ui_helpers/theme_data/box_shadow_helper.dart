import 'package:flutter/cupertino.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/color_helper.dart';

extension BoxShadowHelper on BoxShadow {
  static BoxShadow defaultCardShadow() {
    return const BoxShadow(
      color: ColorHelper.gray5Color,
      blurRadius: 10,
      offset: Offset(0, 0),
    );
  }
}
