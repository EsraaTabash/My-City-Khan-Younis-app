import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';
import 'package:flutter_application_1/features/adan_time/data/prayer_time_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrayerTimeTile extends StatelessWidget {
  final PrayerTimeModel item;

  const PrayerTimeTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 7,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          Container(
            width: 22.w,
            height: 22.w,
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5FF),
              borderRadius: BorderRadius.circular(3.r),
            ),
            child: Icon(
              Icons.access_time,
              color: const Color(0xFF079BEE),
              size: 16.sp,
            ),
          ),

          SizedBox(width: 14.w),

          Expanded(
            child: Text(
              item.name,
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              style: AppTextStyles.regular14.copyWith(
                fontFamily: 'Bahij',
                color: const Color(0xFF4F596B),
                fontSize: 14.sp,
              ),
            ),
          ),

          Text(
            item.time,
            textDirection: TextDirection.ltr,
            style: AppTextStyles.regular14.copyWith(
              fontFamily: 'Bahij',
              color: const Color(0xFF4F596B),
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}
