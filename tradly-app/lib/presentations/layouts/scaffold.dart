import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tradly_app/core/extensions/context_extensions.dart';

class TAScaffold extends StatelessWidget {
  const TAScaffold({
    required this.body,
    this.canPop = true,
    this.extendBodyBehindAppBar,
    this.appBar,
    this.backgroundColor,
    this.persistentFooterButtons,
    this.bottomNavigationBar,
    this.resizeToAvoidBottomInset,
    this.brightness,
    this.onPopInvokedWithResult,
    super.key,
  });

  final Widget body;
  final PreferredSizeWidget? appBar;
  final Color? backgroundColor;
  final bool canPop;
  final List<Widget>? persistentFooterButtons;
  final bool? extendBodyBehindAppBar;
  final Widget? bottomNavigationBar;
  final bool? resizeToAvoidBottomInset;
  final Brightness? brightness;
  final PopInvokedWithResultCallback<dynamic>? onPopInvokedWithResult;

  @override
  Widget build(BuildContext context) {
    final color = backgroundColor ?? context.colorScheme.onPrimary;
    final colorComputeLuminance = color.computeLuminance();

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: brightness ??
            (colorComputeLuminance >= 0.5 ? Brightness.dark : Brightness.light),
        systemNavigationBarColor: Colors.transparent,
      ),
      child: PopScope(
        canPop: canPop,
        onPopInvokedWithResult: onPopInvokedWithResult,
        child: Scaffold(
          extendBodyBehindAppBar: extendBodyBehindAppBar ?? false,
          appBar: appBar,
          backgroundColor:
              backgroundColor ?? context.colorScheme.inversePrimary,
          body: body,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? true,
          persistentFooterButtons: persistentFooterButtons,
          bottomNavigationBar: bottomNavigationBar,
        ),
      ),
    );
  }
}
