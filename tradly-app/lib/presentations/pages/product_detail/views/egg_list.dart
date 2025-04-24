import 'package:flutter/material.dart';
import 'package:tradly_app/core/resources/l10n_generated/l10n.dart';
import 'product_list.dart';

class EggList extends StatelessWidget {
  const EggList({
    super.key,
    this.categoryId,
  });

  final int? categoryId;

  @override
  Widget build(BuildContext context) {
    return ProductList(
      title: S.current.productDetailEggTitle,
      categoryId: categoryId ?? 0,
    );
  }
}
