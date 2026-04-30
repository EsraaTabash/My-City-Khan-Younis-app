import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';

class WaterTableBottomCard extends StatelessWidget {
  final Map<String, dynamic> region;
  final VoidCallback onScheduleTap;

  const WaterTableBottomCard({
    super.key,
    required this.region,
    required this.onScheduleTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 16,
            offset: const Offset(0, -6),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            region['name'],
            style: AppTextStyles.bold18.copyWith(
              color: AppColors.textPrimary,
              fontSize: 18.sp,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            'جدول المياه الأسبوعي',
            style: AppTextStyles.regular14.copyWith(
              color: Colors.grey[600],
              fontSize: 13.sp,
            ),
          ),
          SizedBox(height: 18.h),
          GestureDetector(
            onTap: onScheduleTap,
            child: Container(
              height: 52.h,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Center(
                child: Text(
                  'عرض المواعيد',
                  style: AppTextStyles.bold16.copyWith(
                    color: Colors.white,
                    fontSize: 15.sp,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 12.h),
        ],
      ),
    );
  }
}
