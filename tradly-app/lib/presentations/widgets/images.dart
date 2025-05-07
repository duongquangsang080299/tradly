import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tradly_app/core/extensions/context_extensions.dart';
import 'package:tradly_app/core/resources/assets_generated/assets.gen.dart';

enum ImageType {
  asset,
  network,
}

class TAImageCircle extends _TAImage {
  const TAImageCircle(
    String imagePath, {
    super.key,
    super.package,
    super.boxFit,
    double? radius,
    super.color,
    super.errorBuilder,
    super.path,
  }) : super(
          imagePath: imagePath,
          width: radius,
          shape: BoxShape.circle,
        );
}

class TAImageRectangle extends _TAImage {
  const TAImageRectangle(
    String imagePath, {
    super.key,
    super.package,
    super.boxFit,
    super.width,
    super.height,
    super.color,
    super.errorBuilder,
    super.borderRadius,
    super.isBorderTop,
    super.opacity,
  }) : super(
          imagePath: imagePath,
        );
}

class _TAImage extends StatelessWidget {
  const _TAImage({
    super.key,
    required this.imagePath,
    this.package,
    this.boxFit,
    this.width,
    this.height,
    this.color,
    this.errorBuilder,
    this.shape,
    this.borderRadius,
    this.isBorderTop = false,
    this.path,
    this.opacity,
  });

  final String imagePath;
  final String? package;
  final BoxFit? boxFit;
  final double? width;
  final double? height;
  final Color? color;
  final Widget? errorBuilder;
  final BoxShape? shape;
  final double? borderRadius;
  final bool isBorderTop;
  final String? path;
  final Animation<double>? opacity;

  @override
  Widget build(BuildContext context) {
    var imageType =
        imagePath.startsWith('http') ? ImageType.network : ImageType.asset;

    var isCircle = shape == BoxShape.circle;

    switch (imageType) {
      case ImageType.asset:
        return isCircle
            ? _CircleAvatar(
                imagePath: imagePath,
                package: package,
                width: width,
              )
            : Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  color: color, // Include color in the decoration
                  borderRadius: isBorderTop
                      ? BorderRadius.only(
                          topLeft: Radius.circular(borderRadius ?? 10),
                          topRight: Radius.circular(borderRadius ?? 10),
                        )
                      : BorderRadius.circular(borderRadius ?? 0),
                ),
                clipBehavior: Clip.hardEdge,
                child: Image.asset(
                  imagePath,
                  package: package,
                  fit: boxFit,
                  errorBuilder: (context, error, stackTrace) =>
                      errorBuilder ?? _errorBuilder(width, height, path: path),
                ),
              );

      case ImageType.network:
        return CachedNetworkImage(
          imageUrl: imagePath,
          fit: boxFit,
          width: isCircle ? null : width,
          height: isCircle ? null : height,
          placeholder: (context, url) => Container(
            decoration: BoxDecoration(
              color: context.colorScheme.surfaceTint,
              borderRadius: isBorderTop
                  ? BorderRadius.only(
                      topLeft: Radius.circular(borderRadius ?? 10),
                      topRight: Radius.circular(borderRadius ?? 10),
                    )
                  : BorderRadius.circular(borderRadius ?? 0),
            ),
          ),
          errorWidget: (context, url, error) =>
              errorBuilder ?? _errorBuilder(width, height, path: path),
          imageBuilder: (context, imageProvider) => shape == BoxShape.circle
              ? CircleAvatar(backgroundImage: imageProvider, radius: width)
              : ClipRRect(
                  borderRadius: isBorderTop
                      ? BorderRadius.only(
                          topLeft: Radius.circular(borderRadius ?? 10),
                          topRight: Radius.circular(borderRadius ?? 10),
                        )
                      : BorderRadius.circular(borderRadius ?? 0),
                  child: SizedBox.fromSize(
                      size: Size.fromRadius(borderRadius ?? 0),
                      child: Image(
                        image: imageProvider,
                        fit: boxFit,
                      )),
                ),
        );
    }
  }
}

class _CircleAvatar extends StatefulWidget {
  const _CircleAvatar({
    required this.imagePath,
    this.package,
    this.width,
  });

  final String imagePath;
  final String? package;
  final double? width;

  @override
  State<_CircleAvatar> createState() => _CircleAvatarState();
}

class _CircleAvatarState extends State<_CircleAvatar> {
  var isErrorOccurred = false;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: isErrorOccurred
          ? AssetImage(
              Assets.images.imgTradly.path,
            )
          : AssetImage(
              widget.imagePath,
              package: widget.package,
            ),
      radius: widget.width,
      onBackgroundImageError: (exception, stackTrace) => setState(() {
        isErrorOccurred = true;
      }),
    );
  }
}

Widget _errorBuilder(double? width, double? height, {String? path}) {
  return Image.asset(
    path ?? Assets.icons.icEmptyWidget.path,
    fit: BoxFit.cover,
    width: width,
    height: height,
  );
}
