import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/features/discover/widgets/map_header.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class WaterTableMapView extends StatefulWidget {
  final Map<String, dynamic> region;
  final VoidCallback onBackTap;
  final VoidCallback onMyLocationTap;

  const WaterTableMapView({
    super.key,
    required this.region,
    required this.onBackTap,
    required this.onMyLocationTap,
  });

  @override
  State<WaterTableMapView> createState() => _WaterTableMapViewState();
}

class _WaterTableMapViewState extends State<WaterTableMapView> {
  final MapController _mapController = MapController();

  LatLng? _currentLocation;
  late final LatLng regionLocation;

  @override
  void initState() {
    super.initState();

    final coordinates = widget.region['coordinates'];
    regionLocation = LatLng(coordinates['lat'], coordinates['lng']);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _mapController.move(regionLocation, 17);
    });
  }

  Future<void> _goToMyLocation() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();

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

    _mapController.move(location, 17);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.40.sh,
      width: double.infinity,
      child: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(initialCenter: regionLocation, initialZoom: 17),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.flutter_application_1',
              ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: regionLocation,
                    width: 48.w,
                    height: 48.w,
                    alignment: Alignment.center,
                    child: _MapMarker(color: AppColors.primary),
                  ),
                  if (_currentLocation != null)
                    Marker(
                      point: _currentLocation!,
                      width: 42.w,
                      height: 42.w,
                      alignment: Alignment.center,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF169DEE),
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 4),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.18),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
          MapHeader(
            onBackTap: widget.onBackTap,
            onMyLocationTap: _goToMyLocation,
          ),
        ],
      ),
    );
  }
}

class _MapMarker extends StatelessWidget {
  final Color color;

  const _MapMarker({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48.w,
      height: 48.w,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.35),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Icon(Icons.location_on, color: Colors.white, size: 26.sp),
    );
  }
}
