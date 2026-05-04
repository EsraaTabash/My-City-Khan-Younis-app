import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';
import 'package:flutter_application_1/core/widgets/primary_button.dart';
import 'package:flutter_application_1/core/widgets/secondary_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
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
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  SizedBox(height: 85.h),
                  Text('مرحباً بكم في', style: AppTextStyles.regular24),
                  SizedBox(height: 7.h),
                  Text(
                    'مدينتي خان يونس',
                    style: AppTextStyles.semiBold28.copyWith(
                      color: AppColors.secondary,
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Image.asset(
                        'assets/images/splash_illustration.png',
                        height: 320.h,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(height: 7.h),
                  PrimaryButton(
                    text: 'تسجيل الدخول',
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    height: 50,
                    borderRadius: 6,
                  ),
                  SizedBox(height: 14.h),
                  SecondaryButton(
                    text: 'تجاهل و استمرار',
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        '/home',
                        arguments: true,
                      );
                    },
                    height: 50,
                    borderRadius: 6,
                  ),
                  SizedBox(height: 120.h),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: SizedBox(
              height: 120.h,
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
                      children: [
                        Text(
                          'بلدية خان يونس',
                          style: AppTextStyles.secondaryText14.copyWith(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          'بإدارة',
                          style: AppTextStyles.secondaryText14.copyWith(
                            color: AppColors.textPrimary,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Image.asset(
                          'assets/images/logo.png',
                          width: 30.w,
                          height: 38.h,
                          fit: BoxFit.contain,
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
    );
  }
}
