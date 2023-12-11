import 'package:flutter/material.dart';

import 'color_helper.dart';

class PinkAccentTextTheme extends TextTheme {
  const PinkAccentTextTheme()
      : super(
          titleLarge: const TextStyle(
            color: ColorHelper.darkBlueColor,
            fontSize: 42,
            fontWeight: FontWeight.w700,
          ),
          titleMedium: const TextStyle(
            color: ColorHelper.darkBlueColor,
            fontSize: 35,
            fontWeight: FontWeight.w700,
          ),
          titleSmall: const TextStyle(
            color: ColorHelper.darkBlueColor,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),

          headlineLarge: const TextStyle(
            color: ColorHelper.darkBlueColor,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          headlineMedium: const TextStyle(
            color: ColorHelper.gray4Color,
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
          headlineSmall: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.black,
            backgroundColor: Colors.transparent,
          ),

          //
          // /// Display text has pink color
          // displayLarge:  const TextStyle(
          //   color: _pinkColor,
          //   fontSize: 22,
          //   fontWeight: FontWeight.normal,
          // ),
          // displayMedium:  const TextStyle(
          //   color: _pinkColor,
          //   fontSize: 20,
          //   fontWeight: FontWeight.normal,
          // ),
          displayMedium: const TextStyle(
            color: ColorHelper.darkBlueColor,
            fontSize: 27,
            fontWeight: FontWeight.normal,
          ),
          displaySmall: const TextStyle(
            color: ColorHelper.darkBlueColor,
            fontSize: 22,
            fontWeight: FontWeight.normal,
          ),

          labelMedium: const TextStyle(
            fontSize: 18,
            color: ColorHelper.pink1Color,
            fontWeight: FontWeight.w600,
          ),

          labelSmall: const TextStyle(
            fontSize: 13,
            color: ColorHelper.pink1Color,
            fontWeight: FontWeight.w500,
          ),

          bodyLarge: const TextStyle(
            color: ColorHelper.gray5Color,
            fontSize: 20,
            fontWeight: FontWeight.normal,
            height: 1.3,
          ),

          bodyMedium: const TextStyle(
            color: ColorHelper.gray4Color,
            fontSize: 18,
            fontWeight: FontWeight.normal,
            height: 1.3,
          ),
          // bodySmall: const TextStyle(
          //   color: ColorHelperExtension.gray1Color,
          //   fontSize: 16,
          //   fontWeight: FontWeight.normal,
          // ),
        );
}
