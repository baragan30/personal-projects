import 'package:flutter/material.dart';
import 'package:food_order_app/presentation/primitive_widget/image_carousel.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/border_radius_helper.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/custom_sizes_helper.dart';

class CarouselScreen extends StatefulWidget {
  CarouselScreen({
    required this.imageUrls,
    this.backgroundColor,
    double? borderRadius,
  }) {
    this.borderRadius = borderRadius ?? CustomSizeHelper.smallOffset();
  }

  final List<String> imageUrls;
  final Color? backgroundColor;
  late final double borderRadius;

  @override
  CarouselScreenState<CarouselScreen> createState() =>
      CarouselScreenState<CarouselScreen>();
}

class CarouselScreenState<T extends CarouselScreen> extends State<T> {
  @override
  Widget build(BuildContext context) {
    final double pictureHeight = MediaQuery.of(context).size.height * 0.4;
    final double borderRadius = widget.borderRadius;
    final double childTopMargin = pictureHeight - borderRadius;
    final double sliderIndicatorBottomMargin =
        borderRadius + CustomSizeHelper.verySmallOffset();

    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: appBar(),
      extendBodyBehindAppBar: true,
      backgroundColor: widget.backgroundColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            ImageCarousel(
              imageUrls: widget.imageUrls,
              height: pictureHeight,
              indicatorBottomMargin: sliderIndicatorBottomMargin,
            ),
            Container(
              margin: EdgeInsets.only(top: childTopMargin),
              decoration: BoxDecoration(
                color: widget.backgroundColor ?? theme.scaffoldBackgroundColor,
                borderRadius: BorderRadiusHelper.defaultTopCircleBorderRadius(),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: borderRadius),
                child: child(),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget? child() {
    return null;
  }

  PreferredSizeWidget? appBar() {
    return null;
  }
}
