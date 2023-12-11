import 'package:flutter/material.dart';
import 'package:food_order_app/model/restaurant/restaurant_model.dart';
import 'package:food_order_app/presentation/primitive_widget/combo_row.dart';

class TitleAndPriceRow extends ComboRow {
  TitleAndPriceRow({
    required RestaurantModel restaurant,
    TextStyle? textStyle,
  }) : super(
          mainWidget: Text(
            restaurant.name,
            style: textStyle,
            overflow: TextOverflow.ellipsis,
          ),
          secondaryWidget: restaurant.priceRange != null
              ? Text(
                  getDollarSigns(restaurant.priceRange?.index),
                  style: textStyle,
                )
              : null,
        );
  static String getDollarSigns(int? count) {
    String result = '';
    if (count != null) {
      for (int i = 0; i < count; i++) {
        result += '\$';
      }
    }
    return result;
  }
}
