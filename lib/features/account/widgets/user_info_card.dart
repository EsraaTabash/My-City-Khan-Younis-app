import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';

class UserInfoCard extends StatelessWidget {
  const UserInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88.h,
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          ClipOval(
            child: Image.asset(
              'assets/images/userimg.png',
              width: 58.w,
              height: 58.w,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) {
                return Container(
                  width: 58.w,
                  height: 58.w,
                  color: const Color(0xFFEDEDED),
                  child: Icon(
                    Icons.person,
                    color: const Color(0xFF079BEE),
                    size: 30.sp,
                  ),
                );
              },
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'أهلاً و سهلاً : ',
                        style: AppTextStyles.regular14.copyWith(
                          color: const Color(0xFF079BEE),
                          fontSize: 14.sp,
                        ),
                      ),
                      TextSpan(
                        text: 'محمد مصباح الرباطي',
                        style: AppTextStyles.regular14.copyWith(
                          color: const Color(0xFF25325B),
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 7.h),
                RichText(
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'رقم الاشتراك : ',
                        style: AppTextStyles.regular14.copyWith(
                          color: const Color(0xFF25325B),
                          fontSize: 11.sp,
                        ),
                      ),
                      TextSpan(
                        text: '152042',
                        style: AppTextStyles.regular14.copyWith(
                          color: const Color(0xFFD9188D),
                          fontSize: 11.sp,
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
