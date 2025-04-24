import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tradly_app/data/models/product_model.dart';
import 'package:tradly_app/data/repositories/store_repo.dart.dart';
import 'store_event.dart';
import 'store_state.dart';

class StoreBloc extends Bloc<StoreEvt, StoreState> {
  final ImagePicker _picker = ImagePicker();

  StoreBloc({required StoreRepository repo})
      : _repo = repo,
        super(const StoreState()) {
    on<CreateStoreEvt>(_onCreateStore);
    on<AddProductEvt>(_onAddProduct);
    on<EditProductEvt>(_onEditProduct);
    on<DeleteProductEvt>(_onDeleteProduct);
    on<PickImageEvt>(_onPickImage);
    on<RemoveImageEvt>(_onRemoveImage);
  }

  final StoreRepository _repo;

  Future<void> _onCreateStore(
    CreateStoreEvt event,
    Emitter<StoreState> emit,
  ) async {
    emit(
      state.copyWith(
        status: const StoreStatus.loading(),
      ),
    );
    try {
      await _repo.createStore(event.store);
      emit(
        state.copyWith(
          hasStore: true,
          stores: event.store,
          status: const StoreStatus.success(),
          errorMessage: null,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: const StoreStatus.failure(),
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _onAddProduct(
    AddProductEvt event,
    Emitter<StoreState> emit,
  ) async {
    emit(
      state.copyWith(
        status: const StoreStatus.loading(),
      ),
    );
    try {
      await _repo.addProduct(event.product);
      final updatedProducts = List<ProductModel>.from(
        state.products ?? [],
      )..add(event.product);
      emit(
        state.copyWith(
          products: updatedProducts,
          hasProducts: true,
          status: const StoreStatus.success(),
          errorMessage: null,
          imageFiles: [],
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: const StoreStatus.failure(),
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _onEditProduct(
    EditProductEvt event,
    Emitter<StoreState> emit,
  ) async {
    emit(
      state.copyWith(
        status: const StoreStatus.loading(),
      ),
    );
    try {
      await _repo.editProduct(event.product);
      final updatedProducts = state.products?.map((product) {
        return product.id == event.product.id ? event.product : product;
      }).toList();
      emit(
        state.copyWith(
          products: updatedProducts,
          status: const StoreStatus.success(),
          imageFiles: [],
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: const StoreStatus.failure(),
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _onDeleteProduct(
    DeleteProductEvt event,
    Emitter<StoreState> emit,
  ) async {
    emit(
      state.copyWith(
        status: const StoreStatus.loading(),
      ),
    );
    try {
      await _repo.deleteProduct(event.productId);
      final productIdInt = int.tryParse(event.productId);
      final updatedProducts = state.products
          ?.where((product) => productIdInt != null
              ? product.id != productIdInt
              : product.id.toString() != event.productId)
          .toList();
      emit(
        state.copyWith(
          products: updatedProducts,
          hasProducts: updatedProducts?.isNotEmpty ?? false,
          status: const StoreStatus.success(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: const StoreStatus.failure(),
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _onRemoveImage(
    RemoveImageEvt event,
    Emitter<StoreState> emit,
  ) async {
    final updatedImages = List<File>.from(
      state.imageFiles ?? [],
    )..removeAt(event.index);
    emit(
      state.copyWith(
        imageFiles: updatedImages,
        errorMessage: null,
      ),
    );
  }

  Future<void> _onPickImage(
    PickImageEvt event,
    Emitter<StoreState> emit,
  ) async {
    if ((state.imageFiles?.length ?? 0) >= event.maxPhotos) {
      emit(
        state.copyWith(
          errorMessage: 'Maximum ${event.maxPhotos} photos allowed',
        ),
      );
      return;
    }

    try {
      final pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1600,
        maxHeight: 1200,
      );

      if (pickedFile != null) {
        final updatedImages = List<File>.from(state.imageFiles ?? [])
          ..add(File(pickedFile.path));
        emit(
          state.copyWith(
            imageFiles: updatedImages,
            errorMessage: null,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: 'Failed to pick image: $e',
        ),
      );
    }
  }
}
