import 'package:flutter/material.dart';
import 'package:tradly_app/core/resources/l10n_generated/l10n.dart';
import 'package:tradly_app/presentations/pages/product_detail/views/product_list.dart';

class VegetablesList extends StatelessWidget {
  const VegetablesList({
    super.key,
    this.categoryId,
  });

  final int? categoryId;

  @override
  Widget build(BuildContext context) {
    return ProductList(
      title: S.current.productDetailVegetablesTitle,
      categoryId: categoryId ?? 0,
    );
  }
}
