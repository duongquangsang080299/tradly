import 'package:flutter/material.dart';
import 'package:tradly_app/core/resources/l10n_generated/l10n.dart';
import 'product_list.dart';

class BreadBakeryList extends StatelessWidget {
  const BreadBakeryList({
    super.key,
    this.categoryId,
  });
  final int? categoryId;

  @override
  Widget build(BuildContext context) {
    return ProductList(
      title: S.current.productDetailBreadBakeryTitle,
      categoryId: categoryId ?? 0,
    );
  }
}
