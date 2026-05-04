import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

import 'package:flutter_application_1/features/discover/widgets/map_content.dart';
import 'package:flutter_application_1/features/discover/widgets/map_header.dart';

class DiscoverMapScreen extends StatefulWidget {
  final String categoryTitle;

  const DiscoverMapScreen({super.key, required this.categoryTitle});

  @override
  State<DiscoverMapScreen> createState() => _DiscoverMapScreenState();
}

class _DiscoverMapScreenState extends State<DiscoverMapScreen> {
  final MapController _mapController = MapController();
  LatLng? _currentLocation;

  Future<void> _goToMyLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('فعّل GPS أولاً')));
        await Geolocator.openLocationSettings();
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('تم رفض صلاحية الموقع')));
        return;
      }

      if (permission == LocationPermission.deniedForever) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('فعّل الصلاحية من الإعدادات')),
        );
        await Geolocator.openAppSettings();
        return;
      }

      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      final location = LatLng(position.latitude, position.longitude);

      setState(() {
        _currentLocation = location;
      });

      _mapController.move(location, 16);
    } catch (e) {
      print("Location error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          bottom: false,
          child: Stack(
            children: [
              MapContent(
                categoryTitle: widget.categoryTitle,
                mapController: _mapController,
                currentLocation: _currentLocation,
              ),
              MapHeader(
                onBackTap: () => Navigator.pop(context),
                onMyLocationTap: _goToMyLocation,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
