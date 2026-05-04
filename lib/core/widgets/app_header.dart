import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';

class AppHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onBackTap;
  final VoidCallback? onMenuTap;
  final bool showBackButton;

  const AppHeader({
    super.key,
    required this.title,
    this.onBackTap,
    this.onMenuTap,
    this.showBackButton = false,
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
            child: Row(
              children: [
                SizedBox(
                  width: 78.w,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (showBackButton)
                          InkWell(
                            onTap:
                                onBackTap ??
                                () {
                                  if (Navigator.of(context).canPop()) {
                                    Navigator.of(context).pop();
                                  }
                                },
                            borderRadius: BorderRadius.circular(8.r),
                            child: Padding(
                              padding: EdgeInsets.all(4.w),
                              child: Icon(
                                Icons.arrow_back_rounded,
                                color: Colors.white,
                                size: 24.sp,
                              ),
                            ),
                          ),
                        if (showBackButton && onMenuTap != null)
                          SizedBox(width: 10.w),
                        if (onMenuTap != null)
                          InkWell(
                            onTap: onMenuTap,
                            borderRadius: BorderRadius.circular(8.r),
                            child: Padding(
                              padding: EdgeInsets.all(4.w),
                              child: SvgPicture.asset(
                                'assets/images/menu.svg',
                                width: 24.w,
                                height: 24.h,
                                colorFilter: const ColorFilter.mode(
                                  Colors.white,
                                  BlendMode.srcIn,
                                ),
                                placeholderBuilder: (_) => Icon(
                                  Icons.grid_view_rounded,
                                  color: Colors.white,
                                  size: 24.sp,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.semiBold16.copyWith(
                      color: Colors.white,
                      fontSize: 18.sp,
                    ),
                  ),
                ),
                SizedBox(width: 78.w),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
