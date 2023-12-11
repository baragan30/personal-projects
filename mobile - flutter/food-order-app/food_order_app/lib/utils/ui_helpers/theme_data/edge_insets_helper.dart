import 'package:flutter/material.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/custom_sizes_helper.dart';

extension EdgeInsetsHelper on EdgeInsets {
  ///All
  static EdgeInsets allThinEdgeInsets() {
    return EdgeInsets.all(
      CustomSizeHelper.thinOffset(),
    );
  }

  static EdgeInsets allUltraSmallEdgeInsets() {
    return EdgeInsets.all(
      CustomSizeHelper.ultraSmallOffset(),
    );
  }

  static EdgeInsets allVerySmallEdgeInsets() {
    return EdgeInsets.all(
      CustomSizeHelper.verySmallOffset(),
    );
  }

  static EdgeInsets allSmallEdgeInsets() {
    return EdgeInsets.all(
      CustomSizeHelper.smallOffset(),
    );
  }

  static EdgeInsets allDefaultEdgeInsets() {
    return EdgeInsets.all(
      CustomSizeHelper.defaultOffset(),
    );
  }

  ///Vertical

  static EdgeInsets verticalThinEdgeInsets() {
    return EdgeInsets.symmetric(
      horizontal: 0,
      vertical: CustomSizeHelper.thinOffset(),
    );
  }

  static EdgeInsets verticalUltraSmallEdgeInsets() {
    return EdgeInsets.symmetric(
      horizontal: 0,
      vertical: CustomSizeHelper.ultraSmallOffset(),
    );
  }

  static EdgeInsets verticalVerySmallEdgeInsets() {
    return EdgeInsets.symmetric(
      horizontal: 0,
      vertical: CustomSizeHelper.verySmallOffset(),
    );
  }

  static EdgeInsets verticalSmallEdgeInsets() {
    return EdgeInsets.symmetric(
      horizontal: 0,
      vertical: CustomSizeHelper.smallOffset(),
    );
  }

  static EdgeInsets verticalDefaultEdgeInsets() {
    return EdgeInsets.symmetric(
      horizontal: 0,
      vertical: CustomSizeHelper.defaultOffset(),
    );
  }

  static EdgeInsets verticalBigEdgeInsets() {
    return EdgeInsets.symmetric(
      horizontal: 0,
      vertical: CustomSizeHelper.bigOffset(),
    );
  }

  ///Mostly Vertical
  static EdgeInsets mostlyVerticalVerySmallEdgeInsets() {
    return EdgeInsets.symmetric(
      horizontal: CustomSizeHelper.thinOffset(),
      vertical: CustomSizeHelper.verySmallOffset(),
    );
  }

  static EdgeInsets mostlyVerticalSmallEdgeInsets() {
    return EdgeInsets.symmetric(
      horizontal: CustomSizeHelper.thinOffset(),
      vertical: CustomSizeHelper.smallOffset(),
    );
  }

  static EdgeInsets mostlyVerticalDefaultEdgeInsets() {
    return EdgeInsets.symmetric(
      horizontal: CustomSizeHelper.verySmallOffset(),
      vertical: CustomSizeHelper.defaultOffset(),
    );
  }

  static EdgeInsets mostlyVerticalBigEdgeInsets() {
    return EdgeInsets.symmetric(
      horizontal: CustomSizeHelper.verySmallOffset(),
      vertical: CustomSizeHelper.bigOffset(),
    );
  }

  ///Horizontal
  static EdgeInsets horizontalThinEdgeInsets() {
    return EdgeInsets.symmetric(
      horizontal: CustomSizeHelper.thinOffset(),
      vertical: 0,
    );
  }

  static EdgeInsets horizontalUltraSmallEdgeInsets() {
    return EdgeInsets.symmetric(
      horizontal: CustomSizeHelper.ultraSmallOffset(),
      vertical: 0,
    );
  }

  static EdgeInsets horizontalVerySmallEdgeInsets() {
    return EdgeInsets.symmetric(
      horizontal: CustomSizeHelper.verySmallOffset(),
      vertical: 0,
    );
  }

  static EdgeInsets horizontalSmallEdgeInsets() {
    return EdgeInsets.symmetric(
      horizontal: CustomSizeHelper.smallOffset(),
      vertical: 0,
    );
  }

  static EdgeInsets horizontalDefaultEdgeInsets() {
    return EdgeInsets.symmetric(
      horizontal: CustomSizeHelper.defaultOffset(),
      vertical: 0,
    );
  }

  ///Mostly Horizontal
  static EdgeInsets mostlyHorizontalVerySmallEdgeInsets() {
    return EdgeInsets.symmetric(
      horizontal: CustomSizeHelper.verySmallOffset(),
      vertical: CustomSizeHelper.thinOffset(),
    );
  }

  static EdgeInsets mostlyHorizontalDefaultEdgeInsets() {
    return EdgeInsets.symmetric(
      horizontal: CustomSizeHelper.defaultOffset(),
      vertical: CustomSizeHelper.verySmallOffset(),
    );
  }

  static EdgeInsets mostlyHorizontalBigEdgeInsets() {
    return EdgeInsets.symmetric(
      horizontal: CustomSizeHelper.bigOffset(),
      vertical: CustomSizeHelper.defaultOffset(),
    );
  }

  ///Left
  static EdgeInsets leftSmallEdgeInsets() {
    return EdgeInsets.only(
      left: CustomSizeHelper.smallOffset(),
    );
  }

  static EdgeInsets leftDefaultEdgeInsets() {
    return EdgeInsets.only(
      left: CustomSizeHelper.defaultOffset(),
    );
  }

  static EdgeInsets leftBigEdgeInsets() {
    return EdgeInsets.only(
      left: CustomSizeHelper.bigOffset(),
    );
  }

  ///Right
  static EdgeInsets rightVerySmallEdgeInsets() {
    return EdgeInsets.only(
      right: CustomSizeHelper.verySmallOffset(),
    );
  }

  static EdgeInsets rightSmallEdgeInsets() {
    return EdgeInsets.only(
      right: CustomSizeHelper.smallOffset(),
    );
  }

  static EdgeInsets rightDefaultEdgeInsets() {
    return EdgeInsets.only(
      right: CustomSizeHelper.defaultOffset(),
    );
  }

  static EdgeInsets rightBigEdgeInsets() {
    return EdgeInsets.only(
      right: CustomSizeHelper.bigOffset(),
    );
  }

  ///Top
  static EdgeInsets topVerySmallEdgeInsets() {
    return EdgeInsets.only(
      top: CustomSizeHelper.verySmallOffset(),
    );
  }

  static EdgeInsets topSmallEdgeInsets() {
    return EdgeInsets.only(
      top: CustomSizeHelper.smallOffset(),
    );
  }

  static EdgeInsets simpleDialogEdgeInsets() {
    return const EdgeInsets.all(24);
  }
}

// EdgeInsetsProvider.horizontalEdgeInsets();
