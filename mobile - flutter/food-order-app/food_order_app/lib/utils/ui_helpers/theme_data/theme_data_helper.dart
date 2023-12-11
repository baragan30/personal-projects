import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/border_radius_helper.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/button_style_extension.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/pink_accent_text_theme.dart';

import 'color_helper.dart';
import 'custom_sizes_helper.dart';

extension ThemeDataHelper on ThemeData {
  static ThemeData pinkAccentThemeData() {
    const PinkAccentTextTheme textTheme = PinkAccentTextTheme();
    const Color backgroundColor = Colors.white;
    const Color primaryColor = ColorHelper.gray5Color;
    const Color primary2Color = ColorHelper.gray2Color;
    const Color secondaryColor = ColorHelper.pink2Color;

    return ThemeData(
      ///Colors
      colorScheme: ColorScheme.fromSwatch().copyWith(
        background: backgroundColor,
        primary: primaryColor,
        primaryContainer: primary2Color,
        secondary: secondaryColor,
        tertiary: ColorHelper.darkBlueColor,
      ),
      scaffoldBackgroundColor: backgroundColor,
      primaryColor: primaryColor,
      shadowColor: secondaryColor,
      //Bottoms Navigation Bars Background Color
      canvasColor: backgroundColor,

      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.zero,
        border: OutlineInputBorder(
          borderRadius: BorderRadiusHelper.bigCircleBorderRadius(),
          borderSide: const BorderSide(
            color: primaryColor,
          ),
        ),
      ),

      appBarTheme: AppBarTheme(
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        titleTextStyle: textTheme.titleSmall?.copyWith(
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        titleSpacing: CustomSizeHelper.defaultOffset(),
        actionsIconTheme: IconThemeData(
          color: ColorHelper.gray1Color,
          size: CustomSizeHelper.ultraSmallSize(),
        ),
        toolbarHeight: 60,
      ),

      ///Bottoms Navigation Bars
      bottomNavigationBarTheme: _bottomNavigationBarThemeData(),

      // iconButtonTheme: IconButtonThemeData(
      //   style: IconButton.styleFrom(
      //     backgroundColor: _pinkColor,
      //     focusColor: _pinkColor,
      //     foregroundColor: _pinkColor,
      //     padding: EdgeInsets.all(20),
      //     fixedSize: Size(20, 20),
      //   ),
      // ),

      sliderTheme: SliderThemeData(
        activeTrackColor: secondaryColor,
        thumbColor: secondaryColor,
        overlayColor: secondaryColor.withOpacity(0.2),
        inactiveTrackColor: ColorHelper.gray4Color,
        valueIndicatorColor: Colors.transparent,

        //sizes
        trackHeight: CustomSizeHelper.veryThinSize(),

        showValueIndicator: ShowValueIndicator.always,

        valueIndicatorTextStyle: textTheme.bodyMedium?.copyWith(
          color: ColorHelper.pink5Color,
        ),
        rangeValueIndicatorShape: const PaddleRangeSliderValueIndicatorShape(),

        rangeThumbShape: CustomThumbShape(
          enabledThumbRadius: CustomSizeHelper.thinSize(),
        ),
        overlayShape: RoundSliderOverlayShape(
          overlayRadius: CustomSizeHelper.ultraSmallSize(),
        ),
      ),

      ///Outlined Button
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: ColorHelper.gray4Color,
          textStyle: textTheme.labelMedium,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusHelper.bigCircleBorderRadius(),
          ),
          // change border color
          side: BorderSide(
            color: ColorHelper.gray4Color,
            width: CustomSizeHelper.veryThinOffset(),
          ),
        ),
      ),

      ///Elevated Button
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyleHelper.roundedElevatedButtonStyle(),
      ),

      ///Text Button
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: ColorHelper.darkBlueColor,
          textStyle: textTheme.bodyLarge,
        ),
      ),
      textTheme: textTheme,
    );
  }

  static BottomNavigationBarThemeData _bottomNavigationBarThemeData() {
    //Background color selected in theme data (canvasColor)
    const TextStyle textStyle = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
    );
    final IconThemeData iconThemeData = IconThemeData(
      size: CustomSizeHelper.ultraSmallSize(),
    );
    return BottomNavigationBarThemeData(
      selectedItemColor: ColorHelper.pink2Color,
      unselectedItemColor: ColorHelper.gray5Color,
      selectedLabelStyle: textStyle,
      unselectedLabelStyle: textStyle,
      selectedIconTheme: iconThemeData,
      unselectedIconTheme: iconThemeData,
      showUnselectedLabels: true,
    );
  }
}

class CustomThumbShape extends RoundRangeSliderThumbShape {
  CustomThumbShape({
    super.enabledThumbRadius,
    this.exteriorThumbColor = Colors.white,
    this.exteriorThumbRatio = 0.4,
    this.shadingSize = 2,
  });

  Color exteriorThumbColor;
  double exteriorThumbRatio;
  double shadingSize;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(16.0);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    bool isDiscrete = false,
    bool isEnabled = false,
    bool? isOnTop,
    required SliderThemeData sliderTheme,
    TextDirection? textDirection,
    Thumb? thumb,
    bool? isPressed,
  }) {
    assert(sliderTheme.showValueIndicator != null);
    assert(sliderTheme.overlappingShapeStrokeColor != null);
    final Canvas canvas = context.canvas;

    ///size of thumb
    final radius = enabledThumbRadius;

    ///get thumb color
    final Color thumbColor = sliderTheme.thumbColor ?? Colors.red;
    final thumbPaint = Paint()..color = thumbColor;

    ///Exterior thumb color
    final exteriorThumbPaint = Paint()
      ..color = exteriorThumbColor; // Thumb color
    ///ShadowColor
    final shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.3) // Shadow color
      ..maskFilter = const MaskFilter.blur(
        BlurStyle.normal,
        4,
      ); //

    ///Painting
    canvas.drawCircle(center, radius + shadingSize, shadowPaint);
    canvas.drawCircle(center, radius, exteriorThumbPaint);
    canvas.drawCircle(center, radius * (1 - exteriorThumbRatio), thumbPaint);
  }
}
