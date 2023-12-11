import 'package:flutter/material.dart';

class MyBox extends StatelessWidget {
  Widget child;
  double width;
  double height;
  MyBox({@required this.child, @required this.height, @required this.width});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: theme.accentColor.withOpacity(0.7),
      ),
      height: height,
      width: width,
      child: Center(child: child),
    );
  }
}
