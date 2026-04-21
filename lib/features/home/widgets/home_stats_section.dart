import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';

class HomeStatItem {
  final String title;
  final String value;

  const HomeStatItem({required this.title, required this.value});
}

class HomeStatsSection extends StatelessWidget {
  final List<HomeStatItem> items;
  final bool showPoints;

  const HomeStatsSection({
    super.key,
    required this.items,
    this.showPoints = true,
  });

  @override
  Widget build(BuildContext context) {
    final visibleItems = showPoints
        ? items
        : items.where((e) => e.title != 'نقاطي').toList();

    return Row(
      children: visibleItems.map((item) {
        return Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Container(
              height: 76.h,
              decoration: BoxDecoration(
                color: const Color(0xFFF4F6F6),
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.title,
                    style: AppTextStyles.regular16.copyWith(
                      fontSize: 14.sp,
                      color: const Color(0xFF555555),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 1.h),
                  Text(
                    item.value,
                    style: AppTextStyles.bold14.copyWith(
                      fontSize: 16.sp,
                      color: AppColors.primary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
