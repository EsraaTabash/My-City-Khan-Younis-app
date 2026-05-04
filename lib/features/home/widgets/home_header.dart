import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/routes/app_navigation.dart';
import 'package:flutter_application_1/core/routes/app_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';
import 'package:flutter_svg/svg.dart';

class HomeHeader extends StatelessWidget {
  final bool isGuest;
  final VoidCallback onMenuPressed;

  const HomeHeader({
    super.key,
    required this.isGuest,
    required this.onMenuPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 279.h,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/login_bg.png',
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
                      width: 78.w,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                          onTap: onMenuPressed,
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
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'مدينتي خان يونس',
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.semiBold18.copyWith(
                          color: AppColors.white,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                    SizedBox(width: 78.w),
                  ],
                ),
                SizedBox(height: 53.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          isGuest
                              ? 'مرحباً بك في تطبيق مدينتي'
                              : 'مرحباً بك : محمد. صبحي الرباطي',
                          textAlign: TextAlign.right,
                          style: AppTextStyles.regular16.copyWith(
                            color: AppColors.white,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Text(
                            'آخر زيارة 2019-2-15',
                            style: AppTextStyles.bold14.copyWith(
                              color: AppColors.white,
                              fontSize: 14.sp,
                            ),
                          ),
                          const Spacer(),
                          TextButton.icon(
                            onPressed: () {
                              AppNavigation.goToLogin(context);
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            icon: Icon(
                              isGuest
                                  ? Icons.login_rounded
                                  : Icons.logout_rounded,
                              color: AppColors.white,
                              size: 17.sp,
                            ),
                            label: Text(
                              isGuest ? 'تسجيل الدخول' : 'تسجيل الخروج',
                              style: AppTextStyles.bold14.copyWith(
                                color: AppColors.white,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        ],
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
