import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class MapPickerScreen extends StatefulWidget {
  const MapPickerScreen({super.key});

  @override
  State<MapPickerScreen> createState() => _MapPickerScreenState();
}

class _MapPickerScreenState extends State<MapPickerScreen> {
  GoogleMapController? _mapController;
  LatLng _currentPosition = const LatLng(31.963158, 35.930359); // Default center (Jordan)
  Marker? _selectedMarker;

  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
  }

  Future<void> _requestLocationPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        _currentPosition = LatLng(position.latitude, position.longitude);
        _selectedMarker = Marker(
          markerId: const MarkerId('selected'),
          position: _currentPosition,
        );
      });
      _mapController?.animateCamera(CameraUpdate.newLatLng(_currentPosition));

      // Print debug info
      debugPrint('🟢 Current Position: $_currentPosition');
      debugPrint('🟢 Selected Marker: $_selectedMarker');
    } else {
      debugPrint("🔴 Location permission denied");
    }
  }

  void _onMapTap(LatLng position) {
    setState(() {
      _selectedMarker = Marker(
        markerId: const MarkerId('selected'),
        position: position,
      );

      debugPrint('🟢 Marker tapped at: $position');
      debugPrint('🟢 Current markers: ${_selectedMarker != null ? {_selectedMarker!} : {}}');
    });
  }

  @override
  Widget build(BuildContext context) {
    // Print map bundle info every rebuild
    debugPrint('🟢 GoogleMapController: $_mapController');
    debugPrint('🟢 Current Camera Position: $_currentPosition');
    debugPrint('🟢 Current Marker: $_selectedMarker');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Location on Map'),
        backgroundColor: Colors.teal,
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _currentPosition,
          zoom: 14,
        ),
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        onMapCreated: (controller) {
          _mapController = controller;
          debugPrint('🟢 Map created with controller: $controller');
        },
        markers: _selectedMarker != null ? {_selectedMarker!} : {},
        onTap: _onMapTap,
        // Optional: force surface renderer to avoid `preferredRenderer: null`

      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.check),
        onPressed: () {
          if (_selectedMarker != null) {
            debugPrint('🟢 Returning selected position: ${_selectedMarker!.position}');
            Navigator.pop(context, _selectedMarker!.position);
          }
        },
      ),
    );
  }
}
