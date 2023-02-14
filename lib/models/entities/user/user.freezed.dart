// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

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
  int? get costumeId => throw _privateConstructorUsedError;
  Costume? get costume => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {int id,
      int level,
      int exp,
      int point,
      String? name,
      @JsonKey(name: 'total_pet') int totalPet,
      @JsonKey(name: 'costume_id') int? costumeId,
      Costume? costume});

  $CostumeCopyWith<$Res>? get costume;
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? level = null,
    Object? exp = null,
    Object? point = null,
    Object? name = freezed,
    Object? totalPet = null,
    Object? costumeId = freezed,
    Object? costume = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      exp: null == exp
          ? _value.exp
          : exp // ignore: cast_nullable_to_non_nullable
              as int,
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      totalPet: null == totalPet
          ? _value.totalPet
          : totalPet // ignore: cast_nullable_to_non_nullable
              as int,
      costumeId: freezed == costumeId
          ? _value.costumeId
          : costumeId // ignore: cast_nullable_to_non_nullable
              as int?,
      costume: freezed == costume
          ? _value.costume
          : costume // ignore: cast_nullable_to_non_nullable
              as Costume?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CostumeCopyWith<$Res>? get costume {
    if (_value.costume == null) {
      return null;
    }

    return $CostumeCopyWith<$Res>(_value.costume!, (value) {
      return _then(_value.copyWith(costume: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int level,
      int exp,
      int point,
      String? name,
      @JsonKey(name: 'total_pet') int totalPet,
      @JsonKey(name: 'costume_id') int? costumeId,
      Costume? costume});

  @override
  $CostumeCopyWith<$Res>? get costume;
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res, _$_User>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? level = null,
    Object? exp = null,
    Object? point = null,
    Object? name = freezed,
    Object? totalPet = null,
    Object? costumeId = freezed,
    Object? costume = freezed,
  }) {
    return _then(_$_User(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      exp: null == exp
          ? _value.exp
          : exp // ignore: cast_nullable_to_non_nullable
              as int,
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      totalPet: null == totalPet
          ? _value.totalPet
          : totalPet // ignore: cast_nullable_to_non_nullable
              as int,
      costumeId: freezed == costumeId
          ? _value.costumeId
          : costumeId // ignore: cast_nullable_to_non_nullable
              as int?,
      costume: freezed == costume
          ? _value.costume
          : costume // ignore: cast_nullable_to_non_nullable
              as Costume?,
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
      @JsonKey(name: 'costume_id') required this.costumeId,
      this.costume})
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
  final int? costumeId;
  @override
  final Costume? costume;

  @override
  String toString() {
    return 'User(id: $id, level: $level, exp: $exp, point: $point, name: $name, totalPet: $totalPet, costumeId: $costumeId, costume: $costume)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.exp, exp) || other.exp == exp) &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.totalPet, totalPet) ||
                other.totalPet == totalPet) &&
            (identical(other.costumeId, costumeId) ||
                other.costumeId == costumeId) &&
            (identical(other.costume, costume) || other.costume == costume));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, level, exp, point, name, totalPet, costumeId, costume);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(
      this,
    );
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
      @JsonKey(name: 'costume_id') required final int? costumeId,
      final Costume? costume}) = _$_User;
  _User._() : super._();

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  int get id;
  @override
  int get level;
  @override
  int get exp;
  @override
  int get point;
  @override
  String? get name;
  @override
  @JsonKey(name: 'total_pet')
  int get totalPet;
  @override
  @JsonKey(name: 'costume_id')
  int? get costumeId;
  @override
  Costume? get costume;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}
