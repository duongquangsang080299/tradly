import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradly_app/core/extensions/context_extensions.dart';
import 'package:tradly_app/core/routes/app_router.dart';
import 'package:tradly_app/data/models/product_model.dart';
import 'package:tradly_app/data/repositories/product_repo.dart';
import 'package:tradly_app/presentations/layouts/app_bar.dart';
import 'package:tradly_app/presentations/pages/product_detail/states/product_detail_bloc.dart';
import 'package:tradly_app/presentations/pages/product_detail/states/product_detail_event.dart';
import 'package:tradly_app/presentations/pages/product_detail/states/product_detail_state.dart';
import 'package:tradly_app/presentations/widgets/card.dart';
import 'package:tradly_app/presentations/widgets/indicator.dart';
import 'package:tradly_app/presentations/widgets/snackbar.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    super.key,
    required this.title,
    required this.categoryId,
    this.productId,
  });

  final String title;
  final int categoryId;
  final int? productId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailBloc(
        repo: context.read<ProductRepository>(),
      )..add(
          ProductDetailInitializeEvt(
            categoryId: categoryId,
          ),
        ),
      child: BlocListener<ProductDetailBloc, ProductDetailState>(
        listener: (context, state) {
          state.status.maybeWhen(
            orElse: () => LALoadingIndicator.hide(context),
            loading: () => LALoadingIndicator.show(context),
            failure: () {
              TASnackBar.buildErrorSnackbar(
                context,
                state.errorMessage ?? '',
              );
            },
          );
        },
        child: Scaffold(
          appBar: TaAppBar.categoryDetail(
            backgroundColor: context.colorScheme.primary,
            title: title,
            onBackPressed: () {
              Navigator.pop(context);
            },
            onPressed: () => _showSortBottomSheet(context),
          ),
          body: BlocBuilder<ProductDetailBloc, ProductDetailState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.95,
                  ),
                  itemCount: state.products?.length ?? 0,
                  itemBuilder: (context, index) {
                    return TACardProduct(
                      onTapProduct: () {
                        TARouter.navigateToProductDetail(
                          context,
                          TAPaths.productDetail.name,
                          extra: state.products?[index].id,
                        );
                      },
                      product: ProductModel(
                        id: state.products?[index].id,
                        title: state.products?[index].title ?? '',
                        imageUrl: state.products?[index].imageUrl ?? '',
                        price: state.products?[index].price.toString() ?? '0',
                        brand: state.products?[index].brand ?? '',
                        newPrice:
                            state.products?[index].newPrice.toString() ?? '0',
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _showSortBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text('Price: lowest to highest'),
              onTap: () {
                context.read<ProductDetailBloc>().add(
                    ProductDetailSortEvt(sortType: 'Price: lowest to highest'));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Price: highest to lowest'),
              onTap: () {
                context.read<ProductDetailBloc>().add(
                    ProductDetailSortEvt(sortType: 'Price: highest to lowest'));
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Sort by alphabet'),
              onTap: () {
                context
                    .read<ProductDetailBloc>()
                    .add(ProductDetailSortEvt(sortType: 'Sort by alphabet'));
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
