import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tradly_app/core/extensions/context_extensions.dart';
import 'package:tradly_app/core/resources/assets_generated/assets.gen.dart';
import 'package:tradly_app/core/resources/l10n_generated/l10n.dart';
import 'package:tradly_app/data/models/product_model.dart';
import 'package:tradly_app/data/models/store_model.dart';
import 'package:tradly_app/presentations/widgets/images.dart';
import 'package:tradly_app/presentations/widgets/text.dart';

class TACardProduct extends StatelessWidget {
  const TACardProduct({
    super.key,
    required this.product,
    this.onTapProduct,
    this.height,
    this.width,
  });

  final ProductModel product;
  final void Function()? onTapProduct;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final isLocalFile = product.imageUrl.startsWith('/http');
    return GestureDetector(
      onTap: onTapProduct,
      child: SizedBox(
        height: height ?? 200,
        width: width ?? 160,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              isLocalFile
                  ? ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: Image.file(
                        File(product.imageUrl),
                        width: width ?? double.infinity,
                        height: height ?? 130,
                        fit: BoxFit.cover,
                      ),
                    )
                  : TAImageRectangle(
                      product.imageUrl,
                      isBorderTop: true,
                      width: width ?? double.infinity,
                      height: height ?? 130,
                      boxFit: BoxFit.cover,
                    ),
              Padding(
                padding: const EdgeInsets.only(left: 11, right: 11),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 6),
                    TATitleLargeText(
                      text: product.title,
                      color: context.colorScheme.onSurface,
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TAImageCircle(
                          radius: 10,
                          Assets.images.imgTradly.path,
                          boxFit: BoxFit.cover,
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: TATitleLargeText(
                            text: product.brand ?? '',
                            fontWeight: FontWeight.w500,
                            color: context.colorScheme.outline,
                          ),
                        ),
                        TALabelLargeText(
                          text: product.newPrice != null
                              ? '\$${product.newPrice}'
                              : '',
                          color: context.colorScheme.outline,
                          fontWeight: FontWeight.w400,
                        ),
                        const SizedBox(width: 6),
                        TATitleLargeText(
                          text: product.price,
                          color: context.colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TACardStoreFollow extends StatelessWidget {
  const TACardStoreFollow({
    super.key,
    required this.stores,
    this.height,
    this.width,
    this.onTap,
  });

  final StoreModel stores;
  final double? height;
  final double? width;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 200,
      width: width ?? 160,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                TAImageRectangle(
                  stores.imageUrl ?? '',
                  isBorderTop: true,
                  width: width ?? double.infinity,
                  height: height ?? 75,
                  boxFit: BoxFit.cover,
                ),
                Positioned(
                  top: 40,
                  left: 40,
                  child: TAImageCircle(
                    radius: 32,
                    stores.logoStore ?? '',
                    boxFit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            SizedBox(height: 35),
            TATitleLargeText(
              text: stores.name,
              color: context.colorScheme.onSurface,
            ),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(80, 25),
                  backgroundColor: context.colorScheme.primary,
                ),
                child: TATitleMediumText(
                  text: S.current.homeFollowButton,
                )),
          ],
        ),
      ),
    );
  }
}
