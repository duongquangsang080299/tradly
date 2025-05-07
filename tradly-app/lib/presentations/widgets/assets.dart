import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tradly_app/core/extensions/context_extensions.dart';
import 'package:tradly_app/core/resources/assets_generated/assets.gen.dart';
import 'package:tradly_app/core/utils/responsive.dart';

class TAAssetImage extends StatelessWidget {
  TAAssetImage({
    required this.path,
    super.key,
    this.errorBuilder,
    this.width,
    this.height,
    this.color,
    this.boxFit,
    this.type = ImageLoaderType.assetPNG,
  }) : assert(
          !path.startsWith('http'),
          'Asset Image path should not start with http or https',
        );

  final String path;
  final Widget? errorBuilder;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit? boxFit;
  final ImageLoaderType type;

  @override
  Widget build(BuildContext context) {
    return _TAImageLoader(
      url: path,
      type: type,
      errorBuilder: errorBuilder,
      width: width,
      height: height,
      color: color,
      boxFit: boxFit,
    );
  }
}

class TACachedNetworkImage extends StatelessWidget {
  const TACachedNetworkImage({
    required this.url,
    this.width = 40,
    this.height = 40,
    this.boxFit = BoxFit.contain,
    this.errorBuilder,
    super.key,
  });

  final String url;
  final Widget? errorBuilder;
  final double? width;
  final double? height;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    return _TAImageLoader(
      url: url,
      type: ImageLoaderType.cachedNetwork,
      errorBuilder: errorBuilder,
      width: width,
      height: height,
      boxFit: boxFit,
    );
  }
}

enum ImageLoaderType { assetPNG, assetSVG, cachedNetwork }

class _TAImageLoader extends StatelessWidget {
  const _TAImageLoader({
    required this.type,
    required this.url,
    this.errorBuilder,
    this.width,
    this.height,
    this.color,
    this.boxFit = BoxFit.cover,
  });

  final ImageLoaderType type;

  final String url;

  final Widget? errorBuilder;

  final double? width;
  final double? height;
  final Color? color;
  final BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case ImageLoaderType.assetPNG:
        return Image.asset(
          url,
          fit: boxFit,
          errorBuilder:
              (BuildContext context, Object error, StackTrace? stackTrace) {
            log('Image $url load failed. Error: $error');

            return errorBuilder ??
                Icon(
                  Icons.broken_image,
                  size: width,
                );
          },
          width: width,
          height: height,
          color: color,
        );
      case ImageLoaderType.assetSVG:
        return SvgPicture.asset(
          url,
          colorFilter: ColorFilter.mode(
            color ?? context.colorScheme.onSurface,
            BlendMode.srcIn,
          ),
          fit: boxFit ?? BoxFit.contain,
          placeholderBuilder: (BuildContext context) {
            return errorBuilder ??
                Icon(
                  Icons.broken_image,
                  size: width,
                );
          },
          width: width,
          height: height,
        );

      case ImageLoaderType.cachedNetwork:
        return CachedNetworkImage(
          imageUrl: url,
          fit: boxFit,
          width: width,
          height: height,
          errorWidget: (BuildContext context, String url, dynamic error) {
            log('Image $url load failed. Error: $error');

            return errorBuilder ??
                Icon(
                  Icons.broken_image,
                  size: width,
                );
          },
          imageBuilder:
              (BuildContext context, ImageProvider<Object> provider) =>
                  Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: provider,
              ),
            ),
          ),
        );
    }
  }
}

class TAAssets {
  static Widget Function({
    double? width,
    double? height,
    BoxFit? boxfit,
  }) onboardingBusiness = _TAOnboardingBusinessImage.new;

  static Widget Function({
    double? width,
    double? height,
    BoxFit? boxfit,
  }) onboardingSocial = _TAOnboardingSocialImage.new;

  static Widget Function({
    double? width,
    double? height,
    BoxFit? boxfit,
  }) onboardingSupport = _TAOnboardingSupportImage.new;

  static Widget Function({
    double? width,
    double? height,
    BoxFit? boxfit,
  }) category = _TACategoryImage.new;

  static Widget Function({
    double? width,
    double? height,
    BoxFit? boxfit,
    Color? color,
  }) home = _TAHomeImage.new;

  static Widget Function({
    double? width,
    double? height,
    BoxFit? boxfit,
  }) location = _TALocationImage.new;

  static Widget Function({
    double? width,
    double? height,
    BoxFit? boxfit,
    Color? color,
  }) order = _TAOrderImage.new;

  static Widget Function({
    double? width,
    double? height,
    BoxFit? boxfit,
  }) sortList = _TASortListImage.new;

  static Widget Function({
    double? width,
    double? height,
    BoxFit? boxfit,
    Color? color,
  }) store = _TAStoreImage.new;

  static Widget Function({
    double? width,
    double? height,
    BoxFit? boxfit,
    Color? color,
  }) search = _TASearchImage.new;

  static Widget Function({
    double? width,
    double? height,
    BoxFit? boxfit,
    Color? color,
  }) profile = _TAProfileImage.new;

  static Widget Function({
    double? width,
    double? height,
    BoxFit? boxfit,
    Color? color,
  }) cart = _TACartImage.new;

  static Widget Function({
    double? width,
    double? height,
    BoxFit? boxfit,
  }) shopping = _TAShoppingImage.new;
}

class _TAOnboardingBusinessImage extends StatelessWidget {
  const _TAOnboardingBusinessImage({
    this.width,
    this.height,
    this.boxfit,
  });
  final double? height;
  final double? width;
  final BoxFit? boxfit;

  @override
  Widget build(BuildContext context) {
    return TAAssetImage(
      boxFit: boxfit,
      path: Assets.images.imgOnboardingBusiness.path,
      width: TAResponsive.scale(
        context,
        defaultValue: width ?? 285,
      ),
      height: TAResponsive.scale(
        context,
        defaultValue: height ?? 243,
      ),
    );
  }
}

class _TAShoppingImage extends StatelessWidget {
  const _TAShoppingImage({
    this.width,
    this.height,
    this.boxfit,
  });
  final double? height;
  final double? width;
  final BoxFit? boxfit;

  @override
  Widget build(BuildContext context) {
    return TAAssetImage(
      boxFit: boxfit,
      path: Assets.images.payment.path,
      width: TAResponsive.scale(
        context,
        defaultValue: width ?? 305,
      ),
      height: TAResponsive.scale(
        context,
        defaultValue: height ?? 165,
      ),
    );
  }
}

class _TAOnboardingSocialImage extends StatelessWidget {
  const _TAOnboardingSocialImage({
    this.width,
    this.height,
    this.boxfit,
  });
  final double? height;
  final double? width;
  final BoxFit? boxfit;

  @override
  Widget build(BuildContext context) {
    return TAAssetImage(
      boxFit: boxfit,
      path: Assets.images.imgOnboardingSocial.path,
      width: TAResponsive.scale(
        context,
        defaultValue: width ?? 302,
      ),
      height: TAResponsive.scale(
        context,
        defaultValue: height ?? 248,
      ),
    );
  }
}

class _TAOnboardingSupportImage extends StatelessWidget {
  const _TAOnboardingSupportImage({
    this.width,
    this.height,
    this.boxfit,
  });
  final double? height;
  final double? width;
  final BoxFit? boxfit;

  @override
  Widget build(BuildContext context) {
    return TAAssetImage(
      boxFit: boxfit,
      path: Assets.images.imgOnboardingSupport.path,
      width: TAResponsive.scale(
        context,
        defaultValue: width ?? 285,
      ),
      height: TAResponsive.scale(
        context,
        defaultValue: height ?? 243,
      ),
    );
  }
}

class _TACategoryImage extends StatelessWidget {
  const _TACategoryImage({
    this.width,
    this.height,
    this.boxfit,
    this.color,
  });
  final double? height;
  final double? width;
  final BoxFit? boxfit;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return TAAssetImage(
      boxFit: boxfit,
      type: ImageLoaderType.assetSVG,
      path: Assets.icons.icCategory.path,
      width: TAResponsive.scale(
        context,
        defaultValue: width ?? 16,
      ),
      height: TAResponsive.scale(
        context,
        defaultValue: height ?? 16,
      ),
      color: color ?? context.colorScheme.onPrimary,
    );
  }
}

class _TAHomeImage extends StatelessWidget {
  const _TAHomeImage({
    this.width,
    this.height,
    this.boxfit,
    this.color,
  });
  final double? height;
  final double? width;
  final BoxFit? boxfit;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return TAAssetImage(
      boxFit: boxfit,
      type: ImageLoaderType.assetSVG,
      path: Assets.icons.icHome.path,
      width: TAResponsive.scale(
        context,
        defaultValue: width ?? 24,
      ),
      height: TAResponsive.scale(
        context,
        defaultValue: height ?? 24,
      ),
      color: color ?? Colors.grey,
    );
  }
}

class _TALocationImage extends StatelessWidget {
  const _TALocationImage({
    this.width,
    this.height,
    this.boxfit,
  });
  final double? height;
  final double? width;
  final BoxFit? boxfit;

  @override
  Widget build(BuildContext context) {
    return TAAssetImage(
      boxFit: boxfit,
      type: ImageLoaderType.assetSVG,
      path: Assets.icons.icLocation.path,
      width: TAResponsive.scale(
        context,
        defaultValue: width ?? 24,
      ),
      height: TAResponsive.scale(
        context,
        defaultValue: height ?? 24,
      ),
    );
  }
}

class _TAOrderImage extends StatelessWidget {
  const _TAOrderImage({
    this.width,
    this.height,
    this.boxfit,
    this.color,
  });
  final double? height;
  final double? width;
  final BoxFit? boxfit;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return TAAssetImage(
      boxFit: boxfit,
      type: ImageLoaderType.assetSVG,
      path: Assets.icons.icOrder.path,
      width: TAResponsive.scale(
        context,
        defaultValue: width ?? 24,
      ),
      height: TAResponsive.scale(
        context,
        defaultValue: height ?? 24,
      ),
      color: color ?? Colors.grey,
    );
  }
}

class _TASortListImage extends StatelessWidget {
  const _TASortListImage({
    this.width,
    this.height,
    this.boxfit,
    this.color,
  });
  final double? height;
  final double? width;
  final BoxFit? boxfit;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return TAAssetImage(
      boxFit: boxfit,
      type: ImageLoaderType.assetSVG,
      path: Assets.icons.icSortList.path,
      width: TAResponsive.scale(
        context,
        defaultValue: width ?? 16,
      ),
      height: TAResponsive.scale(
        context,
        defaultValue: height ?? 16,
      ),
      color: color ?? context.colorScheme.onPrimary,
    );
  }
}

class _TAStoreImage extends StatelessWidget {
  const _TAStoreImage({
    this.width,
    this.height,
    this.boxfit,
    this.color,
  });
  final double? height;
  final double? width;
  final BoxFit? boxfit;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return TAAssetImage(
      boxFit: boxfit,
      type: ImageLoaderType.assetSVG,
      path: Assets.icons.icStore.path,
      width: TAResponsive.scale(
        context,
        defaultValue: width ?? 24,
      ),
      height: TAResponsive.scale(
        context,
        defaultValue: height ?? 24,
      ),
      color: color ?? Colors.grey,
    );
  }
}

class _TASearchImage extends StatelessWidget {
  const _TASearchImage({
    this.width,
    this.height,
    this.boxfit,
    this.color,
  });
  final double? height;
  final double? width;
  final BoxFit? boxfit;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return TAAssetImage(
      boxFit: boxfit,
      type: ImageLoaderType.assetSVG,
      path: Assets.icons.icSearch.path,
      width: TAResponsive.scale(
        context,
        defaultValue: width ?? 23,
      ),
      height: TAResponsive.scale(
        context,
        defaultValue: height ?? 23,
      ),
      color: color ?? Colors.grey,
    );
  }
}

class _TAProfileImage extends StatelessWidget {
  const _TAProfileImage({
    this.width,
    this.height,
    this.boxfit,
    this.color,
  });
  final double? height;
  final double? width;
  final BoxFit? boxfit;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return TAAssetImage(
      boxFit: boxfit,
      type: ImageLoaderType.assetSVG,
      path: Assets.icons.icProfile.path,
      width: TAResponsive.scale(
        context,
        defaultValue: width ?? 24,
      ),
      height: TAResponsive.scale(
        context,
        defaultValue: height ?? 24,
      ),
      color: color ?? Colors.black,
    );
  }
}

class _TACartImage extends StatelessWidget {
  const _TACartImage({
    this.width,
    this.height,
    this.boxfit,
    this.color,
  });
  final double? height;
  final double? width;
  final BoxFit? boxfit;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return TAAssetImage(
      boxFit: boxfit,
      type: ImageLoaderType.assetSVG,
      path: Assets.icons.icCart.path,
      width: TAResponsive.scale(
        context,
        defaultValue: width ?? 24,
      ),
      height: TAResponsive.scale(
        context,
        defaultValue: height ?? 24,
      ),
      color: color ?? context.colorScheme.onPrimary,
    );
  }
}
