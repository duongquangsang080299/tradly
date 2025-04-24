import 'package:flutter/material.dart';
import 'package:tradly_app/core/extensions/context_extensions.dart';

class TASearchView extends StatelessWidget {
  const TASearchView({
    super.key,
    required this.placeholder,
    this.onChanged,
    this.controller,
    this.textStyle,
    this.hintStyle,
  });

  final String placeholder;
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: context.colorScheme.outline,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: placeholder,
        hintStyle: hintStyle ??
            TextStyle(
              color: context.colorScheme.outline.withOpacity(0.5),
              fontSize: 14,
            ),
        prefixIcon: Icon(
          Icons.search,
          size: 24,
          color: context.colorScheme.primary,
        ),
        isDense: true,
        filled: true,
        fillColor: context.colorScheme.onPrimary,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: BorderSide(
            color: context.colorScheme.onPrimary,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
