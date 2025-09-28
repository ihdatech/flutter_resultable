// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Result<F,S> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Result<F, S>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Result<$F, $S>()';
}


}

/// @nodoc
class $ResultCopyWith<F,S,$Res>  {
$ResultCopyWith(Result<F, S> _, $Res Function(Result<F, S>) __);
}


/// @nodoc


class Failure<F,S> implements Result<F, S> {
  const Failure(this.failure);
  

 final  F failure;

/// Create a copy of Result
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailureCopyWith<F, S, Failure<F, S>> get copyWith => _$FailureCopyWithImpl<F, S, Failure<F, S>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure<F, S>&&const DeepCollectionEquality().equals(other.failure, failure));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(failure));

@override
String toString() {
  return 'Result<$F, $S>.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $FailureCopyWith<F,S,$Res> implements $ResultCopyWith<F, S, $Res> {
  factory $FailureCopyWith(Failure<F, S> value, $Res Function(Failure<F, S>) _then) = _$FailureCopyWithImpl;
@useResult
$Res call({
 F failure
});




}
/// @nodoc
class _$FailureCopyWithImpl<F,S,$Res>
    implements $FailureCopyWith<F, S, $Res> {
  _$FailureCopyWithImpl(this._self, this._then);

  final Failure<F, S> _self;
  final $Res Function(Failure<F, S>) _then;

/// Create a copy of Result
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = freezed,}) {
  return _then(Failure<F, S>(
freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as F,
  ));
}


}

/// @nodoc


class Success<F,S> implements Result<F, S> {
  const Success(this.success);
  

 final  S success;

/// Create a copy of Result
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SuccessCopyWith<F, S, Success<F, S>> get copyWith => _$SuccessCopyWithImpl<F, S, Success<F, S>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Success<F, S>&&const DeepCollectionEquality().equals(other.success, success));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(success));

@override
String toString() {
  return 'Result<$F, $S>.success(success: $success)';
}


}

/// @nodoc
abstract mixin class $SuccessCopyWith<F,S,$Res> implements $ResultCopyWith<F, S, $Res> {
  factory $SuccessCopyWith(Success<F, S> value, $Res Function(Success<F, S>) _then) = _$SuccessCopyWithImpl;
@useResult
$Res call({
 S success
});




}
/// @nodoc
class _$SuccessCopyWithImpl<F,S,$Res>
    implements $SuccessCopyWith<F, S, $Res> {
  _$SuccessCopyWithImpl(this._self, this._then);

  final Success<F, S> _self;
  final $Res Function(Success<F, S>) _then;

/// Create a copy of Result
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? success = freezed,}) {
  return _then(Success<F, S>(
freezed == success ? _self.success : success // ignore: cast_nullable_to_non_nullable
as S,
  ));
}


}

// dart format on
