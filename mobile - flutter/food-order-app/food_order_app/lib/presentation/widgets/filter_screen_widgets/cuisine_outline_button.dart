import 'package:flutter/material.dart';
import 'package:food_order_app/model/types/cuisine_type.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/edge_insets_helper.dart';

class CuisineOutlineButton extends StatelessWidget {
  const CuisineOutlineButton({
    required this.cuisine,
    required this.onPressed,
    this.isActive = false,
  });

  final CuisineType cuisine;
  final VoidCallback onPressed;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final Color activeColor = Theme.of(context).colorScheme.secondary;
    return Padding(
      padding: EdgeInsetsHelper.rightVerySmallEdgeInsets(),
      child: OutlinedButton(
        onPressed: onPressed,
        style: isActive
            ? OutlinedButton.styleFrom(
                foregroundColor: activeColor,
                side: BorderSide(
                  color: activeColor,
                ),
              )
            : null,
        child: Text(cuisine.title()),
      ),
    );
  }
}
