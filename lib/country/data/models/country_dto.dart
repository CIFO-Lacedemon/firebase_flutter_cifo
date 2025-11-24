import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_dto.g.dart';

@JsonSerializable()
class CountryDto {
  final List<String> tld;
  final String cca2;
  final String cca3;
  final String ccn3;
  final String cioc;
  final bool independent;
  final String status;
  final bool unMember;
  final String region;
  final String subregion;
  final List<String> capital;
  final double area;
  final int population;
  final List<double> latlng;
  final List<String> borders;
  final String flag;
  final String fifa;
  final bool landlocked;
  final List<String> timezones;
  final List<String> continents;

  CountryDto({
    required this.tld,
    required this.cca2,
    required this.cca3,
    required this.ccn3,
    required this.cioc,
    required this.independent,
    required this.status,
    required this.unMember,
    required this.region,
    required this.subregion,
    required this.capital,
    required this.area,
    required this.population,
    required this.latlng,
    required this.borders,
    required this.flag,
    required this.fifa,
    required this.landlocked,
    required this.timezones,
    required this.continents,
  });

  factory CountryDto.fromJson(Map<String, dynamic> json) =>
      _$CountryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CountryDtoToJson(this);
}
