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
                TaResponsive.scale(
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
                TaResponsive.scale(
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

class TAElevatedIconButton extends StatefulWidget {
  const TAElevatedIconButton({
    required this.icon,
    required this.text,
    this.isLoading = false,
    this.isDisabled = false,
    this.width = double.infinity,
    this.padding,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.decoration,
    this.fontWeight,
    this.iconAlignment = IconAlignment.start,
    this.style,
    super.key,
  });

  final String icon;
  final Widget text;
  final bool isLoading;
  final bool isDisabled;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Decoration? decoration;
  final FontWeight? fontWeight;
  final IconAlignment iconAlignment;
  final ButtonStyle? style;

  @override
  State<TAElevatedIconButton> createState() => _TAElevatedIconButtonState();
}

class _TAElevatedIconButtonState extends State<TAElevatedIconButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      width: widget.width,
      decoration: widget.decoration,
      child: ElevatedButton.icon(
        style: widget.style ??
            ButtonStyle(
              padding: widget.padding != null
                  ? WidgetStateProperty.all<EdgeInsetsGeometry>(
                      widget.padding!,
                    )
                  : null,
              backgroundColor: widget.backgroundColor != null
                  ? WidgetStateProperty.all<Color>(
                      widget.backgroundColor!,
                    )
                  : null,
              foregroundColor: widget.foregroundColor != null
                  ? WidgetStateProperty.all<Color>(
                      widget.foregroundColor!,
                    )
                  : null,
            ),
        onPressed: widget.isDisabled ? null : widget.onPressed,
        label: widget.text,
        iconAlignment: widget.iconAlignment,
        icon: Container(
          constraints: const BoxConstraints(maxWidth: 20, maxHeight: 20),
          padding: const EdgeInsets.only(right: 8),
          child: Image.asset(
            widget.icon,
          ),
        ),
      ),
    );
  }
}

class TAIconButtons extends StatelessWidget {
  const TAIconButtons({
    required this.icon,
    this.onPressed,
    super.key,
  });

  final Widget icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      icon: icon,
      onPressed: onPressed,
    );
  }
}
