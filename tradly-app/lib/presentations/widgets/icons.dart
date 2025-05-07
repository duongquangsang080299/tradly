import 'package:flutter/material.dart';
import 'package:tradly_app/core/extensions/context_extensions.dart';
import 'package:tradly_app/core/utils/responsive.dart';

class TAIcons {
  static Widget Function({
    Color? color,
    double? size,
  }) add = _TAIconAdd.new;

  static Widget Function({
    Color? color,
    double? size,
  }) map = _TAIconMap.new;

  static Widget Function({
    Color? color,
    double? size,
  }) close = _TAIconClose.new;

  static Widget Function({
    Color? color,
    double? size,
  }) attachMoney = _TAIconAttachMoney.new;

  static Widget Function({
    Color? color,
    double? size,
  }) edit = _TAIconEdit.new;

  static Widget Function({
    Color? color,
    double? size,
  }) delete = _TAIconDelete.new;
}

class _TAIconAdd extends StatelessWidget {
  const _TAIconAdd({
    this.color,
    this.size,
  });

  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.add,
      color: color ?? context.colorScheme.onPrimaryContainer,
      size: TAResponsive.scale(
        context,
        defaultValue: size ?? 24,
      ),
    );
  }
}

class _TAIconClose extends StatelessWidget {
  const _TAIconClose({
    this.color,
    this.size,
  });

  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.close,
      color: color ?? context.colorScheme.onPrimaryContainer,
      size: TAResponsive.scale(
        context,
        defaultValue: size ?? 16,
      ),
    );
  }
}

class _TAIconEdit extends StatelessWidget {
  const _TAIconEdit({
    this.color,
    this.size,
  });

  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.edit,
      color: color ?? context.colorScheme.onPrimary,
      size: TAResponsive.scale(
        context,
        defaultValue: size ?? 24,
      ),
    );
  }
}

class _TAIconDelete extends StatelessWidget {
  const _TAIconDelete({
    this.color,
    this.size,
  });

  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.delete,
      color: color ?? context.colorScheme.onPrimary,
      size: TAResponsive.scale(
        context,
        defaultValue: size ?? 24,
      ),
    );
  }
}

class _TAIconMap extends StatelessWidget {
  const _TAIconMap({
    this.color,
    this.size,
  });

  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.map_outlined,
      color: color ?? context.colorScheme.onSecondary,
      size: TAResponsive.scale(
        context,
        defaultValue: size ?? 24,
      ),
    );
  }
}

class _TAIconAttachMoney extends StatelessWidget {
  const _TAIconAttachMoney({
    this.color,
    this.size,
  });

  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.attach_money,
      color: color ?? context.colorScheme.onSecondary,
      size: TAResponsive.scale(
        context,
        defaultValue: size ?? 24,
      ),
    );
  }
}
