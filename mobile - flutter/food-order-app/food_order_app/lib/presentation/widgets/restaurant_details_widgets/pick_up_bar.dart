import 'package:flutter/material.dart';
import 'package:food_order_app/utils/ui_helpers/sized_box_ui_helper.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/button_style_extension.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/color_helper.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/edge_insets_helper.dart';

class PickUpSection extends StatelessWidget {
  const PickUpSection({required this.onOrderNow});
  final VoidCallback onOrderNow;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorHelper.pink1Color,
      padding: EdgeInsetsHelper.allSmallEdgeInsets(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: _textColumn(context),
          ),
          SizedBoxUiHelper.ultraSmallSizedBox(),
          ElevatedButton(
            onPressed: onOrderNow,
            style: ButtonStyleHelper.lessRoundedElevatedButtonStyle(),
            child: const Text("Order Now"),
          ),
        ],
      ),
    );
  }

  Widget _textColumn(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "New! Try Pickup",
          overflow: TextOverflow.ellipsis,
          style: textTheme.bodyLarge?.copyWith(
            color: ColorHelper.pink2Color,
          ),
        ),
        Text(
          "Pickup on your time. Your order is ready when you are.",
          overflow: TextOverflow.visible,
          style: textTheme.bodyMedium?.copyWith(
            color: ColorHelper.darkBlueColor,
          ),
          maxLines: 3,
        ),
      ],
    );
  }
}
