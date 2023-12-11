import 'package:flutter/material.dart';
import 'package:food_order_app/model/food/food_model.dart';
import 'package:food_order_app/presentation/primitive_widget/combo_row.dart';
import 'package:food_order_app/presentation/primitive_widget/rounded_image.dart';
import 'package:food_order_app/presentation/widgets/card_details_widgets/add_item_icon_button.dart';
import 'package:food_order_app/presentation/widgets/card_details_widgets/price_text.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/custom_sizes_helper.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/edge_insets_helper.dart';

class FoodDescriptionCard extends StatelessWidget {
  const FoodDescriptionCard({required this.food});

  final FoodModel food;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final double imageHeight = CustomSizeHelper.bigSize();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _titleAndPriceRow(context),
        RoundedImage(
          imageUrl: food.imageUrl,
          margin: EdgeInsetsHelper.verticalSmallEdgeInsets(),
          height: imageHeight,
        ),
        _descriptionAndIcon(),
      ],
    );
  }

  Widget _titleAndPriceRow(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return ComboRow(
      mainWidget: Text(
        food.name,
        style: textTheme.displaySmall,
        overflow: TextOverflow.ellipsis,
      ),
      secondaryWidget: PriceText(
        price: food.price,
      ),
    );
  }

  Widget _descriptionAndIcon() {
    return ComboRow(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainWidget: Text(
        food.description ?? "",
        overflow: TextOverflow.visible,
        maxLines: 4,
      ),
      secondaryWidget: AddItemIconButton(
        onChange: (bool value) {
          print(value);
        },
      ),
    );
  }
}
