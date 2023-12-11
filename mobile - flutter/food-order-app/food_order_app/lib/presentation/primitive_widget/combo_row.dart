import 'package:flutter/material.dart';
import 'package:food_order_app/utils/ui_helpers/sized_box_ui_helper.dart';

class ComboRow extends Row {
  ComboRow({
    required Widget mainWidget,
    Widget? secondaryWidget,
    super.crossAxisAlignment = CrossAxisAlignment.start,
    bool expanded = true,
  }) : super(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: expanded
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.start,
          children: [
            expanded ? Expanded(child: mainWidget) : mainWidget,
            if (secondaryWidget != null) ...[
              SizedBoxUiHelper.verySmallSizedBox(),
              secondaryWidget
            ]
          ],
        );
}
