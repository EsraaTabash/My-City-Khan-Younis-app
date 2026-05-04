import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/widgets/image_page_header.dart';
import 'package:flutter_application_1/features/menu/screens/menu_screen.dart';
import 'package:flutter_application_1/features/weather/data/weather_mock_data.dart';
import 'package:flutter_application_1/features/weather/widgets/weather_card.dart';
import 'package:flutter_application_1/features/weather/widgets/weather_header_background.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openMenu() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    final weather = WeatherMockData.currentWeather;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: const Color(0xFFF4F4F4),
        drawer: SizedBox(width: 300.w, child: const MenuScreen()),
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              ImagePageHeader(
                title: 'حالة الطقس',
                backgroundImage: 'assets/images/weather-bg.png',
                height: 255,
                onBackTap: () => Navigator.pop(context),
                onMenuTap: _openMenu,
              ),

              Expanded(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    const WeatherHeaderBackground(),

                    Positioned(
                      top: -88.h,
                      left: 15.w,
                      right: 15.w,
                      child: WeatherCard(weather: weather),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
