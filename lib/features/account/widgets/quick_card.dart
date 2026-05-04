import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';

class QuickCard extends StatelessWidget {
  final String title;
  final String value;
  final Color backgroundColor;
  final Color titleColor;
  final Color valueColor;
  final VoidCallback? onTap;

  const QuickCard({
    super.key,
    required this.title,
    required this.value,
    required this.backgroundColor,
    required this.titleColor,
    required this.valueColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(3.r),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(3.r),
        child: SizedBox(
          height: 73.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: AppTextStyles.regular14.copyWith(
                  color: titleColor,
                  fontSize: 12.sp,
                ),
              ),
              SizedBox(height: 6.h),
              Text(
                value,
                textAlign: TextAlign.center,
                style: AppTextStyles.semiBold16.copyWith(
                  color: valueColor,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
