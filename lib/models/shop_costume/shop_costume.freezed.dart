// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_costume.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ShopCostume _$ShopCostumeFromJson(Map<String, dynamic> json) {
  return _ShopCostume.fromJson(json);
}

/// @nodoc
mixin _$ShopCostume {
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'costume_id')
  String get costumeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ShopCostumeCopyWith<ShopCostume> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopCostumeCopyWith<$Res> {
  factory $ShopCostumeCopyWith(
          ShopCostume value, $Res Function(ShopCostume) then) =
      _$ShopCostumeCopyWithImpl<$Res, ShopCostume>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'costume_id') String costumeId,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'id') String id});
}

/// @nodoc
class _$ShopCostumeCopyWithImpl<$Res, $Val extends ShopCostume>
    implements $ShopCostumeCopyWith<$Res> {
  _$ShopCostumeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? costumeId = null,
    Object? updatedAt = null,
    Object? createdAt = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      costumeId: null == costumeId
          ? _value.costumeId
          : costumeId // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ShopCostumeCopyWith<$Res>
    implements $ShopCostumeCopyWith<$Res> {
  factory _$$_ShopCostumeCopyWith(
          _$_ShopCostume value, $Res Function(_$_ShopCostume) then) =
      __$$_ShopCostumeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'costume_id') String costumeId,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'id') String id});
}

/// @nodoc
class __$$_ShopCostumeCopyWithImpl<$Res>
    extends _$ShopCostumeCopyWithImpl<$Res, _$_ShopCostume>
    implements _$$_ShopCostumeCopyWith<$Res> {
  __$$_ShopCostumeCopyWithImpl(
      _$_ShopCostume _value, $Res Function(_$_ShopCostume) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? costumeId = null,
    Object? updatedAt = null,
    Object? createdAt = null,
    Object? id = null,
  }) {
    return _then(_$_ShopCostume(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      costumeId: null == costumeId
          ? _value.costumeId
          : costumeId // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ShopCostume implements _ShopCostume {
  _$_ShopCostume(
      {@JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'costume_id') required this.costumeId,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'id') required this.id});

  factory _$_ShopCostume.fromJson(Map<String, dynamic> json) =>
      _$$_ShopCostumeFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'costume_id')
  final String costumeId;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'id')
  final String id;

  @override
  String toString() {
    return 'ShopCostume(userId: $userId, costumeId: $costumeId, updatedAt: $updatedAt, createdAt: $createdAt, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShopCostume &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.costumeId, costumeId) ||
                other.costumeId == costumeId) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, costumeId, updatedAt, createdAt, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ShopCostumeCopyWith<_$_ShopCostume> get copyWith =>
      __$$_ShopCostumeCopyWithImpl<_$_ShopCostume>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ShopCostumeToJson(
      this,
    );
  }
}

abstract class _ShopCostume implements ShopCostume {
  factory _ShopCostume(
      {@JsonKey(name: 'user_id') required final String userId,
      @JsonKey(name: 'costume_id') required final String costumeId,
      @JsonKey(name: 'updated_at') required final DateTime updatedAt,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'id') required final String id}) = _$_ShopCostume;

  factory _ShopCostume.fromJson(Map<String, dynamic> json) =
      _$_ShopCostume.fromJson;

  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'costume_id')
  String get costumeId;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$_ShopCostumeCopyWith<_$_ShopCostume> get copyWith =>
      throw _privateConstructorUsedError;
}
