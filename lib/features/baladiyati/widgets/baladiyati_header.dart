import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BaladiyatiHeader extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback? onMenuTap;
  final VoidCallback? onBackTap;
  final bool showBackButton;

  const BaladiyatiHeader({
    super.key,
    required this.title,
    required this.imagePath,
    this.onMenuTap,
    this.onBackTap,
    this.showBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 279.h,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) =>
                Container(color: const Color(0xFF5773D4)),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  AppColors.primary.withValues(alpha: 0.65),
                  AppColors.secondary.withValues(alpha: 0.60),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            child: Column(
              children: [
                SizedBox(height: 60.h),
                Row(
                  children: [
                    SizedBox(
                      width: 82.w,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (showBackButton) ...[
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
                                    color: AppColors.white,
                                    size: 24.sp,
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.w),
                            ],
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
                                  errorBuilder: (_, __, ___) => Icon(
                                    Icons.grid_view_rounded,
                                    color: AppColors.white,
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
                        style: AppTextStyles.semiBold18.copyWith(
                          color: AppColors.white,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                    SizedBox(width: 82.w),
                  ],
                ),
                SizedBox(height: 53.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
