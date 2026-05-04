import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';
import 'package:flutter_application_1/features/adan_time/data/prayer_time_model.dart';
import 'package:flutter_application_1/features/adan_time/data/prayer_times_data.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PrayerHeaderContent extends StatelessWidget {
  final PrayerTimeModel nextPrayer;
  final DateTime selectedDate;
  final DateTime currentTime;

  const PrayerHeaderContent({
    super.key,
    required this.nextPrayer,
    required this.selectedDate,
    required this.currentTime,
  });

  @override
  Widget build(BuildContext context) {
    final liveClock = PrayerTimesData.formatLiveClock(currentTime);

    final remainingTime = PrayerTimesData.getRemainingTime(
      selectedDate: selectedDate,
      prayer: nextPrayer,
      now: currentTime,
    );

    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: 6.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.access_time, color: Colors.white, size: 24.sp),
              SizedBox(width: 7.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'موعد الصلاة القادمة',
                    textDirection: TextDirection.rtl,
                    style: AppTextStyles.semiBold16.copyWith(
                      fontFamily: 'Bahij',
                      color: Colors.white,
                      fontSize: 15.sp,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    'القدس الشريف',
                    textDirection: TextDirection.rtl,
                    style: AppTextStyles.regular14.copyWith(
                      fontFamily: 'Bahij',
                      color: Colors.white,
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: 22.h),

          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              textDirection: TextDirection.ltr,
              children: [
                Text(
                  liveClock,
                  textDirection: TextDirection.ltr,
                  style: AppTextStyles.bold28.copyWith(
                    fontSize: 45.sp,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(height: 8.w),
                Text(
                  '(المتبقي للأذان القادم $remainingTime)',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontFamily: 'Bahij',
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SvgPicture.asset(
                'assets/images/icon28.svg',
                width: 22.w,
                height: 22.h,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                'تنبيه عند قدوم الموعد',
                textDirection: TextDirection.rtl,
                style: AppTextStyles.regular14.copyWith(
                  fontFamily: 'Bahij',
                  color: Colors.white,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
