import 'package:equatable/equatable.dart';

sealed class ProductDetailEvt extends Equatable {
  const ProductDetailEvt();

  @override
  List<Object> get props => [];
}

final class ProductDetailInitializeEvt extends ProductDetailEvt {
  const ProductDetailInitializeEvt({
    required this.categoryId,
  });

  final int categoryId;

  @override
  List<Object> get props => [categoryId];
}

final class ProductDetailFetchEvt extends ProductDetailEvt {
  const ProductDetailFetchEvt({
    required this.productId,
  });

  final int productId;

  @override
  List<Object> get props => [productId];
}

final class ProductDetailSortEvt extends ProductDetailEvt {
  const ProductDetailSortEvt({
    required this.sortType,
  });

  final String sortType;

  @override
  List<Object> get props => [sortType];
}

final class ProductDetailToggleWishlistEvt extends ProductDetailEvt {
  const ProductDetailToggleWishlistEvt({
    required this.productId,
  });

  final int productId;

  @override
  List<Object> get props => [productId];
}
