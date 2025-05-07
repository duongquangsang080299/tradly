import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tradly_app/data/models/user_model.dart';
import 'package:tradly_app/data/repositories/auth_repo.dart';
import 'package:tradly_app/presentations/pages/profile/states/profile_event.dart';
import 'package:tradly_app/presentations/pages/profile/states/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvt, ProfileState> {
  ProfileBloc({required AuthRepository repo})
      : _repo = repo,
        super(const ProfileState()) {
    on<FetchProfileEvt>(_onFetchProfile);
  }

  final AuthRepository _repo;

  Future<void> _onFetchProfile(
    FetchProfileEvt event,
    Emitter<ProfileState> emit,
  ) async {
    emit(
      state.copyWith(
        status: const ProfileStatus.loading(),
      ),
    );
    try {
      final currentUser = await _repo.getCurrentUser();
      final user = UserModel(
        userName: currentUser?.userMetadata?['username'] ?? '',
        email: currentUser?.email ?? '',
        phoneNumber: currentUser?.phone ?? '',
      );
      emit(state.copyWith(
        user: user,
        status: const ProfileStatus.success(),
      ));
    } catch (e) {
      emit(
        state.copyWith(
          status: const ProfileStatus.failure(),
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
