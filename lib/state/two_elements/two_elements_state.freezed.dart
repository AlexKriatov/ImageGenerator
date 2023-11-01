// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'two_elements_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TwoElementsState {
  ImageFile? get image1 => throw _privateConstructorUsedError;
  ImageFile? get image2 => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TwoElementsStateCopyWith<TwoElementsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TwoElementsStateCopyWith<$Res> {
  factory $TwoElementsStateCopyWith(
          TwoElementsState value, $Res Function(TwoElementsState) then) =
      _$TwoElementsStateCopyWithImpl<$Res, TwoElementsState>;
  @useResult
  $Res call({ImageFile? image1, ImageFile? image2});
}

/// @nodoc
class _$TwoElementsStateCopyWithImpl<$Res, $Val extends TwoElementsState>
    implements $TwoElementsStateCopyWith<$Res> {
  _$TwoElementsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image1 = freezed,
    Object? image2 = freezed,
  }) {
    return _then(_value.copyWith(
      image1: freezed == image1
          ? _value.image1
          : image1 // ignore: cast_nullable_to_non_nullable
              as ImageFile?,
      image2: freezed == image2
          ? _value.image2
          : image2 // ignore: cast_nullable_to_non_nullable
              as ImageFile?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TwoElementsStateImplCopyWith<$Res>
    implements $TwoElementsStateCopyWith<$Res> {
  factory _$$TwoElementsStateImplCopyWith(_$TwoElementsStateImpl value,
          $Res Function(_$TwoElementsStateImpl) then) =
      __$$TwoElementsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ImageFile? image1, ImageFile? image2});
}

/// @nodoc
class __$$TwoElementsStateImplCopyWithImpl<$Res>
    extends _$TwoElementsStateCopyWithImpl<$Res, _$TwoElementsStateImpl>
    implements _$$TwoElementsStateImplCopyWith<$Res> {
  __$$TwoElementsStateImplCopyWithImpl(_$TwoElementsStateImpl _value,
      $Res Function(_$TwoElementsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image1 = freezed,
    Object? image2 = freezed,
  }) {
    return _then(_$TwoElementsStateImpl(
      image1: freezed == image1
          ? _value.image1
          : image1 // ignore: cast_nullable_to_non_nullable
              as ImageFile?,
      image2: freezed == image2
          ? _value.image2
          : image2 // ignore: cast_nullable_to_non_nullable
              as ImageFile?,
    ));
  }
}

/// @nodoc

class _$TwoElementsStateImpl implements _TwoElementsState {
  const _$TwoElementsStateImpl({this.image1 = null, this.image2 = null});

  @override
  @JsonKey()
  final ImageFile? image1;
  @override
  @JsonKey()
  final ImageFile? image2;

  @override
  String toString() {
    return 'TwoElementsState(image1: $image1, image2: $image2)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TwoElementsStateImpl &&
            (identical(other.image1, image1) || other.image1 == image1) &&
            (identical(other.image2, image2) || other.image2 == image2));
  }

  @override
  int get hashCode => Object.hash(runtimeType, image1, image2);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TwoElementsStateImplCopyWith<_$TwoElementsStateImpl> get copyWith =>
      __$$TwoElementsStateImplCopyWithImpl<_$TwoElementsStateImpl>(
          this, _$identity);
}

abstract class _TwoElementsState implements TwoElementsState {
  const factory _TwoElementsState(
      {final ImageFile? image1,
      final ImageFile? image2}) = _$TwoElementsStateImpl;

  @override
  ImageFile? get image1;
  @override
  ImageFile? get image2;
  @override
  @JsonKey(ignore: true)
  _$$TwoElementsStateImplCopyWith<_$TwoElementsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
