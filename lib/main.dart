import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_in_flutter/data.dart';
import 'country.dart';
import 'countrydetailscreen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget { // inheritance
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp( // setup the app
      title: 'Flutter Google Maps Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget { // Stateful widgets are useful when the part of the user interface you are describing can change dynamically
// mutable state of the widget
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  late Future<List<Country>> futureCountries;
  late Set<Marker> _markers = {};

  final LatLng _center = const LatLng(50.83333333, 4);
  
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _addMarkers();
  }

  void _onMarkerTapped(Country country) {
    // Logic to navigate to details page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CountryDetailsScreen(country)),
    );
  }

  Future<void> _addMarkers() async {
   List<Country> countries = await fetchCountries();
   setState(() {
      _markers.clear();
      _markers.addAll(countries.map((country) => Marker(
                markerId: MarkerId(country.name),
                position: country.capitalLatlng,
                icon: BitmapDescriptor.defaultMarker,
                infoWindow: InfoWindow(
                  title: '${country.capital}, ${country.name}',
                ),
                onTap: () {
                  _onMarkerTapped(country);
                },
              ))
          .toSet());
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map Western Europe Country'),
        elevation: 2,
      ),
      body: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 6,
              ),
              markers: _markers,
      ),
    );
  }
}