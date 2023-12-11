import 'package:flutter/material.dart';

class AddItemIconButton extends StatefulWidget {
  AddItemIconButton({this.isAdded = false, required this.onChange});

  bool isAdded;
  void Function(bool) onChange;

  @override
  State<AddItemIconButton> createState() => _AddItemIconButtonState();
}

class _AddItemIconButtonState extends State<AddItemIconButton> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          const CircleBorder(),
        ),
        padding: MaterialStateProperty.all(const EdgeInsets.all(5)),
        side: MaterialStateProperty.all(
          const BorderSide(
              color: Colors.blue, width: 2), // border color and width
        ),
      ),
      onPressed: () {
        setState(() {
          widget.isAdded = !widget.isAdded;
          widget.onChange(widget.isAdded);
        });
      },
      child: Icon(
        widget.isAdded ? Icons.check_circle : Icons.add_circle_outline_outlined,
        size: 24,
      ),
    );
  }
}
