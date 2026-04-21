import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';

class MenuItemTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final int? badgeCount;
  final VoidCallback? onTap;

  const MenuItemTile({
    super.key,
    required this.title,
    required this.icon,
    this.badgeCount,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      child: InkWell(
        onTap: onTap ?? () {},
        child: SizedBox(
          height: 56.h,
          child: Row(
            children: [
              SizedBox(width: 14.w),
              Icon(
                Icons.chevron_left_rounded,
                color: const Color(0xFFC2C7CF),
                size: 22.sp,
              ),
              SizedBox(width: 8.w),
              if (badgeCount != null)
                Container(
                  constraints: BoxConstraints(minWidth: 18.w, minHeight: 18.h),
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Text(
                    '$badgeCount',
                    style: AppTextStyles.semiBold14.copyWith(
                      color: AppColors.white,
                      fontSize: 11.sp,
                      height: 1,
                    ),
                  ),
                )
              else
                SizedBox(width: 18.w),
              const Spacer(),
              Text(
                title,
                style: AppTextStyles.regular24.copyWith(
                  fontSize: 16.sp,
                  color: const Color(0xFF4B4F58),
                ),
              ),
              SizedBox(width: 12.w),
              Container(
                width: 24.w,
                height: 24.w,
                alignment: Alignment.center,
                child: Icon(
                  icon,
                  color: AppColors.primary.withValues(alpha: 0.60),
                  size: 19.sp,
                ),
              ),
              SizedBox(width: 14.w),
            ],
          ),
        ),
      ),
    );
  }
}
