import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';

class AppHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onBackTap;
  final VoidCallback? onMenuTap;

  const AppHeader({
    super.key,
    required this.title,
    this.onBackTap,
    this.onMenuTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 98.h,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/header_bg.png',
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(color: AppColors.primary),
          ),

          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primary.withOpacity(0.72),
                  AppColors.gradientEnd.withOpacity(0.72),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.semiBold16.copyWith(
                      color: Colors.white,
                      fontSize: 18.sp,
                    ),
                  ),
                ),

                if (onBackTap != null || onMenuTap != null)
                  Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      textDirection: TextDirection.rtl,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (onBackTap != null)
                          InkWell(
                            onTap: onBackTap,
                            child: Icon(
                              Icons.arrow_back_rounded,
                              color: Colors.white,
                              size: 24.sp,
                            ),
                          ),
                        if (onMenuTap != null && onBackTap != null)
                          SizedBox(width: 16.w),
                        if (onMenuTap != null)
                          InkWell(
                            onTap: onMenuTap,
                            child: SvgPicture.asset(
                              'assets/images/menu.svg',
                              width: 24.w,
                              height: 24.h,
                              colorFilter: const ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
