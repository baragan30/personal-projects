import 'package:flutter/material.dart';
import 'package:food_order_app/model/featured/offers_model.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/border_radius_helper.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/edge_insets_helper.dart';

class OfferCell extends StatelessWidget {
  const OfferCell(this.offersModel);

  final OffersModel offersModel;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    TextTheme textTheme = themeData.textTheme;

    return Container(
      padding: EdgeInsetsHelper.allThinEdgeInsets(),
      decoration: BoxDecoration(
        borderRadius: BorderRadiusHelper.defaultCircleBorderRadius(),
        color: themeData.colorScheme.secondary,
      ),
      child: Text(
        offersModel.title,
        overflow: TextOverflow.ellipsis,
        style: textTheme.labelSmall,
      ),
    );
  }
}
