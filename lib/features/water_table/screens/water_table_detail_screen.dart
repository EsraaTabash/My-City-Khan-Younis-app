import 'package:flutter/material.dart';

import 'package:flutter_application_1/features/water_table/widgets/index.dart';

class WaterTableDetailScreen extends StatefulWidget {
  final Map<String, dynamic> region;

  const WaterTableDetailScreen({super.key, required this.region});

  @override
  State<WaterTableDetailScreen> createState() => _WaterTableDetailScreenState();
}

class _WaterTableDetailScreenState extends State<WaterTableDetailScreen> {
  final List<Map<String, String>> schedule = const [
    {'day': 'السبت', 'start': '09:00', 'end': '09:00'},
    {'day': 'الأحد', 'start': '09:00', 'end': '09:00'},
    {'day': 'الاثنين', 'start': '09:00', 'end': '09:00'},
    {'day': 'الثلاثاء', 'start': '09:00', 'end': '09:00'},
    {'day': 'الأربعاء', 'start': '09:00', 'end': '09:00'},
    {'day': 'الخميس', 'start': '09:00', 'end': '09:00'},
    {'day': 'الجمعة', 'start': '09:00', 'end': '09:00'},
  ];

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
              WaterTableMapView(
                region: widget.region,
                onBackTap: () => Navigator.pop(context),
                onMyLocationTap: () {},
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: WaterTableScheduleCard(
                  region: widget.region,
                  schedule: schedule,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
