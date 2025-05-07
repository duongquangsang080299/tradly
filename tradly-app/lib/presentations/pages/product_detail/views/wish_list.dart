import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradly_app/core/extensions/context_extensions.dart';
import 'package:tradly_app/core/routes/app_router.dart';
import 'package:tradly_app/data/models/product_model.dart';
import 'package:tradly_app/presentations/layouts/app_bar.dart';
import 'package:tradly_app/presentations/layouts/scaffold.dart';
import 'package:tradly_app/presentations/pages/product_detail/states/product_detail_bloc.dart';
import 'package:tradly_app/presentations/pages/product_detail/states/product_detail_state.dart';
import 'package:tradly_app/presentations/widgets/card.dart';

class WishListPage extends StatelessWidget {
  const WishListPage({
    super.key,
    required this.productId,
  });

  final int productId;

  @override
  Widget build(BuildContext context) {
    return TAScaffold(
        appBar: TaAppBar.wishlist(
          title: 'Wishlist',
          onBackPressed: () => Navigator.pop(context),
          backgroundColor: context.colorScheme.primary,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
            builder: (context, state) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.95,
                ),
                itemCount: state.products
                        ?.where(
                            (product) => state.wishlist.contains(product.id))
                        .length ??
                    0,
                itemBuilder: (context, index) {
                  final wishlistProducts = state.products
                      ?.where((product) => state.wishlist.contains(product.id))
                      .toList();
                  final product = wishlistProducts?[index];
                  return TACardProduct(
                    onTapProduct: () {
                      TARouter.navigateTo(
                        context,
                        TAPaths.productDetail.name,
                        extra: product?.id,
                      );
                    },
                    product: ProductModel(
                      id: product?.id,
                      title: product?.title ?? '',
                      imageUrl: product?.imageUrl ?? '',
                      price: product?.price.toString() ?? '0',
                      brand: product?.brand ?? '',
                      newPrice: product?.newPrice.toString() ?? '0',
                    ),
                  );
                },
              );
            },
          ),
        ));
  }
}
