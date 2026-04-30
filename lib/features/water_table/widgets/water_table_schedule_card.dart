import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WaterTableScheduleCard extends StatelessWidget {
  final Map<String, dynamic> region;
  final List<Map<String, String>> schedule;

  const WaterTableScheduleCard({
    super.key,
    required this.region,
    required this.schedule,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(28.r)),
      child: Container(
        height: 0.56.sh,
        width: double.infinity,
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(22.w, 22.h, 22.w, 18.h),
        child: Column(
          children: [
            Text(
              region['name'],
              textAlign: TextAlign.center,
              style: AppTextStyles.semiBold18.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: 6.h),
            Text(
              'جدول المياه الأسبوعي',
              style: AppTextStyles.regular12.copyWith(color: AppColors.primary),
            ),
            SizedBox(height: 18.h),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14.r),
                  border: Border.all(color: const Color(0xFFE8E8E8)),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14.r),
                  child: Column(
                    children: schedule.asMap().entries.map((entry) {
                      final index = entry.key;
                      final item = entry.value;
                      final isLast = index == schedule.length - 1;

                      return Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: isLast
                                    ? Colors.transparent
                                    : const Color(0xFFE8E8E8),
                                width: 0.8,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Center(
                                  child: Text(
                                    item['day']!,
                                    style: AppTextStyles.regular14.copyWith(
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 1,
                                color: const Color(0xFFE8E8E8),
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    item['start']!,
                                    style: AppTextStyles.regular14.copyWith(
                                      color: const Color(0xFF169DEE),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 1,
                                color: const Color(0xFFE8E8E8),
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    item['end']!,
                                    style: AppTextStyles.regular14.copyWith(
                                      color: const Color(0xFFE91E8F),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
