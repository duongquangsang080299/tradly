import 'package:equatable/equatable.dart';
import 'package:tradly_app/data/models/product_model.dart';
import 'package:tradly_app/data/models/store_model.dart';

sealed class StoreEvt extends Equatable {
  const StoreEvt();

  @override
  List<Object?> get props => [];
}

class InitializeStoreEvt extends StoreEvt {
  const InitializeStoreEvt();

  @override
  List<Object?> get props => [];
}

class CreateStoreEvt extends StoreEvt {
  const CreateStoreEvt({
    required this.store,
  });

  final StoreModel store;

  @override
  List<Object?> get props => [store];
}

class AddProductEvt extends StoreEvt {
  const AddProductEvt({
    required this.product,
  });

  final ProductModel product;

  @override
  List<Object?> get props => [product];
}

class EditProductEvt extends StoreEvt {
  const EditProductEvt({
    required this.product,
  });

  final ProductModel product;

  @override
  List<Object?> get props => [product];
}

class DeleteProductEvt extends StoreEvt {
  const DeleteProductEvt({
    required this.productId,
  });

  final String productId;

  @override
  List<Object?> get props => [productId];
}

class DeleteStoreEvt extends StoreEvt {
  const DeleteStoreEvt({
    required this.storeId,
  });

  final String storeId;

  @override
  List<Object?> get props => [storeId];
}

class PickImageEvt extends StoreEvt {
  const PickImageEvt({
    required this.maxPhotos,
  });

  final int maxPhotos;

  @override
  List<Object?> get props => [maxPhotos];
}

class RemoveImageEvt extends StoreEvt {
  const RemoveImageEvt({
    required this.index,
  });

  final int index;
  @override
  List<Object?> get props => [index];
}
