import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherHeaderBackground extends StatelessWidget {
  const WeatherHeaderBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: IgnorePointer(
        child: Opacity(
          opacity: 0.22,
          child: Image.asset(
            'assets/images/weather-bg2.png',
            height: 118.h,
            width: double.infinity,
            fit: BoxFit.cover,
            alignment: Alignment.bottomCenter,
            errorBuilder: (_, __, ___) {
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
