import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tradly_app/data/models/product_model.dart';
import 'package:tradly_app/data/models/store_model.dart';

part 'store_state.freezed.dart';

class StoreState extends Equatable {
  const StoreState({
    this.hasStore = false,
    this.hasProducts = false,
    this.products,
    this.stores,
    this.imageFiles,
    this.status = const StoreStatus.initial(),
    this.errorMessage,
  });

  final bool hasStore;
  final bool hasProducts;
  final List<ProductModel>? products;
  final StoreModel? stores;
  final List<File>? imageFiles;
  final StoreStatus status;
  final String? errorMessage;

  StoreState copyWith({
    bool? hasStore,
    bool? hasProducts,
    List<ProductModel>? products,
    StoreModel? stores,
    List<File>? imageFiles,
    StoreStatus? status,
    String? errorMessage,
  }) {
    return StoreState(
      hasStore: hasStore ?? this.hasStore,
      hasProducts: hasProducts ?? this.hasProducts,
      products: products ?? this.products,
      stores: stores ?? this.stores,
      imageFiles: imageFiles ?? this.imageFiles,
      status: status ?? this.status,
      errorMessage: errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        hasStore,
        hasProducts,
        products,
        stores,
        imageFiles,
        status,
        errorMessage,
      ];
}

@freezed
sealed class StoreStatus with _$StoreStatus {
  const factory StoreStatus.initial() = StoreStatusInitial;
  const factory StoreStatus.loading() = StoreStatusLoading;
  const factory StoreStatus.success() = StoreStatusSuccess;
  const factory StoreStatus.failure() = StoreStatusFailure;
}
