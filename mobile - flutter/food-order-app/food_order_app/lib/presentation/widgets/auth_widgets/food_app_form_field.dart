import 'package:flutter/material.dart';
import 'package:food_order_app/utils/ui_helpers/form_field_type_utils.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/border_radius_helper.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/edge_insets_helper.dart';

class FoodAppFormField extends TextFormField {
  FoodAppFormField({
    super.key,
    required TextFiledType textFiledType,
    required super.controller,
    required ThemeData themeData,
  }) : super(
          autocorrect: false,
          style: themeData.textTheme.bodyLarge,
          textCapitalization: TextCapitalization.none,
          enableSuggestions: false,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: controller?.text == "" ? textFiledType.labelName() : null,
            hintStyle: themeData.textTheme.bodyLarge,
            fillColor: themeData.colorScheme.primaryContainer,
            filled: true,
            contentPadding: EdgeInsetsHelper.allDefaultEdgeInsets(),
            border: OutlineInputBorder(
              borderRadius: BorderRadiusHelper.veryBigCircleBorderRadius(),
              borderSide: BorderSide.none,
            ),
          ),
          obscureText: textFiledType.isPassword(),
          validator: textFiledType.validate,
        );
}
