import 'package:flutter/material.dart';
import 'package:food_order_app/utils/ui_helpers/theme_data/edge_insets_helper.dart';

import 'headered_viewer.dart';

class VerticalSection extends HeaderedViewer {
  VerticalSection({
    required super.title,
    super.titleTextStyle,
    super.onTitleTap,
    super.headerPadding,
    List<Widget> children = const [],
    EdgeInsets? listViewPadding,
    double childSpacing = 0,
  }) : super(
          child: (children.isNotEmpty)
              ? Padding(
                  padding: listViewPadding ??
                      EdgeInsetsHelper.horizontalDefaultEdgeInsets(),
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: children.length,
                      itemBuilder: (_, int index) {
                        return Padding(
                            padding: EdgeInsets.only(bottom: childSpacing),
                            child: children[index]);
                      }),
                )
              : null,
        );
}
