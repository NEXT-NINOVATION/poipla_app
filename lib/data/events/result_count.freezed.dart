// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result_count.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ResultCount _$ResultCountFromJson(Map<String, dynamic> json) {
  return _ResultCount.fromJson(json);
}

/// @nodoc
mixin _$ResultCount {
  int get count => throw _privateConstructorUsedError;
  Session get session => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResultCountCopyWith<ResultCount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultCountCopyWith<$Res> {
  factory $ResultCountCopyWith(
          ResultCount value, $Res Function(ResultCount) then) =
      _$ResultCountCopyWithImpl<$Res, ResultCount>;
  @useResult
  $Res call({int count, Session session});

  $SessionCopyWith<$Res> get session;
}

/// @nodoc
class _$ResultCountCopyWithImpl<$Res, $Val extends ResultCount>
    implements $ResultCountCopyWith<$Res> {
  _$ResultCountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? session = null,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      session: null == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as Session,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SessionCopyWith<$Res> get session {
    return $SessionCopyWith<$Res>(_value.session, (value) {
      return _then(_value.copyWith(session: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ResultCountCopyWith<$Res>
    implements $ResultCountCopyWith<$Res> {
  factory _$$_ResultCountCopyWith(
          _$_ResultCount value, $Res Function(_$_ResultCount) then) =
      __$$_ResultCountCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int count, Session session});

  @override
  $SessionCopyWith<$Res> get session;
}

/// @nodoc
class __$$_ResultCountCopyWithImpl<$Res>
    extends _$ResultCountCopyWithImpl<$Res, _$_ResultCount>
    implements _$$_ResultCountCopyWith<$Res> {
  __$$_ResultCountCopyWithImpl(
      _$_ResultCount _value, $Res Function(_$_ResultCount) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? session = null,
  }) {
    return _then(_$_ResultCount(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      session: null == session
          ? _value.session
          : session // ignore: cast_nullable_to_non_nullable
              as Session,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ResultCount implements _ResultCount {
  _$_ResultCount({required this.count, required this.session});

  factory _$_ResultCount.fromJson(Map<String, dynamic> json) =>
      _$$_ResultCountFromJson(json);

  @override
  final int count;
  @override
  final Session session;

  @override
  String toString() {
    return 'ResultCount(count: $count, session: $session)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResultCount &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.session, session) || other.session == session));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, count, session);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResultCountCopyWith<_$_ResultCount> get copyWith =>
      __$$_ResultCountCopyWithImpl<_$_ResultCount>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResultCountToJson(
      this,
    );
  }
}

abstract class _ResultCount implements ResultCount {
  factory _ResultCount(
      {required final int count,
      required final Session session}) = _$_ResultCount;

  factory _ResultCount.fromJson(Map<String, dynamic> json) =
      _$_ResultCount.fromJson;

  @override
  int get count;
  @override
  Session get session;
  @override
  @JsonKey(ignore: true)
  _$$_ResultCountCopyWith<_$_ResultCount> get copyWith =>
      throw _privateConstructorUsedError;
}
