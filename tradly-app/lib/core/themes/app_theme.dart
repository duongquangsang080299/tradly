import 'package:flutter/material.dart';
import 'package:tradly_app/core/themes/app_colors.dart';
import 'package:tradly_app/core/themes/app_palette.dart';
import 'package:tradly_app/core/themes/typography.dart';

class TATheme {
  static ThemeData get light {
    final defaultTheme = ThemeData.light(
      useMaterial3: true,
    );

    return defaultTheme.copyWith(
      colorScheme: TAColors.light,
      brightness: Brightness.light,

      /// AppBar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: TAColors.light.primary,
        foregroundColor: TAColors.light.onPrimary,
        elevation: 0,
      ),

      /// Divider Theme
      dividerTheme: DividerThemeData(
        color: TAColors.light.outline,
        thickness: 1,
      ),

      /// Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: TAColors.light.surface,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: TAColors.light.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: TAColors.light.primary),
        ),
      ),

      /// Icon Theme
      iconTheme: IconThemeData(
        color: TAColors.light.onSurface,
      ),

      /// Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: TAColors.light.primary,
          foregroundColor: TAColors.light.onPrimary,
        ),
      ),

      /// Text Theme
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: TATypography.fontSizeDisplayLarge,
          fontFamily: TATypography.familyMontserrat,
        ),
        displayMedium: TextStyle(
          fontSize: TATypography.fontSizeDisplayMedium,
          fontFamily: TATypography.familyMontserrat,
        ),
        displaySmall: TextStyle(
          fontSize: TATypography.fontSizeDisplaySmall,
          fontFamily: TATypography.familyMontserrat,
          fontWeight: FontWeight.w500,
          color: TAPalette.genericWhite,
        ),
        headlineLarge: TextStyle(
          fontSize: TATypography.fontSizeHeadlineLarge,
          fontFamily: TATypography.familyMontserrat,
        ),
        headlineMedium: TextStyle(
          fontSize: TATypography.fontSizeHeadlineMedium,
          fontFamily: TATypography.familyMontserrat,
        ),
        headlineSmall: TextStyle(
          fontSize: TATypography.fontSizeHeadlineSmall,
          fontFamily: TATypography.familyMontserrat,
        ),
        titleLarge: TextStyle(
          fontSize: TATypography.fontSizeTitleLarge,
          fontFamily: TATypography.familyMontserrat,
        ),
        titleMedium: TextStyle(
          fontSize: TATypography.fontSizeTitleMedium,
          fontFamily: TATypography.familyMontserrat,
        ),
        titleSmall: TextStyle(
          fontSize: TATypography.fontSizeTitleSmall,
          fontFamily: TATypography.familyMontserrat,
        ),
        labelLarge: TextStyle(
          fontSize: TATypography.fontSizeLabelLarge,
          fontFamily: TATypography.familyMontserrat,
        ),
      ),
    );
  }

  static ThemeData get dark {
    final defaultTheme = ThemeData.dark(
      useMaterial3: true,
    );

    return defaultTheme.copyWith(
      colorScheme: TAColors.dark,
      brightness: Brightness.dark,

      /// AppBar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: TAColors.dark.primary,
        foregroundColor: TAColors.dark.onPrimary,
        elevation: 0,
      ),

      /// Divider Theme
      dividerTheme: DividerThemeData(
        color: TAColors.dark.outline,
        thickness: 1,
      ),

      /// Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: TAColors.dark.surface,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: TAColors.dark.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: TAColors.dark.primary),
        ),
      ),

      /// Icon Theme
      iconTheme: IconThemeData(
        color: TAColors.dark.onSurface,
      ),

      /// Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: TAColors.dark.primary,
          foregroundColor: TAColors.dark.onPrimary,
        ),
      ),

      /// Text Theme
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: TATypography.fontSizeDisplayLarge,
          fontFamily: TATypography.familyMontserrat,
        ),
        displayMedium: TextStyle(
          fontSize: TATypography.fontSizeDisplayMedium,
          fontFamily: TATypography.familyMontserrat,
        ),
        displaySmall: TextStyle(
          fontSize: TATypography.fontSizeDisplaySmall,
          fontFamily: TATypography.familyMontserrat,
          fontWeight: FontWeight.w500,
          color: TAPalette.genericWhite,
        ),
        headlineLarge: TextStyle(
          fontSize: TATypography.fontSizeHeadlineLarge,
          fontFamily: TATypography.familyMontserrat,
        ),
        headlineMedium: TextStyle(
          fontSize: TATypography.fontSizeHeadlineMedium,
          fontFamily: TATypography.familyMontserrat,
        ),
        headlineSmall: TextStyle(
          fontSize: TATypography.fontSizeHeadlineSmall,
          fontFamily: TATypography.familyMontserrat,
        ),
        titleLarge: TextStyle(
          fontSize: TATypography.fontSizeTitleLarge,
          fontFamily: TATypography.familyMontserrat,
        ),
        titleMedium: TextStyle(
          fontSize: TATypography.fontSizeTitleMedium,
          fontFamily: TATypography.familyMontserrat,
        ),
        titleSmall: TextStyle(
          fontSize: TATypography.fontSizeTitleSmall,
          fontFamily: TATypography.familyMontserrat,
        ),
        labelLarge: TextStyle(
          fontSize: TATypography.fontSizeLabelLarge,
          fontFamily: TATypography.familyMontserrat,
        ),
      ),
    );
  }
}
