import 'package:flutter/material.dart';

class CheckButton extends StatefulWidget {
  //Simple circle Check Box
  bool isChecked;
  double raze;
  VoidCallback func;
  CheckButton({required this.isChecked, this.raze = 38, required this.func});

  @override
  _CheckButtonState createState() => _CheckButtonState();
}

class _CheckButtonState extends State<CheckButton> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return IconButton(
      icon: const Icon(Icons.check_circle),
      iconSize: widget.raze,
      onPressed: () {
        setState(() {
          widget.isChecked = !widget.isChecked;
        });
        widget.func();
      },
      color: widget.isChecked
          ? theme.colorScheme.secondary
          : theme.colorScheme.tertiary,
    );
  }
}
