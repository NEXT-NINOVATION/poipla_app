// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Session _$SessionFromJson(Map<String, dynamic> json) {
  return _Session.fromJson(json);
}

/// @nodoc
mixin _$Session {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'dust_box_id')
  int get dustBoxId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'completed_at')
  DateTime? get completedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SessionCopyWith<Session> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionCopyWith<$Res> {
  factory $SessionCopyWith(Session value, $Res Function(Session) then) =
      _$SessionCopyWithImpl<$Res>;
  $Res call(
      {int id,
      @JsonKey(name: 'dust_box_id') int dustBoxId,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'completed_at') DateTime? completedAt});
}

/// @nodoc
class _$SessionCopyWithImpl<$Res> implements $SessionCopyWith<$Res> {
  _$SessionCopyWithImpl(this._value, this._then);

  final Session _value;
  // ignore: unused_field
  final $Res Function(Session) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? dustBoxId = freezed,
    Object? createdAt = freezed,
    Object? completedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      dustBoxId: dustBoxId == freezed
          ? _value.dustBoxId
          : dustBoxId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completedAt: completedAt == freezed
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$$_SessionCopyWith<$Res> implements $SessionCopyWith<$Res> {
  factory _$$_SessionCopyWith(
          _$_Session value, $Res Function(_$_Session) then) =
      __$$_SessionCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      @JsonKey(name: 'dust_box_id') int dustBoxId,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'completed_at') DateTime? completedAt});
}

/// @nodoc
class __$$_SessionCopyWithImpl<$Res> extends _$SessionCopyWithImpl<$Res>
    implements _$$_SessionCopyWith<$Res> {
  __$$_SessionCopyWithImpl(_$_Session _value, $Res Function(_$_Session) _then)
      : super(_value, (v) => _then(v as _$_Session));

  @override
  _$_Session get _value => super._value as _$_Session;

  @override
  $Res call({
    Object? id = freezed,
    Object? dustBoxId = freezed,
    Object? createdAt = freezed,
    Object? completedAt = freezed,
  }) {
    return _then(_$_Session(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      dustBoxId: dustBoxId == freezed
          ? _value.dustBoxId
          : dustBoxId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completedAt: completedAt == freezed
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Session extends _Session {
  _$_Session(
      {required this.id,
      @JsonKey(name: 'dust_box_id') required this.dustBoxId,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'completed_at') required this.completedAt})
      : super._();

  factory _$_Session.fromJson(Map<String, dynamic> json) =>
      _$$_SessionFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'dust_box_id')
  final int dustBoxId;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'completed_at')
  final DateTime? completedAt;

  @override
  String toString() {
    return 'Session(id: $id, dustBoxId: $dustBoxId, createdAt: $createdAt, completedAt: $completedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Session &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.dustBoxId, dustBoxId) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality()
                .equals(other.completedAt, completedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(dustBoxId),
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(completedAt));

  @JsonKey(ignore: true)
  @override
  _$$_SessionCopyWith<_$_Session> get copyWith =>
      __$$_SessionCopyWithImpl<_$_Session>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SessionToJson(this);
  }
}

abstract class _Session extends Session {
  factory _Session(
      {required final int id,
      @JsonKey(name: 'dust_box_id')
          required final int dustBoxId,
      @JsonKey(name: 'created_at')
          required final DateTime createdAt,
      @JsonKey(name: 'completed_at')
          required final DateTime? completedAt}) = _$_Session;
  _Session._() : super._();

  factory _Session.fromJson(Map<String, dynamic> json) = _$_Session.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'dust_box_id')
  int get dustBoxId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'completed_at')
  DateTime? get completedAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SessionCopyWith<_$_Session> get copyWith =>
      throw _privateConstructorUsedError;
}
