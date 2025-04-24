import 'package:flutter/material.dart';
import 'package:tradly_app/core/extensions/context_extensions.dart';
import 'package:tradly_app/core/utils/responsive.dart';

class TaText extends StatelessWidget {
  const TaText({
    required this.text,
    super.key,
    this.style,
    this.textAlign,
    this.maxLines,
  });

  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: maxLines,
      text,
      textAlign: textAlign,
      key: key,
      style: style,
    );
  }
}

class TaDisplayLargeText extends StatelessWidget {
  const TaDisplayLargeText({
    required this.text,
    super.key,
    this.color,
    this.textAlign,
    this.fontWeight,
    this.overflow,
  });

  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return TaText(
      text: text,
      textAlign: textAlign,
      style: context.textTheme.displayLarge?.copyWith(
        color: color,
        fontWeight: fontWeight,
        overflow: overflow,
        fontSize: TaResponsive.scale(
          context,
          defaultValue: context.textTheme.displayLarge?.fontSize ?? 30,
        ),
      ),
    );
  }
}

class TaDisplayMediumText extends StatelessWidget {
  const TaDisplayMediumText({
    required this.text,
    super.key,
    this.color,
    this.textAlign,
    this.fontWeight,
    this.overflow,
  });

  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return TaText(
      text: text,
      textAlign: textAlign,
      style: context.textTheme.displayMedium?.copyWith(
        color: color,
        overflow: overflow,
        fontWeight: fontWeight,
        fontSize: TaResponsive.scale(
          context,
          defaultValue: context.textTheme.displayMedium?.fontSize ?? 26,
        ),
      ),
    );
  }
}

class TaDisplaySmallText extends StatelessWidget {
  const TaDisplaySmallText({
    required this.text,
    super.key,
    this.color,
    this.textAlign,
    this.fontWeight,
    this.overflow,
  });

  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return TaText(
      text: text,
      textAlign: textAlign,
      style: context.textTheme.displaySmall?.copyWith(
        color: color,
        fontWeight: fontWeight,
        overflow: overflow,
        fontSize: TaResponsive.scale(
          context,
          defaultValue: context.textTheme.displaySmall?.fontSize ?? 24,
        ),
      ),
    );
  }
}

class TaHeadlineLargeText extends StatelessWidget {
  const TaHeadlineLargeText({
    required this.text,
    super.key,
    this.color,
    this.textAlign,
    this.fontWeight,
    this.overflow,
    this.letterSpacing,
  });

  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  final double? letterSpacing;

  @override
  Widget build(BuildContext context) {
    return TaText(
      text: text,
      textAlign: textAlign,
      style: context.textTheme.headlineLarge?.copyWith(
        color: color,
        overflow: overflow,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        fontSize: TaResponsive.scale(
          context,
          defaultValue: context.textTheme.headlineLarge?.fontSize ?? 20,
        ),
      ),
    );
  }
}

class TaHeadlineMediumText extends StatelessWidget {
  const TaHeadlineMediumText({
    required this.text,
    super.key,
    this.color,
    this.textAlign,
    this.fontWeight,
    this.overflow,
  });

  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return TaText(
      text: text,
      textAlign: textAlign,
      style: context.textTheme.headlineMedium?.copyWith(
        color: color,
        fontWeight: fontWeight,
        overflow: overflow,
        fontSize: TaResponsive.scale(
          context,
          defaultValue: context.textTheme.headlineMedium?.fontSize ?? 18,
        ),
      ),
    );
  }
}

class TaHeadlineSmallText extends StatelessWidget {
  const TaHeadlineSmallText({
    required this.text,
    super.key,
    this.color,
    this.textAlign,
    this.fontWeight,
    this.overflow,
    this.letterSpacing,
  });

  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  final double? letterSpacing;

  @override
  Widget build(BuildContext context) {
    return TaText(
      text: text,
      textAlign: textAlign,
      style: context.textTheme.headlineSmall?.copyWith(
        color: color,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        overflow: overflow,
        fontSize: TaResponsive.scale(
          context,
          defaultValue: context.textTheme.headlineSmall?.fontSize ?? 16,
        ),
      ),
    );
  }
}

class TaTitleLargeText extends StatelessWidget {
  const TaTitleLargeText({
    required this.text,
    super.key,
    this.color,
    this.textAlign,
    this.fontWeight,
    this.overflow,
    this.letterSpacing,
    this.height,
  });

  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  final double? letterSpacing;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return TaText(
      text: text,
      textAlign: textAlign,
      style: context.textTheme.titleLarge?.copyWith(
        color: color,
        overflow: overflow,
        fontWeight: fontWeight,
        height: height,
        letterSpacing: letterSpacing,
        fontSize: TaResponsive.scale(
          context,
          defaultValue: context.textTheme.titleLarge?.fontSize ?? 14,
        ),
      ),
    );
  }
}

class TaTitleMediumText extends StatelessWidget {
  const TaTitleMediumText({
    required this.text,
    super.key,
    this.color,
    this.textAlign,
    this.fontWeight,
    this.overflow,
    this.letterSpacing,
    this.height,
  });

  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  final double? letterSpacing;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return TaText(
      text: text,
      textAlign: textAlign,
      style: context.textTheme.titleMedium?.copyWith(
        color: color,
        overflow: overflow,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        height: height,
        fontSize: TaResponsive.scale(
          context,
          defaultValue: context.textTheme.titleMedium?.fontSize ?? 12,
        ),
      ),
    );
  }
}

class TaTitleSmallText extends StatelessWidget {
  const TaTitleSmallText({
    required this.text,
    super.key,
    this.color,
    this.textAlign,
    this.fontWeight,
    this.overflow,
    this.letterSpacing,
    this.maxLines,
  });

  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  final double? letterSpacing;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TaText(
      text: text,
      textAlign: textAlign,
      maxLines: maxLines,
      style: context.textTheme.titleSmall?.copyWith(
        color: color,
        overflow: overflow,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        fontSize: TaResponsive.scale(
          context,
          defaultValue: context.textTheme.titleSmall?.fontSize ?? 11,
        ),
      ),
    );
  }
}

class TaLabelLargeText extends StatelessWidget {
  const TaLabelLargeText({
    required this.text,
    super.key,
    this.color,
    this.textAlign,
    this.fontWeight,
    this.overflow,
    this.letterSpacing,
    this.height,
    this.maxLines,
  });

  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  final double? letterSpacing;
  final double? height;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return TaText(
      text: text,
      textAlign: textAlign,
      style: context.textTheme.labelLarge?.copyWith(
        color: color,
        leadingDistribution: TextLeadingDistribution.even,
        fontWeight: fontWeight ?? FontWeight.bold,
        overflow: overflow,
        letterSpacing: letterSpacing,
        height: height,
        fontSize: TaResponsive.scale(
          context,
          defaultValue: context.textTheme.labelLarge?.fontSize ?? 10,
        ),
      ),
      maxLines: maxLines,
    );
  }
}
