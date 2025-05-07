import 'package:flutter/material.dart';
import 'package:tradly_app/core/extensions/context_extensions.dart';
import 'package:tradly_app/core/utils/responsive.dart';

class TAText extends StatelessWidget {
  const TAText({
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
    return Semantics(
      child: Text(
        maxLines: maxLines,
        text,
        textAlign: textAlign,
        key: key,
        style: style,
      ),
    );
  }
}

class TADisplayLargeText extends StatelessWidget {
  const TADisplayLargeText({
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
    return TAText(
      text: text,
      textAlign: textAlign,
      style: context.textTheme.displayLarge?.copyWith(
        color: color,
        fontWeight: fontWeight,
        overflow: overflow,
        fontSize: TAResponsive.scale(
          context,
          defaultValue: context.textTheme.displayLarge?.fontSize ?? 30,
        ),
      ),
    );
  }
}

class TADisplayMediumText extends StatelessWidget {
  const TADisplayMediumText({
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
    return TAText(
      text: text,
      textAlign: textAlign,
      style: context.textTheme.displayMedium?.copyWith(
        color: color,
        overflow: overflow,
        fontWeight: fontWeight,
        fontSize: TAResponsive.scale(
          context,
          defaultValue: context.textTheme.displayMedium?.fontSize ?? 26,
        ),
      ),
    );
  }
}

class TADisplaySmallText extends StatelessWidget {
  const TADisplaySmallText({
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
    return TAText(
      text: text,
      textAlign: textAlign,
      style: context.textTheme.displaySmall?.copyWith(
        color: color,
        fontWeight: fontWeight,
        overflow: overflow,
        fontSize: TAResponsive.scale(
          context,
          defaultValue: context.textTheme.displaySmall?.fontSize ?? 24,
        ),
      ),
    );
  }
}

class TAHeadlineLargeText extends StatelessWidget {
  const TAHeadlineLargeText({
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
    return TAText(
      text: text,
      textAlign: textAlign,
      style: context.textTheme.headlineLarge?.copyWith(
        color: color,
        overflow: overflow,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        fontSize: TAResponsive.scale(
          context,
          defaultValue: context.textTheme.headlineLarge?.fontSize ?? 20,
        ),
      ),
    );
  }
}

class TAHeadlineMediumText extends StatelessWidget {
  const TAHeadlineMediumText({
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
    return TAText(
      text: text,
      textAlign: textAlign,
      style: context.textTheme.headlineMedium?.copyWith(
        color: color,
        fontWeight: fontWeight,
        overflow: overflow,
        fontSize: TAResponsive.scale(
          context,
          defaultValue: context.textTheme.headlineMedium?.fontSize ?? 18,
        ),
      ),
    );
  }
}

class TAHeadlineSmallText extends StatelessWidget {
  const TAHeadlineSmallText({
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
    return TAText(
      text: text,
      textAlign: textAlign,
      style: context.textTheme.headlineSmall?.copyWith(
        color: color,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        overflow: overflow,
        fontSize: TAResponsive.scale(
          context,
          defaultValue: context.textTheme.headlineSmall?.fontSize ?? 16,
        ),
      ),
    );
  }
}

class TATitleLargeText extends StatelessWidget {
  const TATitleLargeText({
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
    return TAText(
      text: text,
      textAlign: textAlign,
      style: context.textTheme.titleLarge?.copyWith(
        color: color,
        overflow: overflow,
        fontWeight: fontWeight,
        height: height,
        letterSpacing: letterSpacing,
        fontSize: TAResponsive.scale(
          context,
          defaultValue: context.textTheme.titleLarge?.fontSize ?? 14,
        ),
      ),
    );
  }
}

class TATitleMediumText extends StatelessWidget {
  const TATitleMediumText({
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
    return TAText(
      text: text,
      textAlign: textAlign,
      style: context.textTheme.titleMedium?.copyWith(
        color: color,
        overflow: overflow,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        height: height,
        fontSize: TAResponsive.scale(
          context,
          defaultValue: context.textTheme.titleMedium?.fontSize ?? 12,
        ),
      ),
    );
  }
}

class TATitleSmallText extends StatelessWidget {
  const TATitleSmallText({
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
    return TAText(
      text: text,
      textAlign: textAlign,
      maxLines: maxLines,
      style: context.textTheme.titleSmall?.copyWith(
        color: color,
        overflow: overflow,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        fontSize: TAResponsive.scale(
          context,
          defaultValue: context.textTheme.titleSmall?.fontSize ?? 11,
        ),
      ),
    );
  }
}

class TALabelLargeText extends StatelessWidget {
  const TALabelLargeText({
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
    return TAText(
      text: text,
      textAlign: textAlign,
      style: context.textTheme.labelLarge?.copyWith(
        color: color,
        leadingDistribution: TextLeadingDistribution.even,
        fontWeight: fontWeight ?? FontWeight.bold,
        overflow: overflow,
        letterSpacing: letterSpacing,
        height: height,
        fontSize: TAResponsive.scale(
          context,
          defaultValue: context.textTheme.labelLarge?.fontSize ?? 10,
        ),
      ),
      maxLines: maxLines,
    );
  }
}
