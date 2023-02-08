// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'costume.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Costume _$CostumeFromJson(Map<String, dynamic> json) {
  return _Costume.fromJson(json);
}

/// @nodoc
mixin _$Costume {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'costume_name')
  String get costumeName => throw _privateConstructorUsedError;
  String get image => throw _privateConstructorUsedError;
  int? get rarity => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'animal_type')
  String get animalType => throw _privateConstructorUsedError;
  @JsonKey(name: 'pref_id')
  int? get prefId => throw _privateConstructorUsedError;
  @JsonKey(name: 'event_id')
  int? get eventId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CostumeCopyWith<Costume> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CostumeCopyWith<$Res> {
  factory $CostumeCopyWith(Costume value, $Res Function(Costume) then) =
      _$CostumeCopyWithImpl<$Res, Costume>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'costume_name') String costumeName,
      String image,
      int? rarity,
      String? description,
      @JsonKey(name: 'animal_type') String animalType,
      @JsonKey(name: 'pref_id') int? prefId,
      @JsonKey(name: 'event_id') int? eventId});
}

/// @nodoc
class _$CostumeCopyWithImpl<$Res, $Val extends Costume>
    implements $CostumeCopyWith<$Res> {
  _$CostumeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? costumeName = null,
    Object? image = null,
    Object? rarity = freezed,
    Object? description = freezed,
    Object? animalType = null,
    Object? prefId = freezed,
    Object? eventId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      costumeName: null == costumeName
          ? _value.costumeName
          : costumeName // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      rarity: freezed == rarity
          ? _value.rarity
          : rarity // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      animalType: null == animalType
          ? _value.animalType
          : animalType // ignore: cast_nullable_to_non_nullable
              as String,
      prefId: freezed == prefId
          ? _value.prefId
          : prefId // ignore: cast_nullable_to_non_nullable
              as int?,
      eventId: freezed == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CostumeCopyWith<$Res> implements $CostumeCopyWith<$Res> {
  factory _$$_CostumeCopyWith(
          _$_Costume value, $Res Function(_$_Costume) then) =
      __$$_CostumeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'costume_name') String costumeName,
      String image,
      int? rarity,
      String? description,
      @JsonKey(name: 'animal_type') String animalType,
      @JsonKey(name: 'pref_id') int? prefId,
      @JsonKey(name: 'event_id') int? eventId});
}

/// @nodoc
class __$$_CostumeCopyWithImpl<$Res>
    extends _$CostumeCopyWithImpl<$Res, _$_Costume>
    implements _$$_CostumeCopyWith<$Res> {
  __$$_CostumeCopyWithImpl(_$_Costume _value, $Res Function(_$_Costume) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? costumeName = null,
    Object? image = null,
    Object? rarity = freezed,
    Object? description = freezed,
    Object? animalType = null,
    Object? prefId = freezed,
    Object? eventId = freezed,
  }) {
    return _then(_$_Costume(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      costumeName: null == costumeName
          ? _value.costumeName
          : costumeName // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      rarity: freezed == rarity
          ? _value.rarity
          : rarity // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      animalType: null == animalType
          ? _value.animalType
          : animalType // ignore: cast_nullable_to_non_nullable
              as String,
      prefId: freezed == prefId
          ? _value.prefId
          : prefId // ignore: cast_nullable_to_non_nullable
              as int?,
      eventId: freezed == eventId
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Costume implements _Costume {
  _$_Costume(
      {required this.id,
      @JsonKey(name: 'costume_name') required this.costumeName,
      required this.image,
      required this.rarity,
      this.description,
      @JsonKey(name: 'animal_type') required this.animalType,
      @JsonKey(name: 'pref_id') this.prefId,
      @JsonKey(name: 'event_id') this.eventId});

  factory _$_Costume.fromJson(Map<String, dynamic> json) =>
      _$$_CostumeFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'costume_name')
  final String costumeName;
  @override
  final String image;
  @override
  final int? rarity;
  @override
  final String? description;
  @override
  @JsonKey(name: 'animal_type')
  final String animalType;
  @override
  @JsonKey(name: 'pref_id')
  final int? prefId;
  @override
  @JsonKey(name: 'event_id')
  final int? eventId;

  @override
  String toString() {
    return 'Costume(id: $id, costumeName: $costumeName, image: $image, rarity: $rarity, description: $description, animalType: $animalType, prefId: $prefId, eventId: $eventId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Costume &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.costumeName, costumeName) ||
                other.costumeName == costumeName) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.rarity, rarity) || other.rarity == rarity) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.animalType, animalType) ||
                other.animalType == animalType) &&
            (identical(other.prefId, prefId) || other.prefId == prefId) &&
            (identical(other.eventId, eventId) || other.eventId == eventId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, costumeName, image, rarity,
      description, animalType, prefId, eventId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CostumeCopyWith<_$_Costume> get copyWith =>
      __$$_CostumeCopyWithImpl<_$_Costume>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CostumeToJson(
      this,
    );
  }
}

abstract class _Costume implements Costume {
  factory _Costume(
      {required final int id,
      @JsonKey(name: 'costume_name') required final String costumeName,
      required final String image,
      required final int? rarity,
      final String? description,
      @JsonKey(name: 'animal_type') required final String animalType,
      @JsonKey(name: 'pref_id') final int? prefId,
      @JsonKey(name: 'event_id') final int? eventId}) = _$_Costume;

  factory _Costume.fromJson(Map<String, dynamic> json) = _$_Costume.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'costume_name')
  String get costumeName;
  @override
  String get image;
  @override
  int? get rarity;
  @override
  String? get description;
  @override
  @JsonKey(name: 'animal_type')
  String get animalType;
  @override
  @JsonKey(name: 'pref_id')
  int? get prefId;
  @override
  @JsonKey(name: 'event_id')
  int? get eventId;
  @override
  @JsonKey(ignore: true)
  _$$_CostumeCopyWith<_$_Costume> get copyWith =>
      throw _privateConstructorUsedError;
}
