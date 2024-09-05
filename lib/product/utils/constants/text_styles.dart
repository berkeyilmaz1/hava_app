import 'package:flutter/material.dart';
/// TextStyles is a class that contains text styles used in the application.
final class TextStyles {
  TextStyles._();
  static const TextStyle textStyleM = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
    color: Colors.white,
    shadows: [Shadow(blurRadius: 1, color: Colors.black87)],
  );

  static const TextStyle textStyleL = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 28,
    color: Colors.white,
    shadows: [
      Shadow(blurRadius: 1, color: Colors.black87),
    ],
  );
}
