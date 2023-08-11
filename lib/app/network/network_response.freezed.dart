// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NetworkResponse<Model> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) badRequest,
    required TResult Function(String message) conflict,
    required TResult Function(String message) invalidParameters,
    required TResult Function(String message) noAccess,
    required TResult Function(String message) noAuth,
    required TResult Function(String message) noData,
    required TResult Function(String message) notFound,
    required TResult Function(Model data) ok,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? badRequest,
    TResult? Function(String message)? conflict,
    TResult? Function(String message)? invalidParameters,
    TResult? Function(String message)? noAccess,
    TResult? Function(String message)? noAuth,
    TResult? Function(String message)? noData,
    TResult? Function(String message)? notFound,
    TResult? Function(Model data)? ok,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? badRequest,
    TResult Function(String message)? conflict,
    TResult Function(String message)? invalidParameters,
    TResult Function(String message)? noAccess,
    TResult Function(String message)? noAuth,
    TResult Function(String message)? noData,
    TResult Function(String message)? notFound,
    TResult Function(Model data)? ok,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BadRequest<Model> value) badRequest,
    required TResult Function(Conflict<Model> value) conflict,
    required TResult Function(InvalidParameters<Model> value) invalidParameters,
    required TResult Function(NoAccess<Model> value) noAccess,
    required TResult Function(NoAuth<Model> value) noAuth,
    required TResult Function(NoData<Model> value) noData,
    required TResult Function(NotFound<Model> value) notFound,
    required TResult Function(Ok<Model> value) ok,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BadRequest<Model> value)? badRequest,
    TResult? Function(Conflict<Model> value)? conflict,
    TResult? Function(InvalidParameters<Model> value)? invalidParameters,
    TResult? Function(NoAccess<Model> value)? noAccess,
    TResult? Function(NoAuth<Model> value)? noAuth,
    TResult? Function(NoData<Model> value)? noData,
    TResult? Function(NotFound<Model> value)? notFound,
    TResult? Function(Ok<Model> value)? ok,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BadRequest<Model> value)? badRequest,
    TResult Function(Conflict<Model> value)? conflict,
    TResult Function(InvalidParameters<Model> value)? invalidParameters,
    TResult Function(NoAccess<Model> value)? noAccess,
    TResult Function(NoAuth<Model> value)? noAuth,
    TResult Function(NoData<Model> value)? noData,
    TResult Function(NotFound<Model> value)? notFound,
    TResult Function(Ok<Model> value)? ok,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkResponseCopyWith<Model, $Res> {
  factory $NetworkResponseCopyWith(NetworkResponse<Model> value,
          $Res Function(NetworkResponse<Model>) then) =
      _$NetworkResponseCopyWithImpl<Model, $Res, NetworkResponse<Model>>;
}

/// @nodoc
class _$NetworkResponseCopyWithImpl<Model, $Res,
        $Val extends NetworkResponse<Model>>
    implements $NetworkResponseCopyWith<Model, $Res> {
  _$NetworkResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$BadRequestCopyWith<Model, $Res> {
  factory _$$BadRequestCopyWith(
          _$BadRequest<Model> value, $Res Function(_$BadRequest<Model>) then) =
      __$$BadRequestCopyWithImpl<Model, $Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$BadRequestCopyWithImpl<Model, $Res>
    extends _$NetworkResponseCopyWithImpl<Model, $Res, _$BadRequest<Model>>
    implements _$$BadRequestCopyWith<Model, $Res> {
  __$$BadRequestCopyWithImpl(
      _$BadRequest<Model> _value, $Res Function(_$BadRequest<Model>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$BadRequest<Model>(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BadRequest<Model> implements BadRequest<Model> {
  const _$BadRequest(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'NetworkResponse<$Model>.badRequest(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BadRequest<Model> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BadRequestCopyWith<Model, _$BadRequest<Model>> get copyWith =>
      __$$BadRequestCopyWithImpl<Model, _$BadRequest<Model>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) badRequest,
    required TResult Function(String message) conflict,
    required TResult Function(String message) invalidParameters,
    required TResult Function(String message) noAccess,
    required TResult Function(String message) noAuth,
    required TResult Function(String message) noData,
    required TResult Function(String message) notFound,
    required TResult Function(Model data) ok,
  }) {
    return badRequest(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? badRequest,
    TResult? Function(String message)? conflict,
    TResult? Function(String message)? invalidParameters,
    TResult? Function(String message)? noAccess,
    TResult? Function(String message)? noAuth,
    TResult? Function(String message)? noData,
    TResult? Function(String message)? notFound,
    TResult? Function(Model data)? ok,
  }) {
    return badRequest?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? badRequest,
    TResult Function(String message)? conflict,
    TResult Function(String message)? invalidParameters,
    TResult Function(String message)? noAccess,
    TResult Function(String message)? noAuth,
    TResult Function(String message)? noData,
    TResult Function(String message)? notFound,
    TResult Function(Model data)? ok,
    required TResult orElse(),
  }) {
    if (badRequest != null) {
      return badRequest(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BadRequest<Model> value) badRequest,
    required TResult Function(Conflict<Model> value) conflict,
    required TResult Function(InvalidParameters<Model> value) invalidParameters,
    required TResult Function(NoAccess<Model> value) noAccess,
    required TResult Function(NoAuth<Model> value) noAuth,
    required TResult Function(NoData<Model> value) noData,
    required TResult Function(NotFound<Model> value) notFound,
    required TResult Function(Ok<Model> value) ok,
  }) {
    return badRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BadRequest<Model> value)? badRequest,
    TResult? Function(Conflict<Model> value)? conflict,
    TResult? Function(InvalidParameters<Model> value)? invalidParameters,
    TResult? Function(NoAccess<Model> value)? noAccess,
    TResult? Function(NoAuth<Model> value)? noAuth,
    TResult? Function(NoData<Model> value)? noData,
    TResult? Function(NotFound<Model> value)? notFound,
    TResult? Function(Ok<Model> value)? ok,
  }) {
    return badRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BadRequest<Model> value)? badRequest,
    TResult Function(Conflict<Model> value)? conflict,
    TResult Function(InvalidParameters<Model> value)? invalidParameters,
    TResult Function(NoAccess<Model> value)? noAccess,
    TResult Function(NoAuth<Model> value)? noAuth,
    TResult Function(NoData<Model> value)? noData,
    TResult Function(NotFound<Model> value)? notFound,
    TResult Function(Ok<Model> value)? ok,
    required TResult orElse(),
  }) {
    if (badRequest != null) {
      return badRequest(this);
    }
    return orElse();
  }
}

abstract class BadRequest<Model> implements NetworkResponse<Model> {
  const factory BadRequest(final String message) = _$BadRequest<Model>;

  String get message;
  @JsonKey(ignore: true)
  _$$BadRequestCopyWith<Model, _$BadRequest<Model>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConflictCopyWith<Model, $Res> {
  factory _$$ConflictCopyWith(
          _$Conflict<Model> value, $Res Function(_$Conflict<Model>) then) =
      __$$ConflictCopyWithImpl<Model, $Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ConflictCopyWithImpl<Model, $Res>
    extends _$NetworkResponseCopyWithImpl<Model, $Res, _$Conflict<Model>>
    implements _$$ConflictCopyWith<Model, $Res> {
  __$$ConflictCopyWithImpl(
      _$Conflict<Model> _value, $Res Function(_$Conflict<Model>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$Conflict<Model>(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Conflict<Model> implements Conflict<Model> {
  const _$Conflict(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'NetworkResponse<$Model>.conflict(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Conflict<Model> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ConflictCopyWith<Model, _$Conflict<Model>> get copyWith =>
      __$$ConflictCopyWithImpl<Model, _$Conflict<Model>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) badRequest,
    required TResult Function(String message) conflict,
    required TResult Function(String message) invalidParameters,
    required TResult Function(String message) noAccess,
    required TResult Function(String message) noAuth,
    required TResult Function(String message) noData,
    required TResult Function(String message) notFound,
    required TResult Function(Model data) ok,
  }) {
    return conflict(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? badRequest,
    TResult? Function(String message)? conflict,
    TResult? Function(String message)? invalidParameters,
    TResult? Function(String message)? noAccess,
    TResult? Function(String message)? noAuth,
    TResult? Function(String message)? noData,
    TResult? Function(String message)? notFound,
    TResult? Function(Model data)? ok,
  }) {
    return conflict?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? badRequest,
    TResult Function(String message)? conflict,
    TResult Function(String message)? invalidParameters,
    TResult Function(String message)? noAccess,
    TResult Function(String message)? noAuth,
    TResult Function(String message)? noData,
    TResult Function(String message)? notFound,
    TResult Function(Model data)? ok,
    required TResult orElse(),
  }) {
    if (conflict != null) {
      return conflict(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BadRequest<Model> value) badRequest,
    required TResult Function(Conflict<Model> value) conflict,
    required TResult Function(InvalidParameters<Model> value) invalidParameters,
    required TResult Function(NoAccess<Model> value) noAccess,
    required TResult Function(NoAuth<Model> value) noAuth,
    required TResult Function(NoData<Model> value) noData,
    required TResult Function(NotFound<Model> value) notFound,
    required TResult Function(Ok<Model> value) ok,
  }) {
    return conflict(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BadRequest<Model> value)? badRequest,
    TResult? Function(Conflict<Model> value)? conflict,
    TResult? Function(InvalidParameters<Model> value)? invalidParameters,
    TResult? Function(NoAccess<Model> value)? noAccess,
    TResult? Function(NoAuth<Model> value)? noAuth,
    TResult? Function(NoData<Model> value)? noData,
    TResult? Function(NotFound<Model> value)? notFound,
    TResult? Function(Ok<Model> value)? ok,
  }) {
    return conflict?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BadRequest<Model> value)? badRequest,
    TResult Function(Conflict<Model> value)? conflict,
    TResult Function(InvalidParameters<Model> value)? invalidParameters,
    TResult Function(NoAccess<Model> value)? noAccess,
    TResult Function(NoAuth<Model> value)? noAuth,
    TResult Function(NoData<Model> value)? noData,
    TResult Function(NotFound<Model> value)? notFound,
    TResult Function(Ok<Model> value)? ok,
    required TResult orElse(),
  }) {
    if (conflict != null) {
      return conflict(this);
    }
    return orElse();
  }
}

abstract class Conflict<Model> implements NetworkResponse<Model> {
  const factory Conflict(final String message) = _$Conflict<Model>;

  String get message;
  @JsonKey(ignore: true)
  _$$ConflictCopyWith<Model, _$Conflict<Model>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InvalidParametersCopyWith<Model, $Res> {
  factory _$$InvalidParametersCopyWith(_$InvalidParameters<Model> value,
          $Res Function(_$InvalidParameters<Model>) then) =
      __$$InvalidParametersCopyWithImpl<Model, $Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$InvalidParametersCopyWithImpl<Model, $Res>
    extends _$NetworkResponseCopyWithImpl<Model, $Res,
        _$InvalidParameters<Model>>
    implements _$$InvalidParametersCopyWith<Model, $Res> {
  __$$InvalidParametersCopyWithImpl(_$InvalidParameters<Model> _value,
      $Res Function(_$InvalidParameters<Model>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$InvalidParameters<Model>(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InvalidParameters<Model> implements InvalidParameters<Model> {
  const _$InvalidParameters(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'NetworkResponse<$Model>.invalidParameters(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidParameters<Model> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvalidParametersCopyWith<Model, _$InvalidParameters<Model>>
      get copyWith =>
          __$$InvalidParametersCopyWithImpl<Model, _$InvalidParameters<Model>>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) badRequest,
    required TResult Function(String message) conflict,
    required TResult Function(String message) invalidParameters,
    required TResult Function(String message) noAccess,
    required TResult Function(String message) noAuth,
    required TResult Function(String message) noData,
    required TResult Function(String message) notFound,
    required TResult Function(Model data) ok,
  }) {
    return invalidParameters(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? badRequest,
    TResult? Function(String message)? conflict,
    TResult? Function(String message)? invalidParameters,
    TResult? Function(String message)? noAccess,
    TResult? Function(String message)? noAuth,
    TResult? Function(String message)? noData,
    TResult? Function(String message)? notFound,
    TResult? Function(Model data)? ok,
  }) {
    return invalidParameters?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? badRequest,
    TResult Function(String message)? conflict,
    TResult Function(String message)? invalidParameters,
    TResult Function(String message)? noAccess,
    TResult Function(String message)? noAuth,
    TResult Function(String message)? noData,
    TResult Function(String message)? notFound,
    TResult Function(Model data)? ok,
    required TResult orElse(),
  }) {
    if (invalidParameters != null) {
      return invalidParameters(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BadRequest<Model> value) badRequest,
    required TResult Function(Conflict<Model> value) conflict,
    required TResult Function(InvalidParameters<Model> value) invalidParameters,
    required TResult Function(NoAccess<Model> value) noAccess,
    required TResult Function(NoAuth<Model> value) noAuth,
    required TResult Function(NoData<Model> value) noData,
    required TResult Function(NotFound<Model> value) notFound,
    required TResult Function(Ok<Model> value) ok,
  }) {
    return invalidParameters(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BadRequest<Model> value)? badRequest,
    TResult? Function(Conflict<Model> value)? conflict,
    TResult? Function(InvalidParameters<Model> value)? invalidParameters,
    TResult? Function(NoAccess<Model> value)? noAccess,
    TResult? Function(NoAuth<Model> value)? noAuth,
    TResult? Function(NoData<Model> value)? noData,
    TResult? Function(NotFound<Model> value)? notFound,
    TResult? Function(Ok<Model> value)? ok,
  }) {
    return invalidParameters?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BadRequest<Model> value)? badRequest,
    TResult Function(Conflict<Model> value)? conflict,
    TResult Function(InvalidParameters<Model> value)? invalidParameters,
    TResult Function(NoAccess<Model> value)? noAccess,
    TResult Function(NoAuth<Model> value)? noAuth,
    TResult Function(NoData<Model> value)? noData,
    TResult Function(NotFound<Model> value)? notFound,
    TResult Function(Ok<Model> value)? ok,
    required TResult orElse(),
  }) {
    if (invalidParameters != null) {
      return invalidParameters(this);
    }
    return orElse();
  }
}

abstract class InvalidParameters<Model> implements NetworkResponse<Model> {
  const factory InvalidParameters(final String message) =
      _$InvalidParameters<Model>;

  String get message;
  @JsonKey(ignore: true)
  _$$InvalidParametersCopyWith<Model, _$InvalidParameters<Model>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NoAccessCopyWith<Model, $Res> {
  factory _$$NoAccessCopyWith(
          _$NoAccess<Model> value, $Res Function(_$NoAccess<Model>) then) =
      __$$NoAccessCopyWithImpl<Model, $Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NoAccessCopyWithImpl<Model, $Res>
    extends _$NetworkResponseCopyWithImpl<Model, $Res, _$NoAccess<Model>>
    implements _$$NoAccessCopyWith<Model, $Res> {
  __$$NoAccessCopyWithImpl(
      _$NoAccess<Model> _value, $Res Function(_$NoAccess<Model>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$NoAccess<Model>(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NoAccess<Model> implements NoAccess<Model> {
  const _$NoAccess(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'NetworkResponse<$Model>.noAccess(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoAccess<Model> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NoAccessCopyWith<Model, _$NoAccess<Model>> get copyWith =>
      __$$NoAccessCopyWithImpl<Model, _$NoAccess<Model>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) badRequest,
    required TResult Function(String message) conflict,
    required TResult Function(String message) invalidParameters,
    required TResult Function(String message) noAccess,
    required TResult Function(String message) noAuth,
    required TResult Function(String message) noData,
    required TResult Function(String message) notFound,
    required TResult Function(Model data) ok,
  }) {
    return noAccess(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? badRequest,
    TResult? Function(String message)? conflict,
    TResult? Function(String message)? invalidParameters,
    TResult? Function(String message)? noAccess,
    TResult? Function(String message)? noAuth,
    TResult? Function(String message)? noData,
    TResult? Function(String message)? notFound,
    TResult? Function(Model data)? ok,
  }) {
    return noAccess?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? badRequest,
    TResult Function(String message)? conflict,
    TResult Function(String message)? invalidParameters,
    TResult Function(String message)? noAccess,
    TResult Function(String message)? noAuth,
    TResult Function(String message)? noData,
    TResult Function(String message)? notFound,
    TResult Function(Model data)? ok,
    required TResult orElse(),
  }) {
    if (noAccess != null) {
      return noAccess(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BadRequest<Model> value) badRequest,
    required TResult Function(Conflict<Model> value) conflict,
    required TResult Function(InvalidParameters<Model> value) invalidParameters,
    required TResult Function(NoAccess<Model> value) noAccess,
    required TResult Function(NoAuth<Model> value) noAuth,
    required TResult Function(NoData<Model> value) noData,
    required TResult Function(NotFound<Model> value) notFound,
    required TResult Function(Ok<Model> value) ok,
  }) {
    return noAccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BadRequest<Model> value)? badRequest,
    TResult? Function(Conflict<Model> value)? conflict,
    TResult? Function(InvalidParameters<Model> value)? invalidParameters,
    TResult? Function(NoAccess<Model> value)? noAccess,
    TResult? Function(NoAuth<Model> value)? noAuth,
    TResult? Function(NoData<Model> value)? noData,
    TResult? Function(NotFound<Model> value)? notFound,
    TResult? Function(Ok<Model> value)? ok,
  }) {
    return noAccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BadRequest<Model> value)? badRequest,
    TResult Function(Conflict<Model> value)? conflict,
    TResult Function(InvalidParameters<Model> value)? invalidParameters,
    TResult Function(NoAccess<Model> value)? noAccess,
    TResult Function(NoAuth<Model> value)? noAuth,
    TResult Function(NoData<Model> value)? noData,
    TResult Function(NotFound<Model> value)? notFound,
    TResult Function(Ok<Model> value)? ok,
    required TResult orElse(),
  }) {
    if (noAccess != null) {
      return noAccess(this);
    }
    return orElse();
  }
}

abstract class NoAccess<Model> implements NetworkResponse<Model> {
  const factory NoAccess(final String message) = _$NoAccess<Model>;

  String get message;
  @JsonKey(ignore: true)
  _$$NoAccessCopyWith<Model, _$NoAccess<Model>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NoAuthCopyWith<Model, $Res> {
  factory _$$NoAuthCopyWith(
          _$NoAuth<Model> value, $Res Function(_$NoAuth<Model>) then) =
      __$$NoAuthCopyWithImpl<Model, $Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NoAuthCopyWithImpl<Model, $Res>
    extends _$NetworkResponseCopyWithImpl<Model, $Res, _$NoAuth<Model>>
    implements _$$NoAuthCopyWith<Model, $Res> {
  __$$NoAuthCopyWithImpl(
      _$NoAuth<Model> _value, $Res Function(_$NoAuth<Model>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$NoAuth<Model>(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NoAuth<Model> implements NoAuth<Model> {
  const _$NoAuth(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'NetworkResponse<$Model>.noAuth(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoAuth<Model> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NoAuthCopyWith<Model, _$NoAuth<Model>> get copyWith =>
      __$$NoAuthCopyWithImpl<Model, _$NoAuth<Model>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) badRequest,
    required TResult Function(String message) conflict,
    required TResult Function(String message) invalidParameters,
    required TResult Function(String message) noAccess,
    required TResult Function(String message) noAuth,
    required TResult Function(String message) noData,
    required TResult Function(String message) notFound,
    required TResult Function(Model data) ok,
  }) {
    return noAuth(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? badRequest,
    TResult? Function(String message)? conflict,
    TResult? Function(String message)? invalidParameters,
    TResult? Function(String message)? noAccess,
    TResult? Function(String message)? noAuth,
    TResult? Function(String message)? noData,
    TResult? Function(String message)? notFound,
    TResult? Function(Model data)? ok,
  }) {
    return noAuth?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? badRequest,
    TResult Function(String message)? conflict,
    TResult Function(String message)? invalidParameters,
    TResult Function(String message)? noAccess,
    TResult Function(String message)? noAuth,
    TResult Function(String message)? noData,
    TResult Function(String message)? notFound,
    TResult Function(Model data)? ok,
    required TResult orElse(),
  }) {
    if (noAuth != null) {
      return noAuth(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BadRequest<Model> value) badRequest,
    required TResult Function(Conflict<Model> value) conflict,
    required TResult Function(InvalidParameters<Model> value) invalidParameters,
    required TResult Function(NoAccess<Model> value) noAccess,
    required TResult Function(NoAuth<Model> value) noAuth,
    required TResult Function(NoData<Model> value) noData,
    required TResult Function(NotFound<Model> value) notFound,
    required TResult Function(Ok<Model> value) ok,
  }) {
    return noAuth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BadRequest<Model> value)? badRequest,
    TResult? Function(Conflict<Model> value)? conflict,
    TResult? Function(InvalidParameters<Model> value)? invalidParameters,
    TResult? Function(NoAccess<Model> value)? noAccess,
    TResult? Function(NoAuth<Model> value)? noAuth,
    TResult? Function(NoData<Model> value)? noData,
    TResult? Function(NotFound<Model> value)? notFound,
    TResult? Function(Ok<Model> value)? ok,
  }) {
    return noAuth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BadRequest<Model> value)? badRequest,
    TResult Function(Conflict<Model> value)? conflict,
    TResult Function(InvalidParameters<Model> value)? invalidParameters,
    TResult Function(NoAccess<Model> value)? noAccess,
    TResult Function(NoAuth<Model> value)? noAuth,
    TResult Function(NoData<Model> value)? noData,
    TResult Function(NotFound<Model> value)? notFound,
    TResult Function(Ok<Model> value)? ok,
    required TResult orElse(),
  }) {
    if (noAuth != null) {
      return noAuth(this);
    }
    return orElse();
  }
}

abstract class NoAuth<Model> implements NetworkResponse<Model> {
  const factory NoAuth(final String message) = _$NoAuth<Model>;

  String get message;
  @JsonKey(ignore: true)
  _$$NoAuthCopyWith<Model, _$NoAuth<Model>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NoDataCopyWith<Model, $Res> {
  factory _$$NoDataCopyWith(
          _$NoData<Model> value, $Res Function(_$NoData<Model>) then) =
      __$$NoDataCopyWithImpl<Model, $Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NoDataCopyWithImpl<Model, $Res>
    extends _$NetworkResponseCopyWithImpl<Model, $Res, _$NoData<Model>>
    implements _$$NoDataCopyWith<Model, $Res> {
  __$$NoDataCopyWithImpl(
      _$NoData<Model> _value, $Res Function(_$NoData<Model>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$NoData<Model>(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NoData<Model> implements NoData<Model> {
  const _$NoData(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'NetworkResponse<$Model>.noData(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NoData<Model> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NoDataCopyWith<Model, _$NoData<Model>> get copyWith =>
      __$$NoDataCopyWithImpl<Model, _$NoData<Model>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) badRequest,
    required TResult Function(String message) conflict,
    required TResult Function(String message) invalidParameters,
    required TResult Function(String message) noAccess,
    required TResult Function(String message) noAuth,
    required TResult Function(String message) noData,
    required TResult Function(String message) notFound,
    required TResult Function(Model data) ok,
  }) {
    return noData(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? badRequest,
    TResult? Function(String message)? conflict,
    TResult? Function(String message)? invalidParameters,
    TResult? Function(String message)? noAccess,
    TResult? Function(String message)? noAuth,
    TResult? Function(String message)? noData,
    TResult? Function(String message)? notFound,
    TResult? Function(Model data)? ok,
  }) {
    return noData?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? badRequest,
    TResult Function(String message)? conflict,
    TResult Function(String message)? invalidParameters,
    TResult Function(String message)? noAccess,
    TResult Function(String message)? noAuth,
    TResult Function(String message)? noData,
    TResult Function(String message)? notFound,
    TResult Function(Model data)? ok,
    required TResult orElse(),
  }) {
    if (noData != null) {
      return noData(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BadRequest<Model> value) badRequest,
    required TResult Function(Conflict<Model> value) conflict,
    required TResult Function(InvalidParameters<Model> value) invalidParameters,
    required TResult Function(NoAccess<Model> value) noAccess,
    required TResult Function(NoAuth<Model> value) noAuth,
    required TResult Function(NoData<Model> value) noData,
    required TResult Function(NotFound<Model> value) notFound,
    required TResult Function(Ok<Model> value) ok,
  }) {
    return noData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BadRequest<Model> value)? badRequest,
    TResult? Function(Conflict<Model> value)? conflict,
    TResult? Function(InvalidParameters<Model> value)? invalidParameters,
    TResult? Function(NoAccess<Model> value)? noAccess,
    TResult? Function(NoAuth<Model> value)? noAuth,
    TResult? Function(NoData<Model> value)? noData,
    TResult? Function(NotFound<Model> value)? notFound,
    TResult? Function(Ok<Model> value)? ok,
  }) {
    return noData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BadRequest<Model> value)? badRequest,
    TResult Function(Conflict<Model> value)? conflict,
    TResult Function(InvalidParameters<Model> value)? invalidParameters,
    TResult Function(NoAccess<Model> value)? noAccess,
    TResult Function(NoAuth<Model> value)? noAuth,
    TResult Function(NoData<Model> value)? noData,
    TResult Function(NotFound<Model> value)? notFound,
    TResult Function(Ok<Model> value)? ok,
    required TResult orElse(),
  }) {
    if (noData != null) {
      return noData(this);
    }
    return orElse();
  }
}

abstract class NoData<Model> implements NetworkResponse<Model> {
  const factory NoData(final String message) = _$NoData<Model>;

  String get message;
  @JsonKey(ignore: true)
  _$$NoDataCopyWith<Model, _$NoData<Model>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotFoundCopyWith<Model, $Res> {
  factory _$$NotFoundCopyWith(
          _$NotFound<Model> value, $Res Function(_$NotFound<Model>) then) =
      __$$NotFoundCopyWithImpl<Model, $Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NotFoundCopyWithImpl<Model, $Res>
    extends _$NetworkResponseCopyWithImpl<Model, $Res, _$NotFound<Model>>
    implements _$$NotFoundCopyWith<Model, $Res> {
  __$$NotFoundCopyWithImpl(
      _$NotFound<Model> _value, $Res Function(_$NotFound<Model>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$NotFound<Model>(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NotFound<Model> implements NotFound<Model> {
  const _$NotFound(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'NetworkResponse<$Model>.notFound(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotFound<Model> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotFoundCopyWith<Model, _$NotFound<Model>> get copyWith =>
      __$$NotFoundCopyWithImpl<Model, _$NotFound<Model>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) badRequest,
    required TResult Function(String message) conflict,
    required TResult Function(String message) invalidParameters,
    required TResult Function(String message) noAccess,
    required TResult Function(String message) noAuth,
    required TResult Function(String message) noData,
    required TResult Function(String message) notFound,
    required TResult Function(Model data) ok,
  }) {
    return notFound(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? badRequest,
    TResult? Function(String message)? conflict,
    TResult? Function(String message)? invalidParameters,
    TResult? Function(String message)? noAccess,
    TResult? Function(String message)? noAuth,
    TResult? Function(String message)? noData,
    TResult? Function(String message)? notFound,
    TResult? Function(Model data)? ok,
  }) {
    return notFound?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? badRequest,
    TResult Function(String message)? conflict,
    TResult Function(String message)? invalidParameters,
    TResult Function(String message)? noAccess,
    TResult Function(String message)? noAuth,
    TResult Function(String message)? noData,
    TResult Function(String message)? notFound,
    TResult Function(Model data)? ok,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BadRequest<Model> value) badRequest,
    required TResult Function(Conflict<Model> value) conflict,
    required TResult Function(InvalidParameters<Model> value) invalidParameters,
    required TResult Function(NoAccess<Model> value) noAccess,
    required TResult Function(NoAuth<Model> value) noAuth,
    required TResult Function(NoData<Model> value) noData,
    required TResult Function(NotFound<Model> value) notFound,
    required TResult Function(Ok<Model> value) ok,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BadRequest<Model> value)? badRequest,
    TResult? Function(Conflict<Model> value)? conflict,
    TResult? Function(InvalidParameters<Model> value)? invalidParameters,
    TResult? Function(NoAccess<Model> value)? noAccess,
    TResult? Function(NoAuth<Model> value)? noAuth,
    TResult? Function(NoData<Model> value)? noData,
    TResult? Function(NotFound<Model> value)? notFound,
    TResult? Function(Ok<Model> value)? ok,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BadRequest<Model> value)? badRequest,
    TResult Function(Conflict<Model> value)? conflict,
    TResult Function(InvalidParameters<Model> value)? invalidParameters,
    TResult Function(NoAccess<Model> value)? noAccess,
    TResult Function(NoAuth<Model> value)? noAuth,
    TResult Function(NoData<Model> value)? noData,
    TResult Function(NotFound<Model> value)? notFound,
    TResult Function(Ok<Model> value)? ok,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class NotFound<Model> implements NetworkResponse<Model> {
  const factory NotFound(final String message) = _$NotFound<Model>;

  String get message;
  @JsonKey(ignore: true)
  _$$NotFoundCopyWith<Model, _$NotFound<Model>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OkCopyWith<Model, $Res> {
  factory _$$OkCopyWith(_$Ok<Model> value, $Res Function(_$Ok<Model>) then) =
      __$$OkCopyWithImpl<Model, $Res>;
  @useResult
  $Res call({Model data});
}

/// @nodoc
class __$$OkCopyWithImpl<Model, $Res>
    extends _$NetworkResponseCopyWithImpl<Model, $Res, _$Ok<Model>>
    implements _$$OkCopyWith<Model, $Res> {
  __$$OkCopyWithImpl(_$Ok<Model> _value, $Res Function(_$Ok<Model>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$Ok<Model>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Model,
    ));
  }
}

/// @nodoc

class _$Ok<Model> implements Ok<Model> {
  const _$Ok(this.data);

  @override
  final Model data;

  @override
  String toString() {
    return 'NetworkResponse<$Model>.ok(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Ok<Model> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OkCopyWith<Model, _$Ok<Model>> get copyWith =>
      __$$OkCopyWithImpl<Model, _$Ok<Model>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) badRequest,
    required TResult Function(String message) conflict,
    required TResult Function(String message) invalidParameters,
    required TResult Function(String message) noAccess,
    required TResult Function(String message) noAuth,
    required TResult Function(String message) noData,
    required TResult Function(String message) notFound,
    required TResult Function(Model data) ok,
  }) {
    return ok(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? badRequest,
    TResult? Function(String message)? conflict,
    TResult? Function(String message)? invalidParameters,
    TResult? Function(String message)? noAccess,
    TResult? Function(String message)? noAuth,
    TResult? Function(String message)? noData,
    TResult? Function(String message)? notFound,
    TResult? Function(Model data)? ok,
  }) {
    return ok?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? badRequest,
    TResult Function(String message)? conflict,
    TResult Function(String message)? invalidParameters,
    TResult Function(String message)? noAccess,
    TResult Function(String message)? noAuth,
    TResult Function(String message)? noData,
    TResult Function(String message)? notFound,
    TResult Function(Model data)? ok,
    required TResult orElse(),
  }) {
    if (ok != null) {
      return ok(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BadRequest<Model> value) badRequest,
    required TResult Function(Conflict<Model> value) conflict,
    required TResult Function(InvalidParameters<Model> value) invalidParameters,
    required TResult Function(NoAccess<Model> value) noAccess,
    required TResult Function(NoAuth<Model> value) noAuth,
    required TResult Function(NoData<Model> value) noData,
    required TResult Function(NotFound<Model> value) notFound,
    required TResult Function(Ok<Model> value) ok,
  }) {
    return ok(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BadRequest<Model> value)? badRequest,
    TResult? Function(Conflict<Model> value)? conflict,
    TResult? Function(InvalidParameters<Model> value)? invalidParameters,
    TResult? Function(NoAccess<Model> value)? noAccess,
    TResult? Function(NoAuth<Model> value)? noAuth,
    TResult? Function(NoData<Model> value)? noData,
    TResult? Function(NotFound<Model> value)? notFound,
    TResult? Function(Ok<Model> value)? ok,
  }) {
    return ok?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BadRequest<Model> value)? badRequest,
    TResult Function(Conflict<Model> value)? conflict,
    TResult Function(InvalidParameters<Model> value)? invalidParameters,
    TResult Function(NoAccess<Model> value)? noAccess,
    TResult Function(NoAuth<Model> value)? noAuth,
    TResult Function(NoData<Model> value)? noData,
    TResult Function(NotFound<Model> value)? notFound,
    TResult Function(Ok<Model> value)? ok,
    required TResult orElse(),
  }) {
    if (ok != null) {
      return ok(this);
    }
    return orElse();
  }
}

abstract class Ok<Model> implements NetworkResponse<Model> {
  const factory Ok(final Model data) = _$Ok<Model>;

  Model get data;
  @JsonKey(ignore: true)
  _$$OkCopyWith<Model, _$Ok<Model>> get copyWith =>
      throw _privateConstructorUsedError;
}
