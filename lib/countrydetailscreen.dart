import 'package:flutter/material.dart';
import 'country.dart';
import 'package:characters/characters.dart';

class CountryDetailsScreen extends StatelessWidget {
  final Country country;

  const CountryDetailsScreen(this.country);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(country.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildCountryFlag(country.flagImageUrl),
            const SizedBox(height: 20.0),
            Text(
              'Details of ${country.name}',
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
             const SizedBox(height: 10.0),
            _buildDetailText('Official Name', country.officialName),
            _buildDetailText('Latitude & Longitude', '${country.latlng.latitude}, ${country.latlng.longitude}'),
            _buildDetailText('Capital', country.capital),
            _buildDetailText('Population', '${country.population} inhabitants'),
            _buildDetailText('Capital Latitude & Longitude','${country.capitalLatlng.latitude}, ${country.capitalLatlng.longitude}'),
            _buildDetailText('Currency', '${country.currency[0]}'),
            _buildDetailList('Languages', (country.languages.map((item) => item.toString()).toList())),
            //const SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }

  Widget _buildCountryFlag(String flagImageUrl) {
    return Image.network(
      flagImageUrl,
      width: 300,
      height: 300,
    );
  }

  Widget _buildDetailText(String title, String detail) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            detail,
            style: const TextStyle(
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }

Widget _buildDetailList(String title, List<String> details) {
  return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          crossAxisAlignment: CrossAxisAlignment.end,
          children: details.map((detail) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2.0),
              child: Text(
                detail,
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
            );
          }).toList(),
        ),
        ],
      ),
    );
}
}