import 'package:flutter/material.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/custom_sizes_helper.dart';

class ImageCarousel extends StatefulWidget {
  ImageCarousel(
      {required this.imageUrls,
      this.width,
      double? height,
      double? indicatorBottomMargin}) {
    this.height = CustomSizeHelper.carouselImageHeight();
    this.indicatorBottomMargin =
        indicatorBottomMargin ?? CustomSizeHelper.smallOffset();
  }

  final double? width;
  late final double height;
  late final double indicatorBottomMargin;
  final List<String> imageUrls;

  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int _carouselIndex = 0;

  void _updateCarouselIndex(int index) {
    setState(() {
      _carouselIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double pictureHeight = MediaQuery.of(context).size.height * 0.4;
    final double sliderIndicatorDotSize = CustomSizeHelper.smallOffset();
    final double sliderIndicatorBottomMargin = widget.indicatorBottomMargin;
    final imagesNo = widget.imageUrls.length;

    final ThemeData theme = Theme.of(context);

    return SizedBox(
      height: pictureHeight,
      child: Stack(
        children: [
          /// Image
          PageView.builder(
            itemCount: imagesNo,
            pageSnapping: true,
            onPageChanged: _updateCarouselIndex,
            itemBuilder: (context, pagePosition) {
              return FittedBox(
                fit: BoxFit.cover,
                child: Image.network(
                  widget.imageUrls[pagePosition],
                ),
              );
            },
          ),

          /// Slider Indicator
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                imagesNo,
                (indexValue) => Container(
                  width: sliderIndicatorDotSize,
                  height: sliderIndicatorDotSize,
                  margin: EdgeInsets.symmetric(
                    vertical: sliderIndicatorBottomMargin,
                    horizontal: CustomSizeHelper.verySmallOffset(),
                  ),
                  decoration: BoxDecoration(
                    color: (_carouselIndex == indexValue)
                        ? theme.colorScheme.background
                        : theme.colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
