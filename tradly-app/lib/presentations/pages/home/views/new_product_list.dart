import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradly_app/data/models/product_model.dart';
import 'package:tradly_app/presentations/pages/home/states/home_bloc.dart';
import 'package:tradly_app/presentations/pages/home/states/home_state.dart';
import 'package:tradly_app/presentations/widgets/card.dart';
import 'package:tradly_app/presentations/widgets/shimmer.dart';

class NewProductList extends StatelessWidget {
  const NewProductList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.status is HomeStatusListLoading) {
          return const ShimmerProductList();
        }

        return SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: state.newProducts?.length ?? 0,
            itemBuilder: (context, index) {
              final product = state.newProducts?[index];
              return TACardProduct(
                product: ProductModel(
                  id: product?.id,
                  title: product?.title ?? '',
                  imageUrl: product?.imageUrl ?? '',
                  price: product?.price ?? '',
                  brand: product?.brand ?? '',
                ),
                onTapProduct: () {},
              );
            },
          ),
        );
      },
    );
  }
}
