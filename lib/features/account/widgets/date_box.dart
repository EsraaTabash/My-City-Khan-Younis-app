import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';

class DateBox extends StatelessWidget {
  final String title;
  final String date;
  final Color color;

  const DateBox({
    super.key,
    required this.title,
    required this.date,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 104.w,
      height: 70.h,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(3.r),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.25),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: AppTextStyles.regular14.copyWith(
              color: Colors.white,
              fontSize: 11.sp,
            ),
          ),
          SizedBox(height: 7.h),
          Text(
            date,
            style: AppTextStyles.regular14.copyWith(
              color: Colors.white,
              fontSize: 13.sp,
            ),
          ),
        ],
      ),
    );
  }
}
