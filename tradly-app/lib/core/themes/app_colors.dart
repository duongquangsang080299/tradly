import 'package:flutter/material.dart';
import 'package:tradly_app/core/themes/app_palette.dart';

class TAColors {
  static ColorScheme dark = ColorScheme(
    brightness: Brightness.dark,
    primary: TAPalette.green[500]!,
    onPrimary: TAPalette.genericWhite,
    primaryContainer: TAPalette.green[300],
    onPrimaryContainer: TAPalette.grey[2],
    secondary: TAPalette.red[900]!,
    onSecondary: TAPalette.genericWhite,
    secondaryContainer: TAPalette.grey[5],
    onSecondaryContainer: TAPalette.grey[6],
    tertiary: TAPalette.green[500],
    onTertiary: TAPalette.genericWhite,
    tertiaryContainer: TAPalette.green[700],
    onTertiaryContainer: TAPalette.green[50],
    error: TAPalette.primaryRed,
    onError: TAPalette.genericWhite,
    surface: TAPalette.genericWhite,
    onSurface: TAPalette.genericWhite,
    onSurfaceVariant: TAPalette.grey[50],
    outline: TAPalette.grey[5],
    inverseSurface: TAPalette.genericBlack,
    onInverseSurface: TAPalette.genericWhite,
    inversePrimary: TAPalette.green[500],
  );

  static ColorScheme light = ColorScheme(
    brightness: Brightness.light,
    primary: TAPalette.green[500]!,
    onPrimary: TAPalette.genericWhite,
    primaryContainer: TAPalette.green[300],
    onPrimaryContainer: TAPalette.grey[2],
    secondary: TAPalette.red[900]!,
    onSecondary: TAPalette.grey[4]!,
    secondaryContainer: TAPalette.grey[100],
    onSecondaryContainer: TAPalette.grey[6],
    tertiary: TAPalette.green[500],
    onTertiary: TAPalette.genericWhite,
    tertiaryContainer: TAPalette.green[100],
    onTertiaryContainer: TAPalette.green[900],
    error: TAPalette.primaryRed,
    onError: TAPalette.genericWhite,
    surface: TAPalette.genericWhite,
    onSurface: TAPalette.genericBlack,
    onSurfaceVariant: TAPalette.grey[900],
    outline: TAPalette.grey[5],
    onInverseSurface: TAPalette.genericWhite,
    inversePrimary: TAPalette.greyMedium,
  );
}
