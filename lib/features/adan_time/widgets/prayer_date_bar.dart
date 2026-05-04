import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrayerDateBar extends StatelessWidget {
  final DateTime selectedDate;
  final String hijriText;
  final VoidCallback onPreviousDay;
  final VoidCallback onNextDay;

  const PrayerDateBar({
    super.key,
    required this.selectedDate,
    required this.hijriText,
    required this.onPreviousDay,
    required this.onNextDay,
  });

  String get arabicDayName {
    const days = [
      'الاثنين',
      'الثلاثاء',
      'الأربعاء',
      'الخميس',
      'الجمعة',
      'السبت',
      'الأحد',
    ];

    return days[selectedDate.weekday - 1];
  }

  String get formattedDate {
    return '$arabicDayName  ${selectedDate.day}-${selectedDate.month}-${selectedDate.year}';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 58.h,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 14.w),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          InkWell(
            onTap: onNextDay,
            borderRadius: BorderRadius.circular(20.r),
            child: Icon(
              Icons.chevron_left,
              color: const Color(0xFFA2A7B2),
              size: 26.sp,
            ),
          ),

          const Spacer(),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                formattedDate,
                textDirection: TextDirection.rtl,
                style: AppTextStyles.regular14.copyWith(
                  fontFamily: 'Bahij',
                  color: const Color(0xFF4F596B),
                  fontSize: 15.sp,
                ),
              ),
              SizedBox(height: 3.h),
              Text(
                hijriText,
                textDirection: TextDirection.rtl,
                style: AppTextStyles.regular14.copyWith(
                  fontFamily: 'Bahij',
                  color: const Color(0xFF079BEE),
                  fontSize: 13.sp,
                ),
              ),
            ],
          ),

          const Spacer(),

          InkWell(
            onTap: onPreviousDay,
            borderRadius: BorderRadius.circular(20.r),
            child: Icon(
              Icons.chevron_right,
              color: const Color(0xFFA2A7B2),
              size: 26.sp,
            ),
          ),
        ],
      ),
    );
  }
}
