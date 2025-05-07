import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tradly_app/core/extensions/context_extensions.dart';

class TALoadingIndicator extends StatelessWidget {
  const TALoadingIndicator({
    super.key,
    this.radius,
    this.color,
  });

  final double? radius;

  final Color? color;

  static Future<TALoadingIndicator?> show(
    BuildContext context, {
    double? radius,
    Color? color,
  }) {
    return showDialog<TALoadingIndicator>(
      context: context,
      builder: (_) => PopScope(
        canPop: false,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: TALoadingIndicator(
            radius: radius,
            color: color,
          ),
        ),
      ),
    );
  }

  static void hide(BuildContext ctx) {
    ctx.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: CircularProgressIndicator(
          strokeAlign: radius ?? 5,
          color: color ?? context.colorScheme.primary,
        ),
      ),
    );
  }
}
