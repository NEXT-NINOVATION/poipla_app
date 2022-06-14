// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  int get id => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;
  int get exp => throw _privateConstructorUsedError;
  int get point => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_pet')
  int get totalPet => throw _privateConstructorUsedError;
  @JsonKey(name: 'costume_id')
  int get costumeId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {int id,
      int level,
      int exp,
      int point,
      String? name,
      @JsonKey(name: 'total_pet') int totalPet,
      @JsonKey(name: 'costume_id') int costumeId});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? level = freezed,
    Object? exp = freezed,
    Object? point = freezed,
    Object? name = freezed,
    Object? totalPet = freezed,
    Object? costumeId = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      level: level == freezed
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      exp: exp == freezed
          ? _value.exp
          : exp // ignore: cast_nullable_to_non_nullable
              as int,
      point: point == freezed
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      totalPet: totalPet == freezed
          ? _value.totalPet
          : totalPet // ignore: cast_nullable_to_non_nullable
              as int,
      costumeId: costumeId == freezed
          ? _value.costumeId
          : costumeId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      int level,
      int exp,
      int point,
      String? name,
      @JsonKey(name: 'total_pet') int totalPet,
      @JsonKey(name: 'costume_id') int costumeId});
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, (v) => _then(v as _$_User));

  @override
  _$_User get _value => super._value as _$_User;

  @override
  $Res call({
    Object? id = freezed,
    Object? level = freezed,
    Object? exp = freezed,
    Object? point = freezed,
    Object? name = freezed,
    Object? totalPet = freezed,
    Object? costumeId = freezed,
  }) {
    return _then(_$_User(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      level: level == freezed
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      exp: exp == freezed
          ? _value.exp
          : exp // ignore: cast_nullable_to_non_nullable
              as int,
      point: point == freezed
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      totalPet: totalPet == freezed
          ? _value.totalPet
          : totalPet // ignore: cast_nullable_to_non_nullable
              as int,
      costumeId: costumeId == freezed
          ? _value.costumeId
          : costumeId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User extends _User {
  _$_User(
      {required this.id,
      required this.level,
      required this.exp,
      required this.point,
      required this.name,
      @JsonKey(name: 'total_pet') required this.totalPet,
      @JsonKey(name: 'costume_id') required this.costumeId})
      : super._();

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  final int id;
  @override
  final int level;
  @override
  final int exp;
  @override
  final int point;
  @override
  final String? name;
  @override
  @JsonKey(name: 'total_pet')
  final int totalPet;
  @override
  @JsonKey(name: 'costume_id')
  final int costumeId;

  @override
  String toString() {
    return 'User(id: $id, level: $level, exp: $exp, point: $point, name: $name, totalPet: $totalPet, costumeId: $costumeId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.level, level) &&
            const DeepCollectionEquality().equals(other.exp, exp) &&
            const DeepCollectionEquality().equals(other.point, point) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.totalPet, totalPet) &&
            const DeepCollectionEquality().equals(other.costumeId, costumeId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(level),
      const DeepCollectionEquality().hash(exp),
      const DeepCollectionEquality().hash(point),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(totalPet),
      const DeepCollectionEquality().hash(costumeId));

  @JsonKey(ignore: true)
  @override
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(this);
  }
}

abstract class _User extends User {
  factory _User(
      {required final int id,
      required final int level,
      required final int exp,
      required final int point,
      required final String? name,
      @JsonKey(name: 'total_pet') required final int totalPet,
      @JsonKey(name: 'costume_id') required final int costumeId}) = _$_User;
  _User._() : super._();

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  int get level => throw _privateConstructorUsedError;
  @override
  int get exp => throw _privateConstructorUsedError;
  @override
  int get point => throw _privateConstructorUsedError;
  @override
  String? get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'total_pet')
  int get totalPet => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'costume_id')
  int get costumeId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}
