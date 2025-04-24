// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StoreStatus {
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
    required TResult Function(StoreStatusInitial value) initial,
    required TResult Function(StoreStatusLoading value) loading,
    required TResult Function(StoreStatusSuccess value) success,
    required TResult Function(StoreStatusFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StoreStatusInitial value)? initial,
    TResult? Function(StoreStatusLoading value)? loading,
    TResult? Function(StoreStatusSuccess value)? success,
    TResult? Function(StoreStatusFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StoreStatusInitial value)? initial,
    TResult Function(StoreStatusLoading value)? loading,
    TResult Function(StoreStatusSuccess value)? success,
    TResult Function(StoreStatusFailure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreStatusCopyWith<$Res> {
  factory $StoreStatusCopyWith(
          StoreStatus value, $Res Function(StoreStatus) then) =
      _$StoreStatusCopyWithImpl<$Res, StoreStatus>;
}

/// @nodoc
class _$StoreStatusCopyWithImpl<$Res, $Val extends StoreStatus>
    implements $StoreStatusCopyWith<$Res> {
  _$StoreStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StoreStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StorelStatusInitialImplCopyWith<$Res> {
  factory _$$StorelStatusInitialImplCopyWith(_$StorelStatusInitialImpl value,
          $Res Function(_$StorelStatusInitialImpl) then) =
      __$$StorelStatusInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StorelStatusInitialImplCopyWithImpl<$Res>
    extends _$StoreStatusCopyWithImpl<$Res, _$StorelStatusInitialImpl>
    implements _$$StorelStatusInitialImplCopyWith<$Res> {
  __$$StorelStatusInitialImplCopyWithImpl(_$StorelStatusInitialImpl _value,
      $Res Function(_$StorelStatusInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of StoreStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StorelStatusInitialImpl implements StoreStatusInitial {
  const _$StorelStatusInitialImpl();

  @override
  String toString() {
    return 'StoreStatus.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StorelStatusInitialImpl);
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
    required TResult Function(StoreStatusInitial value) initial,
    required TResult Function(StoreStatusLoading value) loading,
    required TResult Function(StoreStatusSuccess value) success,
    required TResult Function(StoreStatusFailure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StoreStatusInitial value)? initial,
    TResult? Function(StoreStatusLoading value)? loading,
    TResult? Function(StoreStatusSuccess value)? success,
    TResult? Function(StoreStatusFailure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StoreStatusInitial value)? initial,
    TResult Function(StoreStatusLoading value)? loading,
    TResult Function(StoreStatusSuccess value)? success,
    TResult Function(StoreStatusFailure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class StoreStatusInitial implements StoreStatus {
  const factory StoreStatusInitial() = _$StorelStatusInitialImpl;
}

/// @nodoc
abstract class _$$StorelStatusLoadingImplCopyWith<$Res> {
  factory _$$StorelStatusLoadingImplCopyWith(_$StorelStatusLoadingImpl value,
          $Res Function(_$StorelStatusLoadingImpl) then) =
      __$$StorelStatusLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StorelStatusLoadingImplCopyWithImpl<$Res>
    extends _$StoreStatusCopyWithImpl<$Res, _$StorelStatusLoadingImpl>
    implements _$$StorelStatusLoadingImplCopyWith<$Res> {
  __$$StorelStatusLoadingImplCopyWithImpl(_$StorelStatusLoadingImpl _value,
      $Res Function(_$StorelStatusLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of StoreStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StorelStatusLoadingImpl implements StoreStatusLoading {
  const _$StorelStatusLoadingImpl();

  @override
  String toString() {
    return 'StoreStatus.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StorelStatusLoadingImpl);
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
    required TResult Function(StoreStatusInitial value) initial,
    required TResult Function(StoreStatusLoading value) loading,
    required TResult Function(StoreStatusSuccess value) success,
    required TResult Function(StoreStatusFailure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StoreStatusInitial value)? initial,
    TResult? Function(StoreStatusLoading value)? loading,
    TResult? Function(StoreStatusSuccess value)? success,
    TResult? Function(StoreStatusFailure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StoreStatusInitial value)? initial,
    TResult Function(StoreStatusLoading value)? loading,
    TResult Function(StoreStatusSuccess value)? success,
    TResult Function(StoreStatusFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class StoreStatusLoading implements StoreStatus {
  const factory StoreStatusLoading() = _$StorelStatusLoadingImpl;
}

/// @nodoc
abstract class _$$StorelStatusSuccessImplCopyWith<$Res> {
  factory _$$StorelStatusSuccessImplCopyWith(_$StorelStatusSuccessImpl value,
          $Res Function(_$StorelStatusSuccessImpl) then) =
      __$$StorelStatusSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StorelStatusSuccessImplCopyWithImpl<$Res>
    extends _$StoreStatusCopyWithImpl<$Res, _$StorelStatusSuccessImpl>
    implements _$$StorelStatusSuccessImplCopyWith<$Res> {
  __$$StorelStatusSuccessImplCopyWithImpl(_$StorelStatusSuccessImpl _value,
      $Res Function(_$StorelStatusSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of StoreStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StorelStatusSuccessImpl implements StoreStatusSuccess {
  const _$StorelStatusSuccessImpl();

  @override
  String toString() {
    return 'StoreStatus.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StorelStatusSuccessImpl);
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
    required TResult Function(StoreStatusInitial value) initial,
    required TResult Function(StoreStatusLoading value) loading,
    required TResult Function(StoreStatusSuccess value) success,
    required TResult Function(StoreStatusFailure value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StoreStatusInitial value)? initial,
    TResult? Function(StoreStatusLoading value)? loading,
    TResult? Function(StoreStatusSuccess value)? success,
    TResult? Function(StoreStatusFailure value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StoreStatusInitial value)? initial,
    TResult Function(StoreStatusLoading value)? loading,
    TResult Function(StoreStatusSuccess value)? success,
    TResult Function(StoreStatusFailure value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class StoreStatusSuccess implements StoreStatus {
  const factory StoreStatusSuccess() = _$StorelStatusSuccessImpl;
}

/// @nodoc
abstract class _$$StorelStatusFailureImplCopyWith<$Res> {
  factory _$$StorelStatusFailureImplCopyWith(_$StorelStatusFailureImpl value,
          $Res Function(_$StorelStatusFailureImpl) then) =
      __$$StorelStatusFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StorelStatusFailureImplCopyWithImpl<$Res>
    extends _$StoreStatusCopyWithImpl<$Res, _$StorelStatusFailureImpl>
    implements _$$StorelStatusFailureImplCopyWith<$Res> {
  __$$StorelStatusFailureImplCopyWithImpl(_$StorelStatusFailureImpl _value,
      $Res Function(_$StorelStatusFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of StoreStatus
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StorelStatusFailureImpl implements StoreStatusFailure {
  const _$StorelStatusFailureImpl();

  @override
  String toString() {
    return 'StoreStatus.failure()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StorelStatusFailureImpl);
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
    required TResult Function(StoreStatusInitial value) initial,
    required TResult Function(StoreStatusLoading value) loading,
    required TResult Function(StoreStatusSuccess value) success,
    required TResult Function(StoreStatusFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StoreStatusInitial value)? initial,
    TResult? Function(StoreStatusLoading value)? loading,
    TResult? Function(StoreStatusSuccess value)? success,
    TResult? Function(StoreStatusFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StoreStatusInitial value)? initial,
    TResult Function(StoreStatusLoading value)? loading,
    TResult Function(StoreStatusSuccess value)? success,
    TResult Function(StoreStatusFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class StoreStatusFailure implements StoreStatus {
  const factory StoreStatusFailure() = _$StorelStatusFailureImpl;
}
