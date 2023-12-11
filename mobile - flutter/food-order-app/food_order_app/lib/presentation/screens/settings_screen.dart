import 'package:flutter/material.dart';
import 'package:food_order_app/model/restaurant/extensions/restaurant_mock_data.dart';
import 'package:food_order_app/presentation/widgets/avatar_image_widget.dart';
import 'package:food_order_app/presentation/widgets/nav_bars/navigation_icon_button.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/color_helper.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/custom_sizes_helper.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/edge_insets_helper.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/gradient_helper.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  List<Color> gradientColors = <Color>[
    Colors.red,
    Colors.blue,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Welcome back, Luis!",
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: NavigationIconButton.backButton(
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          _backgroundWidget(),
          _body(),
        ],
      ),
    );
  }

  Widget _body() {
    return SafeArea(
      bottom: false,
      child: Column(
        children: <Widget>[
          _userInfoWidget(),
          _userOptionsWidget(),
        ],
      ),
    );
  }

  Widget _userInfoWidget() {
    Widget rowElement(
        {required String value,
        required String description,
        bool isHighlited = false}) {
      return Column(
        children: <Widget>[
          Container(
            margin:
                EdgeInsets.only(bottom: CustomSizeHelper.defaultOffset() / 2),
            child: Text(
              value,
              style: TextStyle(
                fontWeight: isHighlited == true ? FontWeight.w600 : null,
              ),
            ),
          ),
          Text(
            description,
            style: TextStyle(
              fontWeight: isHighlited == true ? FontWeight.w600 : null,
            ),
          ),
        ],
      );
    }

    return Column(
      children: <Widget>[
        AvatarImageWidget(
          imageURL: kRestaurantImageUrls[20],
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: CustomSizeHelper.defaultOffset() * 1.5,
            horizontal: CustomSizeHelper.defaultOffset() * 3,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              rowElement(value: "79", description: "Orders"),
              rowElement(
                value: "28k",
                description: "Points",
                isHighlited: true,
              ),
              rowElement(value: "134", description: "Reviews"),
            ],
          ),
        )
      ],
    );
  }

  Widget _userOptionsWidget() {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
          color: ColorHelper.gray3Color,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _sectionWidget(
              title: "Your offers",
              children: <Widget>[
                _cellWidget(title: "Orders"),
                _cellWidget(title: "Favorite Restaurants"),
              ],
            ),
            _sectionWidget(
              title: "Information",
              children: <Widget>[
                _cellWidget(title: "Personal Details"),
                _cellWidget(title: "Settings"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _cellWidget({
    required String title,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: CustomSizeHelper.defaultOffset() * 2,
        vertical: CustomSizeHelper.defaultOffset(),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            // style: TextStyleSettingsProvider.cellTitleStyle(),
          ),
          Icon(
            Icons.chevron_right,
          ),
        ],
      ),
    );
  }

  Widget _sectionWidget(
      {required String title, required List<Widget> children}) {
    List<Widget> cells = <Widget>[];
    for (final Widget widget in children) {
      cells.add(widget);
      if (widget != children.last) {
        cells.add(Divider(
          height: 1,
        ));
      }
    }

    return Container(
      padding: EdgeInsetsHelper.allDefaultEdgeInsets(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            title,
            // style: TextStyleSettingsProvider.sectionHeaderStyle(),
          ),
          Container(
            // margin:
            //     EdgeInsets.symmetric(vertical: CustomSizes.defaultOffset() / 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: ColorHelper.white,
              border: Border.all(
                color: ColorHelper.gray1Color,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: cells,
            ),
          ),
        ],
      ),
    );
  }

  Widget _backgroundWidget() {
    return Container(
      decoration: BoxDecoration(
        gradient: GradientHelper.settingsGradient(),
      ),
    );
  }
}
