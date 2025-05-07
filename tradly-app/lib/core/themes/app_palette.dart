import 'package:flutter/material.dart';

class TAPalette {
  static const MaterialColor green = MaterialColor(
    0xFF33907C,
    <int, Color>{
      50: Color(0xFFE6F4F1),
      100: Color(0xFFCCE9E3),
      200: Color(0xFF99D3C7),
      300: Color(0xFF66BDAA),
      400: Color(0xFF33A78E),
      500: Color(0xFF33907C), // Primary green
      600: Color(0xFF2E826F),
      700: Color(0xFF297462),
      800: Color(0xFF246655),
      900: Color(0xFF1F5848),
    },
  );
  static const MaterialColor red = MaterialColor(
    0xFFFF7272,
    <int, Color>{
      50: Color(0xFFFFEBEE),
      100: Color(0xFFFFCDD2),
      200: Color(0xFFEF9A9A),
      300: Color(0xFFE57373),
      400: Color(0xFFEF5350),
      600: Color(0xFFE53935),
      700: Color(0xFFD32F2F),
      800: Color(0xFFC62828),
      900: Color(0xFFB71C1C),
    },
  );
  static const MaterialColor grey = MaterialColor(
    0xFF4F4F4F,
    <int, Color>{
      0: Color(0xFFC4C4C4),
      1: Color(0xFFBDBDBD),
      2: Color(0xFFB0B0B0),
      3: Color(0xFF9E9E9E),
      4: Color(0xFF757575),
      5: Color(0xFF4F4F4F),
      6: Color(0x00f6f9ff),
      7: Color(0xFF212121),
    },
  );

  // Additional colors
  static const Color genericWhite = Color(0xFFFFFFFF);
  static const Color genericBlack = Color(0xFF000000);
  static const Color primaryRed = Color(0xFFCC0000);
  static const Color greyLight = Color(0xFFE0E0E0);
  static const Color greyMedium = Color(0xFFF6F9FF);
  static const Color greyDark = Color(0xFFC4C4C4);
  static const Color greyDarkest = Color(0x0f4f4f4f);
}
