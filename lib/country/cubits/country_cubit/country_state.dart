import 'package:firebase_flutter_cifo/country/data/models/country_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_state.freezed.dart';

enum StatusCountry { initial, loading, success, error }

@freezed
abstract class CountryState with _$CountryState {
  const factory CountryState({
    @Default(null) String? countrySelectedName,
    @Default(null) CountryDto? selectedCountry,
    @Default(StatusCountry.initial) StatusCountry status,
  }) = _CountryState;
}
