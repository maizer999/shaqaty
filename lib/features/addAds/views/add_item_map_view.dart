import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_core/build_context.dart';
import 'package:flutter_core/core/widgets/custom_text.dart';
import 'package:flutter_core/features/addAds/views/add_item_image_view.dart';
import 'package:flutter_core/features/common/base_scaffold.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

import '../../../core/theme/theme.dart';
import '../providers/add_item_data_notifier.dart';

class AddItemMapView extends ConsumerStatefulWidget {
  const AddItemMapView({super.key});

  @override
  ConsumerState<AddItemMapView> createState() => _AddItemMapViewState();
}

class _AddItemMapViewState extends ConsumerState<AddItemMapView> {
  GoogleMapController? _mapController;

  LatLng _currentPosition = const LatLng(31.963158, 35.930359);
  Marker? _selectedMarker;

  final TextEditingController _searchController = TextEditingController();
  final List<dynamic> _searchResults = [];

  Timer? _debounce;

  static const String _apiKey = 'AIzaSyAboJqqCU48ksA9hu3ylF41e5DUhrE2Kho';

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
    final status = await Permission.location.request();
    if (!status.isGranted) return;

    final position = await Geolocator.getCurrentPosition(
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
      CameraUpdate.newLatLngZoom(_currentPosition, 15),
    );
  }

  void _onSearchChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), () {
      _searchPlaces(value);
    });
  }

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

  Future<void> _selectPlace(String placeId, String description) async {
    final uri = Uri.parse(
      'https://maps.googleapis.com/maps/api/place/details/json'
          '?place_id=$placeId'
          '&key=$_apiKey',
    );

    final response = await http.get(uri);
    final data = json.decode(response.body);

    final location = data['result']['geometry']['location'];
    final latLng = LatLng(location['lat'], location['lng']);

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

  /// 📍 استخراج عنوان ذكي (بدون Plus Codes)
  Future<Map<String, String>> _resolveAddress(LatLng location) async {
    final placemarks = await placemarkFromCoordinates(
      location.latitude,
      location.longitude,
    );

    if (placemarks.isEmpty) return {};

    final p = placemarks.first;

    final country = p.country ?? '';
    final city = p.locality?.isNotEmpty == true
        ? p.locality!
        : p.administrativeArea ?? '';

    final state = p.subLocality?.isNotEmpty == true
        ? p.subLocality!
        : p.subAdministrativeArea ?? '';

    final street = p.thoroughfare?.isNotEmpty == true
        ? p.thoroughfare!
        : p.street ?? '';

    return {
      'country': country,
      'city': city,
      'state': state,
      'street': street,
    };
  }

  Future<void> _goToNextView() async {
    if (_selectedMarker == null) return;

    final location = _selectedMarker!.position;

    try {
      final address = await _resolveAddress(location);

      debugPrint('=== Final Address ===');
      address.forEach((k, v) => debugPrint('$k: $v'));
      debugPrint('lat: ${location.latitude}');
      debugPrint('lng: ${location.longitude}');
      debugPrint('====================');

      /// تحديث الـ provider
      // ref.read(addItemDataProvider.notifier).updateLocation(
      //   country: address['country'] ?? '',
      //   city: address['city'] ?? '',
      //   state: address['state'] ?? '',
      //   address: address['street'] ?? '',
      //   latitude: location.latitude.toString(),
      //   longitude: location.longitude.toString(),
      // );
    } catch (e) {
      debugPrint('Reverse geocoding error: $e');
    }

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
    return BaseScaffold(
     title: "اختيار العنوان",
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _currentPosition,
              zoom: 14,
            ),
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            onMapCreated: (controller) => _mapController = controller,
            markers: _selectedMarker != null ? {_selectedMarker!} : {},
            onTap: _onMapTap,
          ),
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
                      hintText: 'Search location',
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
                      itemBuilder: (_, index) {
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
          Positioned(
            left: 16,
            right: 16,
            bottom: 20,
            child: ElevatedButton(
              onPressed: _selectedMarker == null ? null : _goToNextView,
              style: ElevatedButton.styleFrom(
                backgroundColor: context.color.territoryColor,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child:  CustomText(
                'تآكيد العنوان',
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,

              ),
            ),
          ),
        ],
      ),
    );
  }
}
