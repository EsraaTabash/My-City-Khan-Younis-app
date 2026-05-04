import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencyHeaderContent extends StatelessWidget {
  const CurrencyHeaderContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 30.h),
        Text(
          'صرف العملات بالنسبة لـ',
          textDirection: TextDirection.rtl,
          style: AppTextStyles.regular14.copyWith(
            fontFamily: 'Bahij',
            color: Colors.white,
            fontSize: 14.sp,
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          '1 \$',
          textDirection: TextDirection.ltr,
          style: TextStyle(
            fontFamily: 'Bahij',
            color: Colors.white,
            fontSize: 56.sp,
            fontWeight: FontWeight.w700,
            height: 1,
          ),
        ),
      ],
    );
  }
}
