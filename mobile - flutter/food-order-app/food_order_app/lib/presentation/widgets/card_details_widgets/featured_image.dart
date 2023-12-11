import 'package:flutter/material.dart';
import 'package:food_order_app/model/featured/extensions/offers_model_list_extension.dart';
import 'package:food_order_app/model/featured/offers_model.dart';
import 'package:food_order_app/presentation/primitive_widget/rounded_image.dart';
import 'package:food_order_app/presentation/widgets/card_details_widgets/offer_cell.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/edge_insets_helper.dart';

class FeaturedImage extends StatelessWidget {
  FeaturedImage({
    required this.imageUrl,
    required this.offersList,
    this.maxOffers = 3,
    required this.height,
    this.width,
  });

  final List<OffersModel> offersList;
  final String imageUrl;
  final double height;
  final double? width;
  final int maxOffers;

  MainAxisAlignment _featuredMainAxisAlignment(int componentsNo) {
    if (componentsNo <= 1) {
      return MainAxisAlignment.end;
    }
    if (componentsNo == 2) {
      return MainAxisAlignment.spaceBetween;
    }
    return MainAxisAlignment.spaceAround;
  }

  Widget _getRightFeaturedColumn() {
    final List<OffersModel> displayedOffersList =
        offersList.mostImportantKOffers(k: maxOffers);
    return Positioned.fill(
      child: Padding(
        padding: EdgeInsetsHelper.allUltraSmallEdgeInsets(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment:
              _featuredMainAxisAlignment(displayedOffersList.length),
          children: displayedOffersList
              .map((OffersModel offer) => OfferCell(offer))
              .toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RoundedImage(
          imageUrl: imageUrl,
          height: height,
        ),
        _getRightFeaturedColumn(),
      ],
    );
  }
}
