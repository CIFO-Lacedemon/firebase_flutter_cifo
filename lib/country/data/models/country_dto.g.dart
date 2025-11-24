// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryDto _$CountryDtoFromJson(Map<String, dynamic> json) => CountryDto(
  tld: (json['tld'] as List<dynamic>).map((e) => e as String).toList(),
  cca2: json['cca2'] as String,
  cca3: json['cca3'] as String,
  ccn3: json['ccn3'] as String,
  cioc: json['cioc'] as String,
  independent: json['independent'] as bool,
  status: json['status'] as String,
  unMember: json['unMember'] as bool,
  region: json['region'] as String,
  subregion: json['subregion'] as String,
  capital: (json['capital'] as List<dynamic>).map((e) => e as String).toList(),
  area: (json['area'] as num).toDouble(),
  population: (json['population'] as num).toInt(),
  latlng: (json['latlng'] as List<dynamic>)
      .map((e) => (e as num).toDouble())
      .toList(),
  borders: (json['borders'] as List<dynamic>).map((e) => e as String).toList(),
  flag: json['flag'] as String,
  fifa: json['fifa'] as String,
  landlocked: json['landlocked'] as bool,
  timezones: (json['timezones'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  continents: (json['continents'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$CountryDtoToJson(CountryDto instance) =>
    <String, dynamic>{
      'tld': instance.tld,
      'cca2': instance.cca2,
      'cca3': instance.cca3,
      'ccn3': instance.ccn3,
      'cioc': instance.cioc,
      'independent': instance.independent,
      'status': instance.status,
      'unMember': instance.unMember,
      'region': instance.region,
      'subregion': instance.subregion,
      'capital': instance.capital,
      'area': instance.area,
      'population': instance.population,
      'latlng': instance.latlng,
      'borders': instance.borders,
      'flag': instance.flag,
      'fifa': instance.fifa,
      'landlocked': instance.landlocked,
      'timezones': instance.timezones,
      'continents': instance.continents,
    };
