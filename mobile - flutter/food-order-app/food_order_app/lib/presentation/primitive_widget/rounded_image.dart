import 'package:flutter/material.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/border_radius_helper.dart';

class RoundedImage extends Container {
  RoundedImage({
    required this.imageUrl,
    super.height,
    super.width,
    super.margin,
  }) : super(
          decoration: BoxDecoration(
            borderRadius: BorderRadiusHelper.smallCircleBorderRadius(),
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        );

  final String imageUrl;
}
