import 'dart:convert';

import 'package:firebase_flutter_cifo/country/data/models/country_dto.dart';
import 'package:firebase_flutter_cifo/country/data/utils/country_api_urls.dart';
import 'package:http/http.dart' as http;

class CountryApiRepository {
  static Future<CountryDto?> getListCountriesObjetc(String nombre) async {
    String urlString = CountryApiUrls.urlGetCountry(nombre);

    Uri url = Uri.parse(urlString);

    CountryDto? country;

    try {
      await http.get(url).then((http.Response res) {
        final bodyString = res.body;
        final body = jsonDecode(bodyString);

        List<dynamic> myResponse = body;
        country = CountryDto.fromJson(myResponse.first);
      });
    } catch (e) {
      print('$e');
    }

    return country;
  }
}
