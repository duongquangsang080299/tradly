import 'package:flutter/material.dart';
import 'package:tradly_app/core/themes/app_palette.dart';

class TaColors {
  static ColorScheme dark = ColorScheme(
    brightness: Brightness.dark,
    primary: TaPalette.green[500]!,
    onPrimary: TaPalette.genericWhite,
    primaryContainer: TaPalette.green[300],
    onPrimaryContainer: TaPalette.grey[2],
    secondary: TaPalette.red[900]!,
    onSecondary: TaPalette.genericWhite,
    secondaryContainer: TaPalette.grey[5],
    onSecondaryContainer: TaPalette.grey[6],
    tertiary: TaPalette.green[500],
    onTertiary: TaPalette.genericWhite,
    tertiaryContainer: TaPalette.green[700],
    onTertiaryContainer: TaPalette.green[50],
    error: TaPalette.primaryRed,
    onError: TaPalette.genericWhite,
    surface: TaPalette.genericWhite,
    onSurface: TaPalette.genericWhite,
    onSurfaceVariant: TaPalette.grey[50],
    outline: TaPalette.grey[5],
    inverseSurface: TaPalette.genericBlack,
    onInverseSurface: TaPalette.genericWhite,
    inversePrimary: TaPalette.green[500],
  );

  static ColorScheme light = ColorScheme(
    brightness: Brightness.light,
    primary: TaPalette.green[500]!,
    onPrimary: TaPalette.genericWhite,
    primaryContainer: TaPalette.green[300],
    onPrimaryContainer: TaPalette.grey[2],
    secondary: TaPalette.red[900]!,
    onSecondary: TaPalette.grey[4]!,
    secondaryContainer: TaPalette.grey[100],
    onSecondaryContainer: TaPalette.grey[6],
    tertiary: TaPalette.green[500],
    onTertiary: TaPalette.genericWhite,
    tertiaryContainer: TaPalette.green[100],
    onTertiaryContainer: TaPalette.green[900],
    error: TaPalette.primaryRed,
    onError: TaPalette.genericWhite,
    surface: TaPalette.genericWhite,
    onSurface: TaPalette.genericBlack,
    onSurfaceVariant: TaPalette.grey[900],
    outline: TaPalette.grey[5],
    onInverseSurface: TaPalette.genericWhite,
    inversePrimary: TaPalette.greyMedium,
  );
}
