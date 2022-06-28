// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
      _$CostumeCopyWithImpl<$Res>;
  $Res call(
      {int id,
      @JsonKey(name: 'costume_name') String costumeName,
      String image,
      int? rarity,
      @JsonKey(name: 'pref_id') int? prefId,
      @JsonKey(name: 'event_id') int? eventId});
}

/// @nodoc
class _$CostumeCopyWithImpl<$Res> implements $CostumeCopyWith<$Res> {
  _$CostumeCopyWithImpl(this._value, this._then);

  final Costume _value;
  // ignore: unused_field
  final $Res Function(Costume) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? costumeName = freezed,
    Object? image = freezed,
    Object? rarity = freezed,
    Object? prefId = freezed,
    Object? eventId = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      costumeName: costumeName == freezed
          ? _value.costumeName
          : costumeName // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      rarity: rarity == freezed
          ? _value.rarity
          : rarity // ignore: cast_nullable_to_non_nullable
              as int?,
      prefId: prefId == freezed
          ? _value.prefId
          : prefId // ignore: cast_nullable_to_non_nullable
              as int?,
      eventId: eventId == freezed
          ? _value.eventId
          : eventId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$$_CostumeCopyWith<$Res> implements $CostumeCopyWith<$Res> {
  factory _$$_CostumeCopyWith(
          _$_Costume value, $Res Function(_$_Costume) then) =
      __$$_CostumeCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      @JsonKey(name: 'costume_name') String costumeName,
      String image,
      int? rarity,
      @JsonKey(name: 'pref_id') int? prefId,
      @JsonKey(name: 'event_id') int? eventId});
}

/// @nodoc
class __$$_CostumeCopyWithImpl<$Res> extends _$CostumeCopyWithImpl<$Res>
    implements _$$_CostumeCopyWith<$Res> {
  __$$_CostumeCopyWithImpl(_$_Costume _value, $Res Function(_$_Costume) _then)
      : super(_value, (v) => _then(v as _$_Costume));

  @override
  _$_Costume get _value => super._value as _$_Costume;

  @override
  $Res call({
    Object? id = freezed,
    Object? costumeName = freezed,
    Object? image = freezed,
    Object? rarity = freezed,
    Object? prefId = freezed,
    Object? eventId = freezed,
  }) {
    return _then(_$_Costume(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      costumeName: costumeName == freezed
          ? _value.costumeName
          : costumeName // ignore: cast_nullable_to_non_nullable
              as String,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      rarity: rarity == freezed
          ? _value.rarity
          : rarity // ignore: cast_nullable_to_non_nullable
              as int?,
      prefId: prefId == freezed
          ? _value.prefId
          : prefId // ignore: cast_nullable_to_non_nullable
              as int?,
      eventId: eventId == freezed
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
  @JsonKey(name: 'pref_id')
  final int? prefId;
  @override
  @JsonKey(name: 'event_id')
  final int? eventId;

  @override
  String toString() {
    return 'Costume(id: $id, costumeName: $costumeName, image: $image, rarity: $rarity, prefId: $prefId, eventId: $eventId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Costume &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality()
                .equals(other.costumeName, costumeName) &&
            const DeepCollectionEquality().equals(other.image, image) &&
            const DeepCollectionEquality().equals(other.rarity, rarity) &&
            const DeepCollectionEquality().equals(other.prefId, prefId) &&
            const DeepCollectionEquality().equals(other.eventId, eventId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(costumeName),
      const DeepCollectionEquality().hash(image),
      const DeepCollectionEquality().hash(rarity),
      const DeepCollectionEquality().hash(prefId),
      const DeepCollectionEquality().hash(eventId));

  @JsonKey(ignore: true)
  @override
  _$$_CostumeCopyWith<_$_Costume> get copyWith =>
      __$$_CostumeCopyWithImpl<_$_Costume>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CostumeToJson(this);
  }
}

abstract class _Costume implements Costume {
  factory _Costume(
      {required final int id,
      @JsonKey(name: 'costume_name') required final String costumeName,
      required final String image,
      required final int? rarity,
      @JsonKey(name: 'pref_id') final int? prefId,
      @JsonKey(name: 'event_id') final int? eventId}) = _$_Costume;

  factory _Costume.fromJson(Map<String, dynamic> json) = _$_Costume.fromJson;

  @override
  int get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'costume_name')
  String get costumeName => throw _privateConstructorUsedError;
  @override
  String get image => throw _privateConstructorUsedError;
  @override
  int? get rarity => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'pref_id')
  int? get prefId => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'event_id')
  int? get eventId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_CostumeCopyWith<_$_Costume> get copyWith =>
      throw _privateConstructorUsedError;
}
