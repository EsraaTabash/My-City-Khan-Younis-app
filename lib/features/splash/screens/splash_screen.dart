import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/routes/app_routes.dart';
import 'package:flutter_application_1/core/routes/app_navigation.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const String splashFontFamily = 'Bahij';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;

    final footerHeight = math.min(math.max(screenHeight * 0.14, 95.0), 120.0);
    final topSpacing = math.min(math.max(screenHeight * 0.07, 36.0), 72.0);
    final illustrationHeight = math.min(
      math.max(screenHeight * 0.30, 210.0),
      300.0,
    );

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.background,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                'assets/images/Circle_1.png',
                width: 206.w,
                fit: BoxFit.contain,
              ),
            ),
            SafeArea(
              bottom: false,
              child: Padding(
                padding: EdgeInsets.fromLTRB(24.w, 0, 24.w, footerHeight.h),
                child: Column(
                  children: [
                    SizedBox(height: topSpacing.h),
                    Text(
                      'مرحباً بكم في',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: splashFontFamily,
                        color: AppColors.textPrimary,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 7.h),
                    Text(
                      'مدينتي خان يونس',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: splashFontFamily,
                        color: AppColors.secondary,
                        fontSize: 28.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Image.asset(
                          'assets/images/splash_illustration.png',
                          height: illustrationHeight.h,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    _SplashButton(
                      text: 'تسجيل الدخول',
                      backgroundColor: AppColors.primary,
                      textColor: Colors.white,
                      borderColor: AppColors.primary,
                      onTap: () {
                        AppNavigation.push(context, AppRoutes.login);
                      },
                    ),
                    SizedBox(height: 14.h),
                    _SplashButton(
                      text: 'تجاهل و استمرار',
                      backgroundColor: AppColors.secondary,
                      textColor: Colors.white,
                      borderColor: AppColors.secondary,
                      onTap: () {
                        AppNavigation.goToHome(context, isGuest: true);
                      },
                    ),
                    SizedBox(height: 16.h),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: SizedBox(
                height: footerHeight.h,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        'assets/images/splash_bg.png',
                        fit: BoxFit.cover,
                        alignment: Alignment.bottomCenter,
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        textDirection: TextDirection.rtl,
                        children: [
                          Image.asset(
                            'assets/images/logo.png',
                            width: 30.w,
                            height: 38.h,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            'بإدارة',
                            style: TextStyle(
                              fontFamily: splashFontFamily,
                              color: AppColors.textPrimary,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            'بلدية خان يونس',
                            style: TextStyle(
                              fontFamily: splashFontFamily,
                              color: AppColors.primary,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SplashButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final VoidCallback onTap;

  const _SplashButton({
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.borderColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.r),
            side: BorderSide(color: borderColor),
          ),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: splashFontFamily,
            color: textColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
