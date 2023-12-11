import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  ///Simple rounded container with specific height
  RoundedContainer({required this.child, Key? key}) : super(key: key);

  //The height of the container
  //the child of the container
  Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.primary,
      ),
      child: child,
    );
  }
}
