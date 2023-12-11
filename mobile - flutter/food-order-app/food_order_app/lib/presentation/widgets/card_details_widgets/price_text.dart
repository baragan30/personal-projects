import 'package:flutter/material.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/color_helper.dart';

class PriceText extends StatelessWidget {
  const PriceText({required this.price, this.fontSize});

  final double price;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      "\$ ${price.toStringAsFixed(2)}",
      style: TextStyle(
        color: ColorHelper.pink2Color,
        fontSize: fontSize,
      ),
    );
  }
}
