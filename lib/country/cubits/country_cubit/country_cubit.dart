import 'package:firebase_flutter_cifo/country/cubits/country_cubit/country_state.dart';
import 'package:firebase_flutter_cifo/country/data/models/country_dto.dart';
import 'package:firebase_flutter_cifo/country/data/repository/country_api_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryCubit extends Cubit<CountryState> {
  CountryCubit() : super(CountryState());

  Future<void> getCountryByName(String name) async {
    emit(state.copyWith(status: StatusCountry.loading));
    CountryDto? myCountry = await CountryApiRepository.getListCountriesObjetc(
      name,
    );

    emit(
      state.copyWith(selectedCountry: myCountry, status: StatusCountry.initial),
    );
  }
}
