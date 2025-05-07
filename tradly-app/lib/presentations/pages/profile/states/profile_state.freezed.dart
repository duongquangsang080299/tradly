// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileStatus {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function() failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function()? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileStatusInitial value) initial,
    required TResult Function(ProfileStatusLoading value) loading,
    required TResult Function(ProfileStatusSuccess value) success,
    required TResult Function(ProfileStatusFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileStatusInitial value)? initial,
    TResult? Function(ProfileStatusLoading value)? loading,
    TResult? Function(ProfileStatusSuccess value)? success,
    TResult? Function(ProfileStatusFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileStatusInitial value)? initial,
    TResult Function(ProfileStatusLoading value)? loading,
    TResult Function(ProfileStatusSuccess value)? success,
    TResult Function(ProfileStatusFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStatusCopyWith<$Res> {
  factory $ProfileStatusCopyWith(
          ProfileStatus value, $Res Function(ProfileStatus) then) =
      _$ProfileStatusCopyWithImpl<$Res, ProfileStatus>;
}

/// @nodoc
class _$ProfileStatusCopyWithImpl<$Res, $Val extends ProfileStatus>
    implements $ProfileStatusCopyWith<$Res> {
  _$ProfileStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ProfileStatusInitialImplCopyWith<$Res> {
  factory _$$ProfileStatusInitialImplCopyWith(_$ProfileStatusInitialImpl value,
          $Res Function(_$ProfileStatusInitialImpl) then) =
      __$$ProfileStatusInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProfileStatusInitialImplCopyWithImpl<$Res>
    extends _$ProfileStatusCopyWithImpl<$Res, _$ProfileStatusInitialImpl>
    implements _$$ProfileStatusInitialImplCopyWith<$Res> {
  __$$ProfileStatusInitialImplCopyWithImpl(_$ProfileStatusInitialImpl _value,
      $Res Function(_$ProfileStatusInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ProfileStatusInitialImpl implements ProfileStatusInitial {
  const _$ProfileStatusInitialImpl();

  @override
  String toString() {
    return 'ProfileStatus.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileStatusInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function() failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function()? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileStatusInitial value) initial,
    required TResult Function(ProfileStatusLoading value) loading,
    required TResult Function(ProfileStatusSuccess value) success,
    required TResult Function(ProfileStatusFailure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileStatusInitial value)? initial,
    TResult? Function(ProfileStatusLoading value)? loading,
    TResult? Function(ProfileStatusSuccess value)? success,
    TResult? Function(ProfileStatusFailure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileStatusInitial value)? initial,
    TResult Function(ProfileStatusLoading value)? loading,
    TResult Function(ProfileStatusSuccess value)? success,
    TResult Function(ProfileStatusFailure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ProfileStatusInitial implements ProfileStatus {
  const factory ProfileStatusInitial() = _$ProfileStatusInitialImpl;
}

/// @nodoc
abstract class _$$ProfileStatusLoadingImplCopyWith<$Res> {
  factory _$$ProfileStatusLoadingImplCopyWith(_$ProfileStatusLoadingImpl value,
          $Res Function(_$ProfileStatusLoadingImpl) then) =
      __$$ProfileStatusLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProfileStatusLoadingImplCopyWithImpl<$Res>
    extends _$ProfileStatusCopyWithImpl<$Res, _$ProfileStatusLoadingImpl>
    implements _$$ProfileStatusLoadingImplCopyWith<$Res> {
  __$$ProfileStatusLoadingImplCopyWithImpl(_$ProfileStatusLoadingImpl _value,
      $Res Function(_$ProfileStatusLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ProfileStatusLoadingImpl implements ProfileStatusLoading {
  const _$ProfileStatusLoadingImpl();

  @override
  String toString() {
    return 'ProfileStatus.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileStatusLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function() failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function()? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileStatusInitial value) initial,
    required TResult Function(ProfileStatusLoading value) loading,
    required TResult Function(ProfileStatusSuccess value) success,
    required TResult Function(ProfileStatusFailure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileStatusInitial value)? initial,
    TResult? Function(ProfileStatusLoading value)? loading,
    TResult? Function(ProfileStatusSuccess value)? success,
    TResult? Function(ProfileStatusFailure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileStatusInitial value)? initial,
    TResult Function(ProfileStatusLoading value)? loading,
    TResult Function(ProfileStatusSuccess value)? success,
    TResult Function(ProfileStatusFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ProfileStatusLoading implements ProfileStatus {
  const factory ProfileStatusLoading() = _$ProfileStatusLoadingImpl;
}

/// @nodoc
abstract class _$$ProfileStatusSuccessImplCopyWith<$Res> {
  factory _$$ProfileStatusSuccessImplCopyWith(_$ProfileStatusSuccessImpl value,
          $Res Function(_$ProfileStatusSuccessImpl) then) =
      __$$ProfileStatusSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProfileStatusSuccessImplCopyWithImpl<$Res>
    extends _$ProfileStatusCopyWithImpl<$Res, _$ProfileStatusSuccessImpl>
    implements _$$ProfileStatusSuccessImplCopyWith<$Res> {
  __$$ProfileStatusSuccessImplCopyWithImpl(_$ProfileStatusSuccessImpl _value,
      $Res Function(_$ProfileStatusSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ProfileStatusSuccessImpl implements ProfileStatusSuccess {
  const _$ProfileStatusSuccessImpl();

  @override
  String toString() {
    return 'ProfileStatus.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileStatusSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function() failure,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function()? failure,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileStatusInitial value) initial,
    required TResult Function(ProfileStatusLoading value) loading,
    required TResult Function(ProfileStatusSuccess value) success,
    required TResult Function(ProfileStatusFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileStatusInitial value)? initial,
    TResult? Function(ProfileStatusLoading value)? loading,
    TResult? Function(ProfileStatusSuccess value)? success,
    TResult? Function(ProfileStatusFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileStatusInitial value)? initial,
    TResult Function(ProfileStatusLoading value)? loading,
    TResult Function(ProfileStatusSuccess value)? success,
    TResult Function(ProfileStatusFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ProfileStatusSuccess implements ProfileStatus {
  const factory ProfileStatusSuccess() = _$ProfileStatusSuccessImpl;
}

/// @nodoc
abstract class _$$ProfileStatusFailureImplCopyWith<$Res> {
  factory _$$ProfileStatusFailureImplCopyWith(_$ProfileStatusFailureImpl value,
          $Res Function(_$ProfileStatusFailureImpl) then) =
      __$$ProfileStatusFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProfileStatusFailureImplCopyWithImpl<$Res>
    extends _$ProfileStatusCopyWithImpl<$Res, _$ProfileStatusFailureImpl>
    implements _$$ProfileStatusFailureImplCopyWith<$Res> {
  __$$ProfileStatusFailureImplCopyWithImpl(_$ProfileStatusFailureImpl _value,
      $Res Function(_$ProfileStatusFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ProfileStatusFailureImpl implements ProfileStatusFailure {
  const _$ProfileStatusFailureImpl();

  @override
  String toString() {
    return 'ProfileStatus.failure()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileStatusFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function() failure,
  }) {
    return failure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function()? failure,
  }) {
    return failure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function()? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileStatusInitial value) initial,
    required TResult Function(ProfileStatusLoading value) loading,
    required TResult Function(ProfileStatusSuccess value) success,
    required TResult Function(ProfileStatusFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileStatusInitial value)? initial,
    TResult? Function(ProfileStatusLoading value)? loading,
    TResult? Function(ProfileStatusSuccess value)? success,
    TResult? Function(ProfileStatusFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileStatusInitial value)? initial,
    TResult Function(ProfileStatusLoading value)? loading,
    TResult Function(ProfileStatusSuccess value)? success,
    TResult Function(ProfileStatusFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class ProfileStatusFailure implements ProfileStatus {
  const factory ProfileStatusFailure() = _$ProfileStatusFailureImpl;
}
