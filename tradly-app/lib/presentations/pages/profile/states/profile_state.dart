import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tradly_app/data/models/user_model.dart';

part 'profile_state.freezed.dart';

final class ProfileState extends Equatable {
  const ProfileState({
    this.user,
    this.status = const ProfileStatus.initial(),
    this.errorMessage,
  });

  final UserModel? user;
  final ProfileStatus status;
  final String? errorMessage;

  ProfileState copyWith({
    UserModel? user,
    ProfileStatus? status,
    String? errorMessage,
  }) {
    return ProfileState(
      user: user ?? this.user,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        user,
        status,
        errorMessage,
      ];
}

@freezed
sealed class ProfileStatus with _$ProfileStatus {
  const factory ProfileStatus.initial() = ProfileStatusInitial;
  const factory ProfileStatus.loading() = ProfileStatusLoading;
  const factory ProfileStatus.success() = ProfileStatusSuccess;
  const factory ProfileStatus.failure() = ProfileStatusFailure;
}
