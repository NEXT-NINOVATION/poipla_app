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
  @JsonKey(name: 'costume_id')
  int get costumeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'costume_name')
  String get costumeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'animal_type')
  String get animalType => throw _privateConstructorUsedError;
  @JsonKey(name: 'req_lv')
  int? get reqLv => throw _privateConstructorUsedError;
  @JsonKey(name: 'image')
  String get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'rarity')
  int get rarity => throw _privateConstructorUsedError;
  @JsonKey(name: 'point')
  int? get point => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_costume')
  bool get hasCostume => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_buyable')
  bool get isBuyable => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'costume_id') int costumeId,
      @JsonKey(name: 'costume_name') String costumeName,
      @JsonKey(name: 'animal_type') String animalType,
      @JsonKey(name: 'req_lv') int? reqLv,
      @JsonKey(name: 'image') String image,
      @JsonKey(name: 'rarity') int rarity,
      @JsonKey(name: 'point') int? point,
      @JsonKey(name: 'has_costume') bool hasCostume,
      @JsonKey(name: 'is_buyable') bool isBuyable});
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
    Object? costumeId = null,
    Object? costumeName = null,
    Object? animalType = null,
    Object? reqLv = freezed,
    Object? image = null,
    Object? rarity = null,
    Object? point = freezed,
    Object? hasCostume = null,
    Object? isBuyable = null,
  }) {
    return _then(_value.copyWith(
      costumeId: null == costumeId
          ? _value.costumeId
          : costumeId // ignore: cast_nullable_to_non_nullable
              as int,
      costumeName: null == costumeName
          ? _value.costumeName
          : costumeName // ignore: cast_nullable_to_non_nullable
              as String,
      animalType: null == animalType
          ? _value.animalType
          : animalType // ignore: cast_nullable_to_non_nullable
              as String,
      reqLv: freezed == reqLv
          ? _value.reqLv
          : reqLv // ignore: cast_nullable_to_non_nullable
              as int?,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      rarity: null == rarity
          ? _value.rarity
          : rarity // ignore: cast_nullable_to_non_nullable
              as int,
      point: freezed == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int?,
      hasCostume: null == hasCostume
          ? _value.hasCostume
          : hasCostume // ignore: cast_nullable_to_non_nullable
              as bool,
      isBuyable: null == isBuyable
          ? _value.isBuyable
          : isBuyable // ignore: cast_nullable_to_non_nullable
              as bool,
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
      {@JsonKey(name: 'costume_id') int costumeId,
      @JsonKey(name: 'costume_name') String costumeName,
      @JsonKey(name: 'animal_type') String animalType,
      @JsonKey(name: 'req_lv') int? reqLv,
      @JsonKey(name: 'image') String image,
      @JsonKey(name: 'rarity') int rarity,
      @JsonKey(name: 'point') int? point,
      @JsonKey(name: 'has_costume') bool hasCostume,
      @JsonKey(name: 'is_buyable') bool isBuyable});
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
    Object? costumeId = null,
    Object? costumeName = null,
    Object? animalType = null,
    Object? reqLv = freezed,
    Object? image = null,
    Object? rarity = null,
    Object? point = freezed,
    Object? hasCostume = null,
    Object? isBuyable = null,
  }) {
    return _then(_$_ShopCostume(
      costumeId: null == costumeId
          ? _value.costumeId
          : costumeId // ignore: cast_nullable_to_non_nullable
              as int,
      costumeName: null == costumeName
          ? _value.costumeName
          : costumeName // ignore: cast_nullable_to_non_nullable
              as String,
      animalType: null == animalType
          ? _value.animalType
          : animalType // ignore: cast_nullable_to_non_nullable
              as String,
      reqLv: freezed == reqLv
          ? _value.reqLv
          : reqLv // ignore: cast_nullable_to_non_nullable
              as int?,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      rarity: null == rarity
          ? _value.rarity
          : rarity // ignore: cast_nullable_to_non_nullable
              as int,
      point: freezed == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int?,
      hasCostume: null == hasCostume
          ? _value.hasCostume
          : hasCostume // ignore: cast_nullable_to_non_nullable
              as bool,
      isBuyable: null == isBuyable
          ? _value.isBuyable
          : isBuyable // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ShopCostume implements _ShopCostume {
  _$_ShopCostume(
      {@JsonKey(name: 'costume_id') required this.costumeId,
      @JsonKey(name: 'costume_name') required this.costumeName,
      @JsonKey(name: 'animal_type') required this.animalType,
      @JsonKey(name: 'req_lv') required this.reqLv,
      @JsonKey(name: 'image') required this.image,
      @JsonKey(name: 'rarity') required this.rarity,
      @JsonKey(name: 'point') required this.point,
      @JsonKey(name: 'has_costume') required this.hasCostume,
      @JsonKey(name: 'is_buyable') required this.isBuyable});

  factory _$_ShopCostume.fromJson(Map<String, dynamic> json) =>
      _$$_ShopCostumeFromJson(json);

  @override
  @JsonKey(name: 'costume_id')
  final int costumeId;
  @override
  @JsonKey(name: 'costume_name')
  final String costumeName;
  @override
  @JsonKey(name: 'animal_type')
  final String animalType;
  @override
  @JsonKey(name: 'req_lv')
  final int? reqLv;
  @override
  @JsonKey(name: 'image')
  final String image;
  @override
  @JsonKey(name: 'rarity')
  final int rarity;
  @override
  @JsonKey(name: 'point')
  final int? point;
  @override
  @JsonKey(name: 'has_costume')
  final bool hasCostume;
  @override
  @JsonKey(name: 'is_buyable')
  final bool isBuyable;

  @override
  String toString() {
    return 'ShopCostume(costumeId: $costumeId, costumeName: $costumeName, animalType: $animalType, reqLv: $reqLv, image: $image, rarity: $rarity, point: $point, hasCostume: $hasCostume, isBuyable: $isBuyable)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ShopCostume &&
            (identical(other.costumeId, costumeId) ||
                other.costumeId == costumeId) &&
            (identical(other.costumeName, costumeName) ||
                other.costumeName == costumeName) &&
            (identical(other.animalType, animalType) ||
                other.animalType == animalType) &&
            (identical(other.reqLv, reqLv) || other.reqLv == reqLv) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.rarity, rarity) || other.rarity == rarity) &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.hasCostume, hasCostume) ||
                other.hasCostume == hasCostume) &&
            (identical(other.isBuyable, isBuyable) ||
                other.isBuyable == isBuyable));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, costumeId, costumeName,
      animalType, reqLv, image, rarity, point, hasCostume, isBuyable);

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
          {@JsonKey(name: 'costume_id') required final int costumeId,
          @JsonKey(name: 'costume_name') required final String costumeName,
          @JsonKey(name: 'animal_type') required final String animalType,
          @JsonKey(name: 'req_lv') required final int? reqLv,
          @JsonKey(name: 'image') required final String image,
          @JsonKey(name: 'rarity') required final int rarity,
          @JsonKey(name: 'point') required final int? point,
          @JsonKey(name: 'has_costume') required final bool hasCostume,
          @JsonKey(name: 'is_buyable') required final bool isBuyable}) =
      _$_ShopCostume;

  factory _ShopCostume.fromJson(Map<String, dynamic> json) =
      _$_ShopCostume.fromJson;

  @override
  @JsonKey(name: 'costume_id')
  int get costumeId;
  @override
  @JsonKey(name: 'costume_name')
  String get costumeName;
  @override
  @JsonKey(name: 'animal_type')
  String get animalType;
  @override
  @JsonKey(name: 'req_lv')
  int? get reqLv;
  @override
  @JsonKey(name: 'image')
  String get image;
  @override
  @JsonKey(name: 'rarity')
  int get rarity;
  @override
  @JsonKey(name: 'point')
  int? get point;
  @override
  @JsonKey(name: 'has_costume')
  bool get hasCostume;
  @override
  @JsonKey(name: 'is_buyable')
  bool get isBuyable;
  @override
  @JsonKey(ignore: true)
  _$$_ShopCostumeCopyWith<_$_ShopCostume> get copyWith =>
      throw _privateConstructorUsedError;
}
