// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'clutter_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ClutterResult _$ClutterResultFromJson(Map<String, dynamic> json) {
  return _ClutterResult.fromJson(json);
}

/// @nodoc
mixin _$ClutterResult {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'costume_id')
  int? get costumeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'session_id')
  int get sessionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'earn_exp')
  int? get earnExp => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'costume')
  Costume? get costume => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClutterResultCopyWith<ClutterResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClutterResultCopyWith<$Res> {
  factory $ClutterResultCopyWith(
          ClutterResult value, $Res Function(ClutterResult) then) =
      _$ClutterResultCopyWithImpl<$Res>;
  $Res call(
      {int id,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'costume_id') int? costumeId,
      @JsonKey(name: 'session_id') int sessionId,
      @JsonKey(name: 'earn_exp') int? earnExp,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'costume') Costume? costume});

  $CostumeCopyWith<$Res>? get costume;
}

/// @nodoc
class _$ClutterResultCopyWithImpl<$Res>
    implements $ClutterResultCopyWith<$Res> {
  _$ClutterResultCopyWithImpl(this._value, this._then);

  final ClutterResult _value;
  // ignore: unused_field
  final $Res Function(ClutterResult) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? costumeId = freezed,
    Object? sessionId = freezed,
    Object? earnExp = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? costume = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      costumeId: costumeId == freezed
          ? _value.costumeId
          : costumeId // ignore: cast_nullable_to_non_nullable
              as int?,
      sessionId: sessionId == freezed
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as int,
      earnExp: earnExp == freezed
          ? _value.earnExp
          : earnExp // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      costume: costume == freezed
          ? _value.costume
          : costume // ignore: cast_nullable_to_non_nullable
              as Costume?,
    ));
  }

  @override
  $CostumeCopyWith<$Res>? get costume {
    if (_value.costume == null) {
      return null;
    }

    return $CostumeCopyWith<$Res>(_value.costume!, (value) {
      return _then(_value.copyWith(costume: value));
    });
  }
}

/// @nodoc
abstract class _$$_ClutterResultCopyWith<$Res>
    implements $ClutterResultCopyWith<$Res> {
  factory _$$_ClutterResultCopyWith(
          _$_ClutterResult value, $Res Function(_$_ClutterResult) then) =
      __$$_ClutterResultCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'costume_id') int? costumeId,
      @JsonKey(name: 'session_id') int sessionId,
      @JsonKey(name: 'earn_exp') int? earnExp,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'costume') Costume? costume});

  @override
  $CostumeCopyWith<$Res>? get costume;
}

/// @nodoc
class __$$_ClutterResultCopyWithImpl<$Res>
    extends _$ClutterResultCopyWithImpl<$Res>
    implements _$$_ClutterResultCopyWith<$Res> {
  __$$_ClutterResultCopyWithImpl(
      _$_ClutterResult _value, $Res Function(_$_ClutterResult) _then)
      : super(_value, (v) => _then(v as _$_ClutterResult));

  @override
  _$_ClutterResult get _value => super._value as _$_ClutterResult;

  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? costumeId = freezed,
    Object? sessionId = freezed,
    Object? earnExp = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? costume = freezed,
  }) {
    return _then(_$_ClutterResult(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      costumeId: costumeId == freezed
          ? _value.costumeId
          : costumeId // ignore: cast_nullable_to_non_nullable
              as int?,
      sessionId: sessionId == freezed
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as int,
      earnExp: earnExp == freezed
          ? _value.earnExp
          : earnExp // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      costume: costume == freezed
          ? _value.costume
          : costume // ignore: cast_nullable_to_non_nullable
              as Costume?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ClutterResult implements _ClutterResult {
  _$_ClutterResult(
      {required this.id,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'costume_id') required this.costumeId,
      @JsonKey(name: 'session_id') required this.sessionId,
      @JsonKey(name: 'earn_exp') required this.earnExp,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'costume') required this.costume});

  factory _$_ClutterResult.fromJson(Map<String, dynamic> json) =>
      _$$_ClutterResultFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  @JsonKey(name: 'costume_id')
  final int? costumeId;
  @override
  @JsonKey(name: 'session_id')
  final int sessionId;
  @override
  @JsonKey(name: 'earn_exp')
  final int? earnExp;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'costume')
  final Costume? costume;

  @override
  String toString() {
    return 'ClutterResult(id: $id, userId: $userId, costumeId: $costumeId, sessionId: $sessionId, earnExp: $earnExp, createdAt: $createdAt, updatedAt: $updatedAt, costume: $costume)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ClutterResult &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.costumeId, costumeId) &&
            const DeepCollectionEquality().equals(other.sessionId, sessionId) &&
            const DeepCollectionEquality().equals(other.earnExp, earnExp) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality().equals(other.updatedAt, updatedAt) &&
            const DeepCollectionEquality().equals(other.costume, costume));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(costumeId),
      const DeepCollectionEquality().hash(sessionId),
      const DeepCollectionEquality().hash(earnExp),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt),
      const DeepCollectionEquality().hash(costume));

  @JsonKey(ignore: true)
  @override
  _$$_ClutterResultCopyWith<_$_ClutterResult> get copyWith =>
      __$$_ClutterResultCopyWithImpl<_$_ClutterResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ClutterResultToJson(this);
  }
}

abstract class _ClutterResult implements ClutterResult {
  factory _ClutterResult(
          {required final int id,
          @JsonKey(name: 'user_id') required final int userId,
          @JsonKey(name: 'costume_id') required final int? costumeId,
          @JsonKey(name: 'session_id') required final int sessionId,
          @JsonKey(name: 'earn_exp') required final int? earnExp,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          @JsonKey(name: 'updated_at') required final DateTime updatedAt,
          @JsonKey(name: 'costume') required final Costume? costume}) =
      _$_ClutterResult;

  factory _ClutterResult.fromJson(Map<String, dynamic> json) =
      _$_ClutterResult.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'costume_id')
  int? get costumeId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'session_id')
  int get sessionId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'earn_exp')
  int? get earnExp => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'costume')
  Costume? get costume => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_ClutterResultCopyWith<_$_ClutterResult> get copyWith =>
      throw _privateConstructorUsedError;
}
