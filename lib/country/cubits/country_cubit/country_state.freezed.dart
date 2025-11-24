// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'country_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CountryState {

 String? get countrySelectedName; CountryDto? get selectedCountry; StatusCountry get status;
/// Create a copy of CountryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CountryStateCopyWith<CountryState> get copyWith => _$CountryStateCopyWithImpl<CountryState>(this as CountryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CountryState&&(identical(other.countrySelectedName, countrySelectedName) || other.countrySelectedName == countrySelectedName)&&(identical(other.selectedCountry, selectedCountry) || other.selectedCountry == selectedCountry)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,countrySelectedName,selectedCountry,status);

@override
String toString() {
  return 'CountryState(countrySelectedName: $countrySelectedName, selectedCountry: $selectedCountry, status: $status)';
}


}

/// @nodoc
abstract mixin class $CountryStateCopyWith<$Res>  {
  factory $CountryStateCopyWith(CountryState value, $Res Function(CountryState) _then) = _$CountryStateCopyWithImpl;
@useResult
$Res call({
 String? countrySelectedName, CountryDto? selectedCountry, StatusCountry status
});




}
/// @nodoc
class _$CountryStateCopyWithImpl<$Res>
    implements $CountryStateCopyWith<$Res> {
  _$CountryStateCopyWithImpl(this._self, this._then);

  final CountryState _self;
  final $Res Function(CountryState) _then;

/// Create a copy of CountryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? countrySelectedName = freezed,Object? selectedCountry = freezed,Object? status = null,}) {
  return _then(_self.copyWith(
countrySelectedName: freezed == countrySelectedName ? _self.countrySelectedName : countrySelectedName // ignore: cast_nullable_to_non_nullable
as String?,selectedCountry: freezed == selectedCountry ? _self.selectedCountry : selectedCountry // ignore: cast_nullable_to_non_nullable
as CountryDto?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StatusCountry,
  ));
}

}


/// Adds pattern-matching-related methods to [CountryState].
extension CountryStatePatterns on CountryState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CountryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CountryState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CountryState value)  $default,){
final _that = this;
switch (_that) {
case _CountryState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CountryState value)?  $default,){
final _that = this;
switch (_that) {
case _CountryState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? countrySelectedName,  CountryDto? selectedCountry,  StatusCountry status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CountryState() when $default != null:
return $default(_that.countrySelectedName,_that.selectedCountry,_that.status);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? countrySelectedName,  CountryDto? selectedCountry,  StatusCountry status)  $default,) {final _that = this;
switch (_that) {
case _CountryState():
return $default(_that.countrySelectedName,_that.selectedCountry,_that.status);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? countrySelectedName,  CountryDto? selectedCountry,  StatusCountry status)?  $default,) {final _that = this;
switch (_that) {
case _CountryState() when $default != null:
return $default(_that.countrySelectedName,_that.selectedCountry,_that.status);case _:
  return null;

}
}

}

/// @nodoc


class _CountryState implements CountryState {
  const _CountryState({this.countrySelectedName = null, this.selectedCountry = null, this.status = StatusCountry.initial});
  

@override@JsonKey() final  String? countrySelectedName;
@override@JsonKey() final  CountryDto? selectedCountry;
@override@JsonKey() final  StatusCountry status;

/// Create a copy of CountryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CountryStateCopyWith<_CountryState> get copyWith => __$CountryStateCopyWithImpl<_CountryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CountryState&&(identical(other.countrySelectedName, countrySelectedName) || other.countrySelectedName == countrySelectedName)&&(identical(other.selectedCountry, selectedCountry) || other.selectedCountry == selectedCountry)&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,countrySelectedName,selectedCountry,status);

@override
String toString() {
  return 'CountryState(countrySelectedName: $countrySelectedName, selectedCountry: $selectedCountry, status: $status)';
}


}

/// @nodoc
abstract mixin class _$CountryStateCopyWith<$Res> implements $CountryStateCopyWith<$Res> {
  factory _$CountryStateCopyWith(_CountryState value, $Res Function(_CountryState) _then) = __$CountryStateCopyWithImpl;
@override @useResult
$Res call({
 String? countrySelectedName, CountryDto? selectedCountry, StatusCountry status
});




}
/// @nodoc
class __$CountryStateCopyWithImpl<$Res>
    implements _$CountryStateCopyWith<$Res> {
  __$CountryStateCopyWithImpl(this._self, this._then);

  final _CountryState _self;
  final $Res Function(_CountryState) _then;

/// Create a copy of CountryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? countrySelectedName = freezed,Object? selectedCountry = freezed,Object? status = null,}) {
  return _then(_CountryState(
countrySelectedName: freezed == countrySelectedName ? _self.countrySelectedName : countrySelectedName // ignore: cast_nullable_to_non_nullable
as String?,selectedCountry: freezed == selectedCountry ? _self.selectedCountry : selectedCountry // ignore: cast_nullable_to_non_nullable
as CountryDto?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as StatusCountry,
  ));
}


}

// dart format on
