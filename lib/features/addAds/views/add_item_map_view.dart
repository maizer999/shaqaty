import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_core/features/addAds/views/add_item_image_view.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;

class AddItemMapView extends StatefulWidget {
  const AddItemMapView({super.key});

  @override
  State<AddItemMapView> createState() => _AddItemMapViewState();
}

class _AddItemMapViewState extends State<AddItemMapView> {
  GoogleMapController? _mapController;
  LatLng _currentPosition = const LatLng(31.963158, 35.930359);
  Marker? _selectedMarker;

  final TextEditingController _searchController = TextEditingController();
  final List<dynamic> _searchResults = [];

  Timer? _debounce;

  /// 🔑 Required for Places REST API
  static const String _apiKey = 'YOUR_GOOGLE_API_KEY';

  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _requestLocationPermission() async {
    var status = await Permission.location.request();
    if (!status.isGranted) return;

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      _currentPosition = LatLng(position.latitude, position.longitude);
      _selectedMarker = Marker(
        markerId: const MarkerId('selected'),
        position: _currentPosition,
      );
    });

    _mapController?.animateCamera(
      CameraUpdate.newLatLng(_currentPosition),
    );
  }

  /// 🔍 Debounced auto-search
  void _onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    _debounce = Timer(const Duration(milliseconds: 400), () {
      _searchPlaces(value);
    });
  }

  /// 🔍 Google Places Autocomplete
  Future<void> _searchPlaces(String input) async {
    if (input.isEmpty) {
      setState(() => _searchResults.clear());
      return;
    }

    final uri = Uri.parse(
      'https://maps.googleapis.com/maps/api/place/autocomplete/json'
          '?input=$input'
          '&language=en'
          '&key=$_apiKey',
    );

    final response = await http.get(uri);
    final data = json.decode(response.body);

    if (data['status'] == 'OK') {
      setState(() {
        _searchResults
          ..clear()
          ..addAll(data['predictions']);
      });
    }
  }

  /// 📍 Select place from dropdown
  Future<void> _selectPlace(String placeId, String description) async {
    final uri = Uri.parse(
      'https://maps.googleapis.com/maps/api/place/details/json'
          '?place_id=$placeId'
          '&key=$_apiKey',
    );

    final response = await http.get(uri);
    final data = json.decode(response.body);

    final location = data['result']['geometry']['location'];
    final LatLng latLng = LatLng(location['lat'], location['lng']);

    setState(() {
      _searchController.text = description;
      _searchResults.clear();
      _selectedMarker = Marker(
        markerId: const MarkerId('selected'),
        position: latLng,
      );
    });

    _mapController?.animateCamera(
      CameraUpdate.newLatLngZoom(latLng, 15),
    );
  }

  void _onMapTap(LatLng position) {
    setState(() {
      _selectedMarker = Marker(
        markerId: const MarkerId('selected'),
        position: position,
      );
    });
  }

  void _goToNextView() {
    if (_selectedMarker == null) return;

    final LatLng location = _selectedMarker!.position;

    final String googleMapsUrl =
        'https://www.google.com/maps/search/?api=1&query=${location.latitude},${location.longitude}';


    print('Selected Location: Latitude=$googleMapsUrl');

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AddItemImageView(
          latitude: location.latitude,
          longitude: location.longitude,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Location on Map'),
        backgroundColor: Colors.teal,
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _currentPosition,
              zoom: 14,
            ),
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            onMapCreated: (controller) {
              _mapController = controller;
            },
            markers: _selectedMarker != null ? {_selectedMarker!} : {},
            onTap: _onMapTap,
          ),

          /// 🔍 Search Box + Dropdown
          Positioned(
            top: 12,
            left: 16,
            right: 16,
            child: Column(
              children: [
                Material(
                  elevation: 4,
                  borderRadius: BorderRadius.circular(12),
                  child: TextField(
                    controller: _searchController,
                    onChanged: _onSearchChanged,
                    decoration: const InputDecoration(
                      hintText: 'Search for a place',
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(14),
                    ),
                  ),
                ),
                if (_searchResults.isNotEmpty)
                  Container(
                    margin: const EdgeInsets.only(top: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _searchResults.length,
                      itemBuilder: (context, index) {
                        final item = _searchResults[index];
                        return ListTile(
                          title: Text(item['description']),
                          onTap: () => _selectPlace(
                            item['place_id'],
                            item['description'],
                          ),
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),

          /// 🔽 Bottom Confirm Button
          Positioned(
            left: 16,
            right: 16,
            bottom: 20,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: _selectedMarker == null ? null : _goToNextView,
              child: const Text(
                'Confirm Location',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
