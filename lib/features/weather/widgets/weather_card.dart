import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';
import 'package:flutter_application_1/features/weather/models/weather_model.dart';
import 'package:flutter_application_1/features/weather/widgets/weather_metric_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WeatherCard extends StatelessWidget {
  final WeatherModel weather;

  const WeatherCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 198.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Colors.white, width: 1.2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(weather.cardBackgroundPath),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.fromLTRB(18.w, 20.h, 18.w, 16.h),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF079BEE).withOpacity(0.78),
                  const Color(0xFFD9188D).withOpacity(0.76),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  textDirection: TextDirection.rtl,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            weather.city,
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.right,
                            style: AppTextStyles.semiBold16.copyWith(
                              fontFamily: 'Bahij',
                              color: Colors.white,
                              fontSize: 23.sp,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            weather.dayName,
                            textDirection: TextDirection.rtl,
                            textAlign: TextAlign.right,
                            style: AppTextStyles.regular14.copyWith(
                              fontFamily: 'Bahij',
                              color: Colors.white,
                              fontSize: 12.sp,
                            ),
                          ),
                          Text(
                            weather.date,
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.right,
                            style: AppTextStyles.regular14.copyWith(
                              fontFamily: 'Bahij',
                              color: Colors.white,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(width: 12.w),

                    SizedBox(
                      width: 95.w,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: _WeatherIcon(path: weather.weatherIconPath),
                      ),
                    ),
                  ],
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Row(
                        textDirection: TextDirection.rtl,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          WeatherMetricItem(
                            icon: Icons.air_rounded,
                            value: weather.windPercentage,
                          ),
                          SizedBox(width: 22.w),
                          WeatherMetricItem(
                            icon: Icons.umbrella_outlined,
                            value: weather.rainPercentage,
                          ),
                        ],
                      ),
                    ),

                    Text(
                      weather.temperature,
                      style: TextStyle(
                        fontFamily: 'Bahij',
                        color: Colors.white,
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 10.h),
                  ],
                ),

                SizedBox(height: 12.h),

                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '${weather.sunriseTime}  *  ${weather.sunsetTime}',
                    textDirection: TextDirection.ltr,
                    style: AppTextStyles.regular14.copyWith(
                      fontFamily: 'Bahij',
                      color: Colors.white,
                      fontSize: 13.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _WeatherIcon extends StatelessWidget {
  final String path;

  const _WeatherIcon({required this.path});

  @override
  Widget build(BuildContext context) {
    if (path.toLowerCase().endsWith('.svg')) {
      return SvgPicture.asset(
        path,
        width: 92.w,
        height: 72.h,
        fit: BoxFit.contain,
        errorBuilder: (_, __, ___) {
          return Icon(
            Icons.wb_cloudy_rounded,
            color: Colors.white,
            size: 70.sp,
          );
        },
      );
    }

    return Image.asset(
      path,
      width: 92.w,
      height: 72.h,
      fit: BoxFit.contain,
      errorBuilder: (_, __, ___) {
        return Icon(Icons.wb_cloudy_rounded, color: Colors.white, size: 70.sp);
      },
    );
  }
}
