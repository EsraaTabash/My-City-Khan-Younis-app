import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherMetricItem extends StatelessWidget {
  final IconData icon;
  final String value;

  const WeatherMetricItem({super.key, required this.icon, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: Colors.white, size: 17.sp),
        SizedBox(width: 6.w),
        Text(
          value,
          textDirection: TextDirection.ltr,
          style: AppTextStyles.regular14.copyWith(
            fontFamily: 'Bahij',
            color: Colors.white,
            fontSize: 13.sp,
          ),
        ),
      ],
    );
  }
}
