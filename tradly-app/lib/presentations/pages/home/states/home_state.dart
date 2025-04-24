import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tradly_app/data/models/category_model.dart';
import 'package:tradly_app/data/models/product_model.dart';
import 'package:tradly_app/data/models/store_model.dart';

part 'home_state.freezed.dart';

final class HomeState extends Equatable {
  const HomeState({
    this.categories,
    this.products,
    this.newProducts,
    this.popularProducts,
    this.stores,
    this.status = const HomeStatus.initial(),
    this.errorMessage,
  });
  final HomeStatus status;
  final String? errorMessage;
  final List<CategoryModel>? categories;
  final List<ProductModel>? products;
  final List<ProductModel>? newProducts;
  final List<ProductModel>? popularProducts;
  final List<StoreModel>? stores;

  HomeState copyWith({
    HomeStatus? status,
    String? errorMessage,
    List<CategoryModel>? categories,
    List<ProductModel>? products,
    List<ProductModel>? newProducts,
    List<ProductModel>? popularProducts,
    List<StoreModel>? stores,
  }) {
    return HomeState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      categories: categories ?? this.categories,
      products: products ?? this.products,
      newProducts: newProducts ?? this.newProducts,
      stores: stores ?? this.stores,
      popularProducts: popularProducts ?? this.popularProducts,
    );
  }

  @override
  List<Object?> get props => [
        status,
        errorMessage,
        categories,
        products,
        newProducts,
        popularProducts,
        stores,
      ];
}

@freezed
sealed class HomeStatus with _$HomeStatus {
  const factory HomeStatus.initial() = HomeStatusListInitial;
  const factory HomeStatus.loading() = HomeStatusListLoading;
  const factory HomeStatus.success() = HomeStatusListSuccess;
  const factory HomeStatus.failure() = HomeStatusListFailure;
}
