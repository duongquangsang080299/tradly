/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/Montserrat-Bold.ttf
  String get montserratBold => 'assets/fonts/Montserrat-Bold.ttf';

  /// File path: assets/fonts/Montserrat-Medium.ttf
  String get montserratMedium => 'assets/fonts/Montserrat-Medium.ttf';

  /// File path: assets/fonts/Montserrat-Regular.ttf
  String get montserratRegular => 'assets/fonts/Montserrat-Regular.ttf';

  /// List of all assets
  List<String> get values =>
      [montserratBold, montserratMedium, montserratRegular];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/ic_cart.svg
  SvgGenImage get icCart => const SvgGenImage('assets/icons/ic_cart.svg');

  /// File path: assets/icons/ic_category.svg
  SvgGenImage get icCategory =>
      const SvgGenImage('assets/icons/ic_category.svg');

  /// File path: assets/icons/ic_empty_widget.svg
  SvgGenImage get icEmptyWidget =>
      const SvgGenImage('assets/icons/ic_empty_widget.svg');

  /// File path: assets/icons/ic_home.svg
  SvgGenImage get icHome => const SvgGenImage('assets/icons/ic_home.svg');

  /// File path: assets/icons/ic_location.svg
  SvgGenImage get icLocation =>
      const SvgGenImage('assets/icons/ic_location.svg');

  /// File path: assets/icons/ic_order.svg
  SvgGenImage get icOrder => const SvgGenImage('assets/icons/ic_order.svg');

  /// File path: assets/icons/ic_profile.svg
  SvgGenImage get icProfile => const SvgGenImage('assets/icons/ic_profile.svg');

  /// File path: assets/icons/ic_search.svg
  SvgGenImage get icSearch => const SvgGenImage('assets/icons/ic_search.svg');

  /// File path: assets/icons/ic_sort_list.svg
  SvgGenImage get icSortList =>
      const SvgGenImage('assets/icons/ic_sort_list.svg');

  /// File path: assets/icons/ic_store.svg
  SvgGenImage get icStore => const SvgGenImage('assets/icons/ic_store.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        icCart,
        icCategory,
        icEmptyWidget,
        icHome,
        icLocation,
        icOrder,
        icProfile,
        icSearch,
        icSortList,
        icStore
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/ic_launcher.png
  AssetGenImage get icLauncher =>
      const AssetGenImage('assets/images/ic_launcher.png');

  /// File path: assets/images/img_empty_store.png
  AssetGenImage get imgEmptyStore =>
      const AssetGenImage('assets/images/img_empty_store.png');

  /// File path: assets/images/img_onboarding_business.png
  AssetGenImage get imgOnboardingBusiness =>
      const AssetGenImage('assets/images/img_onboarding_business.png');

  /// File path: assets/images/img_onboarding_social.png
  AssetGenImage get imgOnboardingSocial =>
      const AssetGenImage('assets/images/img_onboarding_social.png');

  /// File path: assets/images/img_onboarding_support.png
  AssetGenImage get imgOnboardingSupport =>
      const AssetGenImage('assets/images/img_onboarding_support.png');

  /// File path: assets/images/img_tradly.png
  AssetGenImage get imgTradly =>
      const AssetGenImage('assets/images/img_tradly.png');

  /// File path: assets/images/payment.png
  AssetGenImage get payment => const AssetGenImage('assets/images/payment.png');

  /// File path: assets/images/shopping.png
  AssetGenImage get shopping =>
      const AssetGenImage('assets/images/shopping.png');

  /// File path: assets/images/vegetable.png
  AssetGenImage get vegetable =>
      const AssetGenImage('assets/images/vegetable.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        icLauncher,
        imgEmptyStore,
        imgOnboardingBusiness,
        imgOnboardingSocial,
        imgOnboardingSupport,
        imgTradly,
        payment,
        shopping,
        vegetable
      ];
}

class Assets {
  const Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
