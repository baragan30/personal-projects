import 'package:flutter/material.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/edge_insets_helper.dart';

class FormButton extends StatelessWidget {
  const FormButton({
    required this.onPressed,
    required this.title,
  });

  final VoidCallback onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsetsHelper.allSmallEdgeInsets(),
      ),
      child: Text(title),
    );
  }
}
