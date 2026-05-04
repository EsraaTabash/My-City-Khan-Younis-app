import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomBuildingsBackground extends StatelessWidget {
  const BottomBuildingsBackground({super.key});

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
            'assets/images/header_bg.png',
            height: 118.h,
            width: double.infinity,
            fit: BoxFit.cover,
            alignment: Alignment.bottomCenter,
            errorBuilder: (_, __, ___) => const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}
