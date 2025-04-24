import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradly_app/data/models/product_model.dart';
import 'package:tradly_app/data/repositories/product_repo.dart';
import 'package:tradly_app/presentations/pages/product_detail/states/product_detail_event.dart';
import 'package:tradly_app/presentations/pages/product_detail/states/product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvt, ProductDetailState> {
  ProductDetailBloc({
    required ProductRepository repo,
  })  : _repo = repo,
        super(const ProductDetailState()) {
    on<ProductDetailInitializeEvt>(_onInitialize);
    on<ProductDetailFetchEvt>(_onFetchProductDetail);
    on<ProductDetailSortEvt>(_onSortProducts);
    on<ProductDetailToggleWishlistEvt>(_onToggleWishlist);
  }

  final ProductRepository _repo;

  Future<void> _onInitialize(
    ProductDetailInitializeEvt event,
    Emitter<ProductDetailState> emit,
  ) async {
    emit(
      state.copyWith(
        status: const ProductDetailStatus.loading(),
      ),
    );

    try {
      final products = await _repo.fetchProductsByCategoryId(
        event.categoryId,
      );
      emit(
        state.copyWith(
          products: products,
          status: const ProductDetailStatus.success(),
        ),
      );
    } catch (e) {
      emit(state.copyWith(
          status: const ProductDetailStatus.failure(),
          errorMessage: e.toString()));
    }
  }

  Future<void> _onFetchProductDetail(
    ProductDetailFetchEvt event,
    Emitter<ProductDetailState> emit,
  ) async {
    emit(
      state.copyWith(
        status: const ProductDetailStatus.loading(),
      ),
    );

    try {
      final product = (await _repo.fetchProductById(event.productId)).first;
      emit(
        state.copyWith(
          product: product,
          status: const ProductDetailStatus.success(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: const ProductDetailStatus.failure(),
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _onSortProducts(
    ProductDetailSortEvt event,
    Emitter<ProductDetailState> emit,
  ) async {
    final products = List<ProductModel>.from(state.products ?? []);
    if (event.sortType == 'Price: lowest to highest') {
      products.sort((a, b) =>
          ((a.newPrice as num?) ?? 0).compareTo((b.newPrice as num?) ?? 0));
    } else if (event.sortType == 'Price: highest to lowest') {
      products.sort(
          (a, b) => ((b.newPrice as num?) ?? 0).compareTo((a.newPrice as num)));
    } else if (event.sortType == 'Sort by alphabet') {
      products.sort((a, b) => a.title.compareTo(b.title));
    }
    emit(state.copyWith(products: products));
  }

  Future<void> _onToggleWishlist(
    ProductDetailToggleWishlistEvt event,
    Emitter<ProductDetailState> emit,
  ) async {
    final wishlist = Set<int>.from(state.wishlist);
    if (wishlist.contains(event.productId)) {
      wishlist.remove(event.productId);
    } else {
      wishlist.add(event.productId);
    }
    emit(state.copyWith(wishlist: wishlist));
  }
}
