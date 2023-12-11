import 'package:flutter/material.dart';
import 'package:food_order_app/presentation/primitive_widget/headered_viewer.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/edge_insets_helper.dart';

class HorizontalSection extends HeaderedViewer {
  HorizontalSection({
    required super.title,
    super.titleTextStyle,
    super.onTitleTap,
    super.headerPadding,
    List<Widget> children = const [],
    EdgeInsets? listViewPadding,
    double childSpacing = 0,
  }) : super(
          child: (children.isNotEmpty)
              ? SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: listViewPadding ??
                        EdgeInsetsHelper.horizontalDefaultEdgeInsets(),
                    child: Row(
                      children: [
                        if (children.length > 1)
                          ...children.sublist(0, children.length - 1).map(
                            (Widget child) {
                              return Padding(
                                padding: EdgeInsets.only(right: childSpacing),
                                child: child,
                              );
                            },
                          ),
                        children[children.length - 1],
                      ],
                    ),
                  ),
                )
              : null,
        );
}
