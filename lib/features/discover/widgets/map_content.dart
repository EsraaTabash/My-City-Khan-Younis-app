import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/features/discover/models/discover_place.dart';
import 'package:flutter_application_1/core/routes/app_navigation.dart';
import 'package:flutter_application_1/core/routes/app_routes.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlong2/latlong.dart';

import 'package:flutter_application_1/features/discover/data/discover_places_data.dart';
import 'place_details_bottom_sheet.dart';

class MapContent extends StatelessWidget {
  final String categoryTitle;
  final MapController mapController;
  final LatLng? currentLocation;

  const MapContent({
    super.key,
    required this.categoryTitle,
    required this.mapController,
    this.currentLocation,
  });

  @override
  Widget build(BuildContext context) {
    final places = DiscoverPlacesData.byCategory(categoryTitle);

    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        initialCenter: places.isNotEmpty
            ? places.first.location
            : const LatLng(31.3462, 34.3031),
        initialZoom: 14,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.flutter_application_1',
        ),

        MarkerLayer(
          markers: [
            ...places.map((place) {
              return Marker(
                point: place.location,
                width: 58.w,
                height: 58.w,
                child: GestureDetector(
                  onTap: () async {
                    final selectedPlace = await PlaceDetailsBottomSheet.show(
                      context,
                      place,
                    );
                    if (selectedPlace == null) return;

                    final returnedPlace = await AppNavigation.push<DiscoverPlace>(
                      context,
                      AppRoutes.placeDetails,
                      arguments: selectedPlace,
                    );

                    if (returnedPlace != null) {
                      mapController.move(returnedPlace.location, 16);
                    }
                  },
                  child: _MapPin(iconPath: place.categoryIcon),
                ),
              );
            }),

            if (currentLocation != null)
              Marker(
                point: currentLocation!,
                width: 46.w,
                height: 46.w,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 4),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

class _MapPin extends StatelessWidget {
  final String iconPath;

  const _MapPin({required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.w,
      height: 50.w,
      padding: EdgeInsets.all(11.w),
      decoration: BoxDecoration(
        color: AppColors.primary,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.35),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: SvgPicture.asset(
        iconPath,
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
      ),
    );
  }
}
