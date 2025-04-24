import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradly_app/data/repositories/home_repo.dart';
import 'package:tradly_app/presentations/pages/home/states/home_event.dart';
import 'package:tradly_app/presentations/pages/home/states/home_state.dart';

class HomeBloc extends Bloc<HomeEvt, HomeState> {
  HomeBloc({
    required HomeRepository repo,
  })  : _repo = repo,
        super(const HomeState()) {
    on<HomeInitializeEvt>(_onInitializeHandler);
  }

  final HomeRepository _repo;

  Future<void> _onInitializeHandler(
    HomeInitializeEvt event,
    Emitter<HomeState> emit,
  ) async {
    await Future.wait<void>(
      [
        _fetchCategories(emit),
        _fetchNewProductsHandler(event, emit),
        _fetchPopularProductsHandler(event, emit),
        _fetchStores(emit)
      ],
    );
  }

  Future<void> _fetchCategories(
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        status: const HomeStatus.loading(),
      ),
    );
    try {
      final categories = await _repo.fetchCategories();
      emit(
        state.copyWith(
          categories: categories,
          status: const HomeStatus.success(),
        ),
      );
    } catch (e) {
      emit(state.copyWith(
        status: const HomeStatus.failure(),
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> _fetchNewProductsHandler(
    HomeInitializeEvt event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        status: const HomeStatus.loading(),
      ),
    );
    try {
      final productIds = [1, 2, 3, 4];
      final products = await _repo.fetchNewProducts(productIds);
      emit(
        state.copyWith(
          newProducts: products,
          status: const HomeStatus.success(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: const HomeStatus.failure(),
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _fetchPopularProductsHandler(
    HomeInitializeEvt event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        status: const HomeStatus.loading(),
      ),
    );
    try {
      final productIds = [5, 4, 8];
      final products = await _repo.fetchPopularProducts(productIds);
      emit(
        state.copyWith(
          popularProducts: products,
          status: const HomeStatus.success(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: const HomeStatus.failure(),
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> _fetchStores(
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        status: const HomeStatus.loading(),
      ),
    );
    try {
      final stores = await _repo.fetchStores();
      emit(
        state.copyWith(
          stores: stores,
          status: const HomeStatus.success(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: const HomeStatus.failure(),
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
