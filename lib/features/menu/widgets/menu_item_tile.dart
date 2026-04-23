import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';

class MenuItemTile extends StatelessWidget {
  final String title;
  final String iconPath;
  final int? badgeCount;
  final VoidCallback? onTap;

  const MenuItemTile({
    super.key,
    required this.title,
    required this.iconPath,
    this.badgeCount,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Material(
        color: AppColors.white,
        child: InkWell(
          onTap: onTap ?? () {},
          child: SizedBox(
            height: 60.h,
            child: Row(
              children: [
                SizedBox(width: 14.w),

                Container(
                  width: 24.w,
                  height: 24.w,
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    iconPath,
                    width: 23.w,
                    height: 23.h,
                    colorFilter: ColorFilter.mode(
                      AppColors.primary.withValues(alpha: 0.60),
                      BlendMode.srcIn,
                    ),
                  ),
                ),

                SizedBox(width: 12.w),

                Expanded(
                  child: Text(
                    title,
                    style: AppTextStyles.regular24.copyWith(
                      fontSize: 16.sp,
                      color: const Color(0xFF4B4F58),
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),

                if (badgeCount != null)
                  Container(
                    height: 17.h,
                    width: 17.h,
                    alignment: Alignment.center,
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
                  ),

                SizedBox(width: 8.w),

                Icon(
                  Icons.chevron_right_rounded,
                  color: const Color(0xFFC2C7CF),
                  size: 22.sp,
                ),

                SizedBox(width: 14.w),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
