import 'package:flutter/material.dart';

class TextBar extends StatelessWidget {
  const TextBar(
      {Key? key,
      required this.text,
      required this.showFullText,
      this.onLongPressed,
      this.onPressed})
      : super(key: key);

  final String text;
  final VoidCallback? onLongPressed;
  final VoidCallback? onPressed;
  final bool showFullText;
  final EdgeInsets paddding = const EdgeInsets.fromLTRB(20, 0, 0, 0);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: TextButton(
        style: ElevatedButton.styleFrom(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            padding: paddding,
            alignment: Alignment.centerLeft),
        onLongPress: onLongPressed,
        onPressed: onPressed,
        child: Text(
          text,
          overflow: TextOverflow.visible,
          maxLines: showFullText ? null : 2,
          style: theme.textTheme.bodyText1,
          textAlign: TextAlign.start,
        ),
      ),
    );
  }
}
