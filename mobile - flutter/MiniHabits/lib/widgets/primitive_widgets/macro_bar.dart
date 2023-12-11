import 'package:flutter/material.dart';

class MacroBar extends StatelessWidget {
  final Widget child;
  final Widget? dropDownElement;
  final seeDopDownElement;
  const MacroBar(
      {Key? key,
      required this.child,
      this.dropDownElement,
      this.seeDopDownElement = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const double height = 55;
    return Column(
      children: [
        // -------- Domain Bar starts here ------------
        Container(
          height: height,
          clipBehavior: Clip.hardEdge,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: theme.colorScheme.primary,
          ),
          child: child,
        ),

        // ------------ Domain Bar stops here --------
        if (seeDopDownElement) dropDownElement!
      ],
    );
  }
}
