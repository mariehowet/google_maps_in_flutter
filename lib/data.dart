import 'dart:convert';
import 'package:google_maps_in_flutter/country.dart';
import 'package:http/http.dart' as http;

Future<List<Country>> fetchCountries() async {
    List<Country> countries = [];
    final response = await http.get(Uri.parse('https://restcountries.com/v3.1/subregion/Western%20Europe'));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      countries.clear();
      for(Map i in data){
            countries.add(Country.fromJson(i));
          }
      return countries;
    
    } else {
      throw Exception('Failed to fetch countries');
    }
  }