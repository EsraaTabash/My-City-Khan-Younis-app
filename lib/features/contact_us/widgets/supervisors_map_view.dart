import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/features/contact_us/data/contact_models.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:latlong2/latlong.dart';

class SupervisorsMapView extends StatefulWidget {
  final List<SupervisorItem> supervisors;
  final int selectedIndex;
  final ValueChanged<int> onSupervisorSelected;

  const SupervisorsMapView({
    super.key,
    required this.supervisors,
    required this.selectedIndex,
    required this.onSupervisorSelected,
  });

  @override
  State<SupervisorsMapView> createState() => _SupervisorsMapViewState();
}

class _SupervisorsMapViewState extends State<SupervisorsMapView> {
  final MapController _mapController = MapController();

  LatLng get _selectedLocation {
    final item = widget.supervisors[widget.selectedIndex];
    return LatLng(item.lat, item.lng);
  }

  @override
  void didUpdateWidget(covariant SupervisorsMapView oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.selectedIndex != widget.selectedIndex) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _mapController.move(_selectedLocation, 16);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 315.h,
      width: double.infinity,
      child: FlutterMap(
        mapController: _mapController,
        options: MapOptions(initialCenter: _selectedLocation, initialZoom: 15),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.flutter_application_1',
          ),

          MarkerLayer(
            markers: List.generate(widget.supervisors.length, (index) {
              final supervisor = widget.supervisors[index];
              final isSelected = widget.selectedIndex == index;

              return Marker(
                point: LatLng(supervisor.lat, supervisor.lng),
                width: isSelected ? 54.w : 44.w,
                height: isSelected ? 54.w : 44.w,
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    widget.onSupervisorSelected(index);
                    _mapController.move(
                      LatLng(supervisor.lat, supervisor.lng),
                      16,
                    );
                  },
                  child: _MapMarker(isSelected: isSelected),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

class _MapMarker extends StatelessWidget {
  final bool isSelected;

  const _MapMarker({required this.isSelected});

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? AppColors.primary : const Color(0xFF079BEE);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      width: isSelected ? 54.w : 44.w,
      height: isSelected ? 54.w : 44.w,
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
        border: Border.all(color: Colors.white, width: isSelected ? 4.w : 3.w),
      ),
      child: Icon(
        Icons.location_on,
        color: Colors.white,
        size: isSelected ? 30.sp : 24.sp,
      ),
    );
  }
}
