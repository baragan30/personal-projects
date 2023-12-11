import 'package:flutter/material.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/edge_insets_helper.dart';

class HeaderedViewer extends StatelessWidget {
  HeaderedViewer({
    required this.title,
    this.child,
    this.onTitleTap,
    this.titleTextStyle,
    EdgeInsets? headerPadding,
  }) {
    this.headerPadding =
        headerPadding ?? EdgeInsetsHelper.leftDefaultEdgeInsets();
  }
  final String title;
  final Widget? child;
  final TextStyle? titleTextStyle;
  final VoidCallback? onTitleTap;
  late final EdgeInsets headerPadding;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final TextTheme textTheme = themeData.textTheme;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: headerPadding,
          child: GestureDetector(
            onTap: onTitleTap,
            behavior: HitTestBehavior.deferToChild,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: titleTextStyle ?? textTheme.titleSmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (onTitleTap != null) ...[
                  Text(
                    "Show All",
                    style: textTheme.headlineLarge,
                  ),
                  const Icon(
                    Icons.keyboard_arrow_right,
                    size: 24,
                  ),
                ],
              ],
            ),
          ),
        ),
        if (child != null) child!
      ],
    );
  }
}
