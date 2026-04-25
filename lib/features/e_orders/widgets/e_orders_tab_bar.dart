import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';

class EOrdersTabBar extends StatelessWidget {
  final TabController controller;

  const EOrdersTabBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: TabBar(
        controller: controller,
        indicator: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(4.r),
        ),
        labelColor: Colors.white,
        unselectedLabelColor: const Color(0xFF5E6278),
        dividerColor: Colors.transparent,
        indicatorSize: TabBarIndicatorSize.tab,
        labelStyle: AppTextStyles.semiBold14.copyWith(fontSize: 14.sp),
        unselectedLabelStyle: AppTextStyles.semiBold14.copyWith(
          fontSize: 14.sp,
        ),
        tabs: const [
          Tab(text: 'طلباتي'),
          Tab(text: 'طلب جديد'),
        ],
      ),
    );
  }
}
