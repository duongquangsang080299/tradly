import 'package:flutter/material.dart';
import 'package:tradly_app/core/extensions/context_extensions.dart';
import 'package:tradly_app/core/utils/responsive.dart';

class TAIcons {
  static Widget Function({
    Color? color,
    double? size,
  }) add = _TaIconAdd.new;

  static Widget Function({
    Color? color,
    double? size,
  }) map = _TaIconMap.new;

  static Widget Function({
    Color? color,
    double? size,
  }) close = _TaIconClose.new;

  static Widget Function({
    Color? color,
    double? size,
  }) attachMoney = _TaIconAttachMoney.new;

  static Widget Function({
    Color? color,
    double? size,
  }) edit = _TaIconEdit.new;

  static Widget Function({
    Color? color,
    double? size,
  }) delete = _TaIconDelete.new;
}

class _TaIconAdd extends StatelessWidget {
  const _TaIconAdd({
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
      size: TaResponsive.scale(
        context,
        defaultValue: size ?? 24,
      ),
    );
  }
}

class _TaIconClose extends StatelessWidget {
  const _TaIconClose({
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
      size: TaResponsive.scale(
        context,
        defaultValue: size ?? 16,
      ),
    );
  }
}

class _TaIconEdit extends StatelessWidget {
  const _TaIconEdit({
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
      size: TaResponsive.scale(
        context,
        defaultValue: size ?? 24,
      ),
    );
  }
}

class _TaIconDelete extends StatelessWidget {
  const _TaIconDelete({
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
      size: TaResponsive.scale(
        context,
        defaultValue: size ?? 24,
      ),
    );
  }
}

class _TaIconMap extends StatelessWidget {
  const _TaIconMap({
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
      size: TaResponsive.scale(
        context,
        defaultValue: size ?? 24,
      ),
    );
  }
}

class _TaIconAttachMoney extends StatelessWidget {
  const _TaIconAttachMoney({
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
      size: TaResponsive.scale(
        context,
        defaultValue: size ?? 24,
      ),
    );
  }
}
