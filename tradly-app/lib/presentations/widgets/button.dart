import 'package:flutter/material.dart';
import 'package:tradly_app/core/extensions/context_extensions.dart';
import 'package:tradly_app/core/utils/responsive.dart';

class TAElevatedButton extends StatefulWidget {
  const TAElevatedButton({
    required this.text,
    this.isDisabled = false,
    this.width = double.infinity,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.textSize,
    this.padding,
    this.value,
    this.decoration,
    this.fontWeight,
    this.style,
    super.key,
  });

  final String text;
  final bool isDisabled;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? textSize;
  final double? value;
  final Decoration? decoration;
  final FontWeight? fontWeight;
  final ButtonStyle? style;

  @override
  State<TAElevatedButton> createState() => _TAElevatedButtonState();
}

class _TAElevatedButtonState extends State<TAElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      width: widget.width,
      decoration: widget.decoration,
      child: ElevatedButton(
        style: widget.style ??
            ElevatedButton.styleFrom(
              padding:
                  widget.padding ?? const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              backgroundColor: widget.backgroundColor ??
                  (widget.isDisabled
                      ? context.colorScheme.onPrimary.withOpacity(0.5)
                      : context.colorScheme.onPrimary),
            ),
        onPressed: widget.isDisabled ? null : widget.onPressed,
        child: Text(
          widget.text,
          style: TextStyle(
            color: widget.textColor ??
                (widget.isDisabled
                    ? context.colorScheme.primary
                    : context.colorScheme.onPrimary),
            fontSize: widget.textSize ??
                TAResponsive.scale(
                  context,
                  defaultValue: widget.value ?? 18,
                ),
            fontWeight: widget.fontWeight ?? FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class TAOutlinedButton extends StatefulWidget {
  const TAOutlinedButton({
    required this.text,
    this.isDisabled = false,
    this.width = double.infinity,
    this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.textSize,
    this.padding,
    this.value,
    this.decoration,
    this.fontWeight,
    this.style,
    this.minimumSize,
    super.key,
  });

  final String text;
  final bool isDisabled;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? textSize;
  final double? value;
  final Decoration? decoration;
  final FontWeight? fontWeight;
  final ButtonStyle? style;
  final Size? minimumSize;

  @override
  State<TAOutlinedButton> createState() => _TAOutlinedButtonState();
}

class _TAOutlinedButtonState extends State<TAOutlinedButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      width: widget.width,
      decoration: widget.decoration,
      child: OutlinedButton(
        style: widget.style ??
            OutlinedButton.styleFrom(
              minimumSize: widget.minimumSize,
              side: BorderSide(color: context.colorScheme.primary),
              padding: widget.padding ??
                  const EdgeInsets.symmetric(
                    vertical: 12,
                  ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
        onPressed: widget.isDisabled ? null : widget.onPressed,
        child: Text(
          widget.text,
          style: TextStyle(
            color: widget.textColor ??
                (widget.isDisabled
                    ? context.colorScheme.primary
                    : context.colorScheme.onPrimary),
            fontSize: widget.textSize ??
                TAResponsive.scale(
                  context,
                  defaultValue: widget.value ?? 18,
                ),
            fontWeight: widget.fontWeight ?? FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
