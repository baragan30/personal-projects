import 'package:flutter/material.dart';
import 'package:food_order_app/utils/ui_helpers/sized_box_ui_helper.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/border_radius_helper.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/color_helper.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/custom_sizes_helper.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/edge_insets_helper.dart';

class OrderCompleteDialog extends StatelessWidget {
  const OrderCompleteDialog({Key? key}) : super(key: key);
  static showOrderCompleteDialog({required BuildContext context}) {
    showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return const OrderCompleteDialog();
        });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;

    return SimpleDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusHelper.defaultCircleBorderRadius(),
      ),
      contentPadding: EdgeInsetsHelper.simpleDialogEdgeInsets(),
      children: <Widget>[
        Icon(
          Icons.check_circle_outline,
          size: CustomSizeHelper.bigSize(),
          color: ColorHelper.checkGreenColor,
        ),
        Text(
          'Your order is successfully.',
          style: textTheme.titleMedium,
          textAlign: TextAlign.center,
        ),
        Text(
          'You can track the delivery in the “Orders” section.',
          style: textTheme.bodyMedium?.copyWith(
            color: themeData.colorScheme.tertiary,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBoxUiHelper.veryBigSizedBox(),

        /// Options
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Track Order'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Got to orders',
            style: textTheme.bodyLarge?.copyWith(
              color: themeData.colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}
