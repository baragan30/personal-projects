import 'package:flutter/cupertino.dart';

extension GradientHelper on Gradient {
  static settingsGradient() {
    return const LinearGradient(
      colors: <Color>[
        Color(0xFF6A00F4),
        Color(0xFFE100FF),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  }
}
