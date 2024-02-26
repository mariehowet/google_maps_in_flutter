import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:core';

class Country {
  final String name;
  final String officialName;
  final List<dynamic> currency;
  final String capital;
  final List<dynamic> languages;
  final LatLng latlng;
  final int population;
  final LatLng capitalLatlng;
  final String flagImageUrl;

  Country( {
    required this.name,
    required this.officialName,
    required this.currency,
    required this.capital,
    required this.languages,
    required this.latlng,
    required this.population,
    required this.capitalLatlng,
    required this.flagImageUrl
    }
  );

  factory Country.fromJson(dynamic json) {
    return Country(
      name : json['name']['common'],
      officialName : json['name']['official'],
      currency : json['currencies'].values.first.values.toList(),
      capital : json['capital'][0],
      languages: json["languages"].values.toList(),
      latlng : LatLng(json['latlng'][0], json['latlng'][1]),
      population : json['population'],
      capitalLatlng :  LatLng(json['capitalInfo']['latlng'][0], json['capitalInfo']['latlng'][1]),
      flagImageUrl: json["flags"]["png"]
    );
  }


  Map<String, dynamic> toJson() => {
      'name': name,
      'officialName': officialName,
      'currencies': currency,
      'capital': capital,
      'languages':languages,
      'latlng': latlng,
      'population': population,
      'capitalLatlng': capitalLatlng,
      'flagImageUrl': flagImageUrl
    };
}