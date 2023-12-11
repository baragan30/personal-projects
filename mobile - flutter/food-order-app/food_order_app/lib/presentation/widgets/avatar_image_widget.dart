import 'package:flutter/material.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/color_helper.dart';

class AvatarImageWidget extends StatelessWidget {
  final String imageURL;
  final double imageSize;

  AvatarImageWidget({
    required this.imageURL,
    this.imageSize = 120,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: imageSize,
      height: imageSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: ColorHelper.white,
        ),
        image: DecorationImage(
          image: NetworkImage(imageURL),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
