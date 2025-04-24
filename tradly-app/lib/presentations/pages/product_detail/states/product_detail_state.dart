import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tradly_app/data/models/product_model.dart';

part 'product_detail_state.freezed.dart';

final class ProductDetailState extends Equatable {
  const ProductDetailState({
    this.products,
    this.product,
    this.status = const ProductDetailStatus.initial(),
    this.errorMessage,
    this.wishlist = const {},
  });

  final ProductDetailStatus status;
  final String? errorMessage;
  final List<ProductModel>? products;
  final ProductModel? product;
  final Set<int> wishlist;

  ProductDetailState copyWith({
    ProductDetailStatus? status,
    String? errorMessage,
    List<ProductModel>? products,
    ProductModel? product,
    Set<int>? wishlist,
  }) {
    return ProductDetailState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      products: products ?? this.products,
      product: product ?? this.product,
      wishlist: wishlist ?? this.wishlist,
    );
  }

  @override
  List<Object?> get props => [
        status,
        errorMessage,
        products,
        product,
        wishlist,
      ];
}

@freezed
sealed class ProductDetailStatus with _$ProductDetailStatus {
  const factory ProductDetailStatus.initial() = ProductDetailStatusListInitial;
  const factory ProductDetailStatus.loading() = ProductDetailStatusListLoading;
  const factory ProductDetailStatus.success() = ProductDetailStatusListSuccess;
  const factory ProductDetailStatus.failure() = ProductDetailStatusListFailure;
}
