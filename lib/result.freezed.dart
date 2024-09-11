// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Result<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(T data) networkFault,
    required TResult Function(T data) responseSuccess,
    required TResult Function(T? data) responseFailure,
    required TResult Function(T? data) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(T data)? networkFault,
    TResult? Function(T data)? responseSuccess,
    TResult? Function(T? data)? responseFailure,
    TResult? Function(T? data)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(T data)? networkFault,
    TResult Function(T data)? responseSuccess,
    TResult Function(T? data)? responseFailure,
    TResult Function(T? data)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T> value) idle,
    required TResult Function(NetworkFault<T> value) networkFault,
    required TResult Function(ResponseSuccess<T> value) responseSuccess,
    required TResult Function(ResponseFailure<T> value) responseFailure,
    required TResult Function(Failure<T> value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<T> value)? idle,
    TResult? Function(NetworkFault<T> value)? networkFault,
    TResult? Function(ResponseSuccess<T> value)? responseSuccess,
    TResult? Function(ResponseFailure<T> value)? responseFailure,
    TResult? Function(Failure<T> value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(NetworkFault<T> value)? networkFault,
    TResult Function(ResponseSuccess<T> value)? responseSuccess,
    TResult Function(ResponseFailure<T> value)? responseFailure,
    TResult Function(Failure<T> value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultCopyWith<T, $Res> {
  factory $ResultCopyWith(Result<T> value, $Res Function(Result<T>) then) =
      _$ResultCopyWithImpl<T, $Res, Result<T>>;
}

/// @nodoc
class _$ResultCopyWithImpl<T, $Res, $Val extends Result<T>>
    implements $ResultCopyWith<T, $Res> {
  _$ResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$IdleImplCopyWith<T, $Res> {
  factory _$$IdleImplCopyWith(
          _$IdleImpl<T> value, $Res Function(_$IdleImpl<T>) then) =
      __$$IdleImplCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$IdleImplCopyWithImpl<T, $Res>
    extends _$ResultCopyWithImpl<T, $Res, _$IdleImpl<T>>
    implements _$$IdleImplCopyWith<T, $Res> {
  __$$IdleImplCopyWithImpl(
      _$IdleImpl<T> _value, $Res Function(_$IdleImpl<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$IdleImpl<T> implements Idle<T> {
  const _$IdleImpl();

  @override
  String toString() {
    return 'Result<$T>.idle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IdleImpl<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(T data) networkFault,
    required TResult Function(T data) responseSuccess,
    required TResult Function(T? data) responseFailure,
    required TResult Function(T? data) failure,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(T data)? networkFault,
    TResult? Function(T data)? responseSuccess,
    TResult? Function(T? data)? responseFailure,
    TResult? Function(T? data)? failure,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(T data)? networkFault,
    TResult Function(T data)? responseSuccess,
    TResult Function(T? data)? responseFailure,
    TResult Function(T? data)? failure,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T> value) idle,
    required TResult Function(NetworkFault<T> value) networkFault,
    required TResult Function(ResponseSuccess<T> value) responseSuccess,
    required TResult Function(ResponseFailure<T> value) responseFailure,
    required TResult Function(Failure<T> value) failure,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<T> value)? idle,
    TResult? Function(NetworkFault<T> value)? networkFault,
    TResult? Function(ResponseSuccess<T> value)? responseSuccess,
    TResult? Function(ResponseFailure<T> value)? responseFailure,
    TResult? Function(Failure<T> value)? failure,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(NetworkFault<T> value)? networkFault,
    TResult Function(ResponseSuccess<T> value)? responseSuccess,
    TResult Function(ResponseFailure<T> value)? responseFailure,
    TResult Function(Failure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class Idle<T> implements Result<T> {
  const factory Idle() = _$IdleImpl<T>;
}

/// @nodoc
abstract class _$$NetworkFaultImplCopyWith<T, $Res> {
  factory _$$NetworkFaultImplCopyWith(_$NetworkFaultImpl<T> value,
          $Res Function(_$NetworkFaultImpl<T>) then) =
      __$$NetworkFaultImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$NetworkFaultImplCopyWithImpl<T, $Res>
    extends _$ResultCopyWithImpl<T, $Res, _$NetworkFaultImpl<T>>
    implements _$$NetworkFaultImplCopyWith<T, $Res> {
  __$$NetworkFaultImplCopyWithImpl(
      _$NetworkFaultImpl<T> _value, $Res Function(_$NetworkFaultImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$NetworkFaultImpl<T>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$NetworkFaultImpl<T> implements NetworkFault<T> {
  const _$NetworkFaultImpl({required this.data});

  @override
  final T data;

  @override
  String toString() {
    return 'Result<$T>.networkFault(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkFaultImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkFaultImplCopyWith<T, _$NetworkFaultImpl<T>> get copyWith =>
      __$$NetworkFaultImplCopyWithImpl<T, _$NetworkFaultImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(T data) networkFault,
    required TResult Function(T data) responseSuccess,
    required TResult Function(T? data) responseFailure,
    required TResult Function(T? data) failure,
  }) {
    return networkFault(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(T data)? networkFault,
    TResult? Function(T data)? responseSuccess,
    TResult? Function(T? data)? responseFailure,
    TResult? Function(T? data)? failure,
  }) {
    return networkFault?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(T data)? networkFault,
    TResult Function(T data)? responseSuccess,
    TResult Function(T? data)? responseFailure,
    TResult Function(T? data)? failure,
    required TResult orElse(),
  }) {
    if (networkFault != null) {
      return networkFault(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T> value) idle,
    required TResult Function(NetworkFault<T> value) networkFault,
    required TResult Function(ResponseSuccess<T> value) responseSuccess,
    required TResult Function(ResponseFailure<T> value) responseFailure,
    required TResult Function(Failure<T> value) failure,
  }) {
    return networkFault(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<T> value)? idle,
    TResult? Function(NetworkFault<T> value)? networkFault,
    TResult? Function(ResponseSuccess<T> value)? responseSuccess,
    TResult? Function(ResponseFailure<T> value)? responseFailure,
    TResult? Function(Failure<T> value)? failure,
  }) {
    return networkFault?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(NetworkFault<T> value)? networkFault,
    TResult Function(ResponseSuccess<T> value)? responseSuccess,
    TResult Function(ResponseFailure<T> value)? responseFailure,
    TResult Function(Failure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (networkFault != null) {
      return networkFault(this);
    }
    return orElse();
  }
}

abstract class NetworkFault<T> implements Result<T> {
  const factory NetworkFault({required final T data}) = _$NetworkFaultImpl<T>;

  T get data;
  @JsonKey(ignore: true)
  _$$NetworkFaultImplCopyWith<T, _$NetworkFaultImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResponseSuccessImplCopyWith<T, $Res> {
  factory _$$ResponseSuccessImplCopyWith(_$ResponseSuccessImpl<T> value,
          $Res Function(_$ResponseSuccessImpl<T>) then) =
      __$$ResponseSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$ResponseSuccessImplCopyWithImpl<T, $Res>
    extends _$ResultCopyWithImpl<T, $Res, _$ResponseSuccessImpl<T>>
    implements _$$ResponseSuccessImplCopyWith<T, $Res> {
  __$$ResponseSuccessImplCopyWithImpl(_$ResponseSuccessImpl<T> _value,
      $Res Function(_$ResponseSuccessImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$ResponseSuccessImpl<T>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$ResponseSuccessImpl<T> implements ResponseSuccess<T> {
  const _$ResponseSuccessImpl({required this.data});

  @override
  final T data;

  @override
  String toString() {
    return 'Result<$T>.responseSuccess(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseSuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseSuccessImplCopyWith<T, _$ResponseSuccessImpl<T>> get copyWith =>
      __$$ResponseSuccessImplCopyWithImpl<T, _$ResponseSuccessImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(T data) networkFault,
    required TResult Function(T data) responseSuccess,
    required TResult Function(T? data) responseFailure,
    required TResult Function(T? data) failure,
  }) {
    return responseSuccess(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(T data)? networkFault,
    TResult? Function(T data)? responseSuccess,
    TResult? Function(T? data)? responseFailure,
    TResult? Function(T? data)? failure,
  }) {
    return responseSuccess?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(T data)? networkFault,
    TResult Function(T data)? responseSuccess,
    TResult Function(T? data)? responseFailure,
    TResult Function(T? data)? failure,
    required TResult orElse(),
  }) {
    if (responseSuccess != null) {
      return responseSuccess(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T> value) idle,
    required TResult Function(NetworkFault<T> value) networkFault,
    required TResult Function(ResponseSuccess<T> value) responseSuccess,
    required TResult Function(ResponseFailure<T> value) responseFailure,
    required TResult Function(Failure<T> value) failure,
  }) {
    return responseSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<T> value)? idle,
    TResult? Function(NetworkFault<T> value)? networkFault,
    TResult? Function(ResponseSuccess<T> value)? responseSuccess,
    TResult? Function(ResponseFailure<T> value)? responseFailure,
    TResult? Function(Failure<T> value)? failure,
  }) {
    return responseSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(NetworkFault<T> value)? networkFault,
    TResult Function(ResponseSuccess<T> value)? responseSuccess,
    TResult Function(ResponseFailure<T> value)? responseFailure,
    TResult Function(Failure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (responseSuccess != null) {
      return responseSuccess(this);
    }
    return orElse();
  }
}

abstract class ResponseSuccess<T> implements Result<T> {
  const factory ResponseSuccess({required final T data}) =
      _$ResponseSuccessImpl<T>;

  T get data;
  @JsonKey(ignore: true)
  _$$ResponseSuccessImplCopyWith<T, _$ResponseSuccessImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResponseFailureImplCopyWith<T, $Res> {
  factory _$$ResponseFailureImplCopyWith(_$ResponseFailureImpl<T> value,
          $Res Function(_$ResponseFailureImpl<T>) then) =
      __$$ResponseFailureImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T? data});
}

/// @nodoc
class __$$ResponseFailureImplCopyWithImpl<T, $Res>
    extends _$ResultCopyWithImpl<T, $Res, _$ResponseFailureImpl<T>>
    implements _$$ResponseFailureImplCopyWith<T, $Res> {
  __$$ResponseFailureImplCopyWithImpl(_$ResponseFailureImpl<T> _value,
      $Res Function(_$ResponseFailureImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$ResponseFailureImpl<T>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$ResponseFailureImpl<T> implements ResponseFailure<T> {
  const _$ResponseFailureImpl({required this.data});

  @override
  final T? data;

  @override
  String toString() {
    return 'Result<$T>.responseFailure(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseFailureImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResponseFailureImplCopyWith<T, _$ResponseFailureImpl<T>> get copyWith =>
      __$$ResponseFailureImplCopyWithImpl<T, _$ResponseFailureImpl<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(T data) networkFault,
    required TResult Function(T data) responseSuccess,
    required TResult Function(T? data) responseFailure,
    required TResult Function(T? data) failure,
  }) {
    return responseFailure(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(T data)? networkFault,
    TResult? Function(T data)? responseSuccess,
    TResult? Function(T? data)? responseFailure,
    TResult? Function(T? data)? failure,
  }) {
    return responseFailure?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(T data)? networkFault,
    TResult Function(T data)? responseSuccess,
    TResult Function(T? data)? responseFailure,
    TResult Function(T? data)? failure,
    required TResult orElse(),
  }) {
    if (responseFailure != null) {
      return responseFailure(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T> value) idle,
    required TResult Function(NetworkFault<T> value) networkFault,
    required TResult Function(ResponseSuccess<T> value) responseSuccess,
    required TResult Function(ResponseFailure<T> value) responseFailure,
    required TResult Function(Failure<T> value) failure,
  }) {
    return responseFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<T> value)? idle,
    TResult? Function(NetworkFault<T> value)? networkFault,
    TResult? Function(ResponseSuccess<T> value)? responseSuccess,
    TResult? Function(ResponseFailure<T> value)? responseFailure,
    TResult? Function(Failure<T> value)? failure,
  }) {
    return responseFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(NetworkFault<T> value)? networkFault,
    TResult Function(ResponseSuccess<T> value)? responseSuccess,
    TResult Function(ResponseFailure<T> value)? responseFailure,
    TResult Function(Failure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (responseFailure != null) {
      return responseFailure(this);
    }
    return orElse();
  }
}

abstract class ResponseFailure<T> implements Result<T> {
  const factory ResponseFailure({required final T? data}) =
      _$ResponseFailureImpl<T>;

  T? get data;
  @JsonKey(ignore: true)
  _$$ResponseFailureImplCopyWith<T, _$ResponseFailureImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<T, $Res> {
  factory _$$FailureImplCopyWith(
          _$FailureImpl<T> value, $Res Function(_$FailureImpl<T>) then) =
      __$$FailureImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T? data});
}

/// @nodoc
class __$$FailureImplCopyWithImpl<T, $Res>
    extends _$ResultCopyWithImpl<T, $Res, _$FailureImpl<T>>
    implements _$$FailureImplCopyWith<T, $Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl<T> _value, $Res Function(_$FailureImpl<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$FailureImpl<T>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc

class _$FailureImpl<T> implements Failure<T> {
  const _$FailureImpl({required this.data});

  @override
  final T? data;

  @override
  String toString() {
    return 'Result<$T>.failure(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<T, _$FailureImpl<T>> get copyWith =>
      __$$FailureImplCopyWithImpl<T, _$FailureImpl<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(T data) networkFault,
    required TResult Function(T data) responseSuccess,
    required TResult Function(T? data) responseFailure,
    required TResult Function(T? data) failure,
  }) {
    return failure(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(T data)? networkFault,
    TResult? Function(T data)? responseSuccess,
    TResult? Function(T? data)? responseFailure,
    TResult? Function(T? data)? failure,
  }) {
    return failure?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(T data)? networkFault,
    TResult Function(T data)? responseSuccess,
    TResult Function(T? data)? responseFailure,
    TResult Function(T? data)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T> value) idle,
    required TResult Function(NetworkFault<T> value) networkFault,
    required TResult Function(ResponseSuccess<T> value) responseSuccess,
    required TResult Function(ResponseFailure<T> value) responseFailure,
    required TResult Function(Failure<T> value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<T> value)? idle,
    TResult? Function(NetworkFault<T> value)? networkFault,
    TResult? Function(ResponseSuccess<T> value)? responseSuccess,
    TResult? Function(ResponseFailure<T> value)? responseFailure,
    TResult? Function(Failure<T> value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T> value)? idle,
    TResult Function(NetworkFault<T> value)? networkFault,
    TResult Function(ResponseSuccess<T> value)? responseSuccess,
    TResult Function(ResponseFailure<T> value)? responseFailure,
    TResult Function(Failure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class Failure<T> implements Result<T> {
  const factory Failure({required final T? data}) = _$FailureImpl<T>;

  T? get data;
  @JsonKey(ignore: true)
  _$$FailureImplCopyWith<T, _$FailureImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
