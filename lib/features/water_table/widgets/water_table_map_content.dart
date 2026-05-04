import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';

class WaterTableMapContent extends StatelessWidget {
  final Map<String, dynamic> region;

  const WaterTableMapContent({super.key, required this.region});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.grey[300],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.map_rounded, size: 80.sp, color: Colors.grey[400]),
            SizedBox(height: 16.h),
            Text(
              'خريطة ${region['name']}',
              style: AppTextStyles.bold16.copyWith(
                color: Colors.grey[600],
                fontSize: 16.sp,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'إحداثيات: ${region['coordinates']['lat']}, ${region['coordinates']['lng']}',
              style: AppTextStyles.regular14.copyWith(
                color: Colors.grey[500],
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
