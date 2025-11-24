import 'package:firebase_flutter_cifo/core/locator/locator.dart';
import 'package:firebase_flutter_cifo/country/cubits/country_cubit/country_cubit.dart';
import 'package:firebase_flutter_cifo/country/cubits/country_cubit/country_state.dart';
import 'package:firebase_flutter_cifo/country/data/repository/country_api_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountryPage extends StatelessWidget {
  const CountryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CountryCubit, CountryState>(
      bloc: locator<CountryCubit>(),
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: (state.status == StatusCountry.loading)
                ? CircularProgressIndicator()
                : Text(
                    state.selectedCountry?.capital.first ??
                        'No hay pais Disponible',
                  ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if ((state.status == StatusCountry.initial)) {
                locator<CountryCubit>().getCountryByName("Peru");
              }
              if ((state.status == StatusCountry.loading)) {
                print("Pensandooooo.....");
              }
            },
          ),
        );
      },
    );
  }
}
