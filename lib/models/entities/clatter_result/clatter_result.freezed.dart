// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'clatter_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ClatterResult _$ClatterResultFromJson(Map<String, dynamic> json) {
  return _ClatterResult.fromJson(json);
}

/// @nodoc
mixin _$ClatterResult {
  int get id => throw _privateConstructorUsedError;
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
  $ClatterResultCopyWith<ClatterResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClatterResultCopyWith<$Res> {
  factory $ClatterResultCopyWith(
          ClatterResult value, $Res Function(ClatterResult) then) =
      _$ClatterResultCopyWithImpl<$Res>;
  $Res call(
      {int id,
      @JsonKey(name: 'costume_id') int? costumeId,
      @JsonKey(name: 'session_id') int sessionId,
      @JsonKey(name: 'earn_exp') int? earnExp,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'costume') Costume? costume});

  $CostumeCopyWith<$Res>? get costume;
}

/// @nodoc
class _$ClatterResultCopyWithImpl<$Res>
    implements $ClatterResultCopyWith<$Res> {
  _$ClatterResultCopyWithImpl(this._value, this._then);

  final ClatterResult _value;
  // ignore: unused_field
  final $Res Function(ClatterResult) _then;

  @override
  $Res call({
    Object? id = freezed,
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
abstract class _$$_ClatterResultCopyWith<$Res>
    implements $ClatterResultCopyWith<$Res> {
  factory _$$_ClatterResultCopyWith(
          _$_ClatterResult value, $Res Function(_$_ClatterResult) then) =
      __$$_ClatterResultCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
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
class __$$_ClatterResultCopyWithImpl<$Res>
    extends _$ClatterResultCopyWithImpl<$Res>
    implements _$$_ClatterResultCopyWith<$Res> {
  __$$_ClatterResultCopyWithImpl(
      _$_ClatterResult _value, $Res Function(_$_ClatterResult) _then)
      : super(_value, (v) => _then(v as _$_ClatterResult));

  @override
  _$_ClatterResult get _value => super._value as _$_ClatterResult;

  @override
  $Res call({
    Object? id = freezed,
    Object? costumeId = freezed,
    Object? sessionId = freezed,
    Object? earnExp = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? costume = freezed,
  }) {
    return _then(_$_ClatterResult(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
class _$_ClatterResult implements _ClatterResult {
  _$_ClatterResult(
      {required this.id,
      @JsonKey(name: 'costume_id') required this.costumeId,
      @JsonKey(name: 'session_id') required this.sessionId,
      @JsonKey(name: 'earn_exp') required this.earnExp,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'costume') required this.costume});

  factory _$_ClatterResult.fromJson(Map<String, dynamic> json) =>
      _$$_ClatterResultFromJson(json);

  @override
  final int id;
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
    return 'ClatterResult(id: $id, costumeId: $costumeId, sessionId: $sessionId, earnExp: $earnExp, createdAt: $createdAt, updatedAt: $updatedAt, costume: $costume)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ClatterResult &&
            const DeepCollectionEquality().equals(other.id, id) &&
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
      const DeepCollectionEquality().hash(costumeId),
      const DeepCollectionEquality().hash(sessionId),
      const DeepCollectionEquality().hash(earnExp),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(updatedAt),
      const DeepCollectionEquality().hash(costume));

  @JsonKey(ignore: true)
  @override
  _$$_ClatterResultCopyWith<_$_ClatterResult> get copyWith =>
      __$$_ClatterResultCopyWithImpl<_$_ClatterResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ClatterResultToJson(this);
  }
}

abstract class _ClatterResult implements ClatterResult {
  factory _ClatterResult(
          {required final int id,
          @JsonKey(name: 'costume_id') required final int? costumeId,
          @JsonKey(name: 'session_id') required final int sessionId,
          @JsonKey(name: 'earn_exp') required final int? earnExp,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          @JsonKey(name: 'updated_at') required final DateTime updatedAt,
          @JsonKey(name: 'costume') required final Costume? costume}) =
      _$_ClatterResult;

  factory _ClatterResult.fromJson(Map<String, dynamic> json) =
      _$_ClatterResult.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
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
  _$$_ClatterResultCopyWith<_$_ClatterResult> get copyWith =>
      throw _privateConstructorUsedError;
}
