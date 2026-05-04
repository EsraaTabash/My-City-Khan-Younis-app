import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';

class WalletCard extends StatelessWidget {
  final String title;
  final String value;
  final VoidCallback? onTap;

  const WalletCard({
    super.key,
    required this.title,
    required this.value,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(3.r),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(3.r),
        child: Container(
          height: 70.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.r),
            border: Border.all(color: const Color(0xFFE7E7E7)),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                textDirection: TextDirection.rtl,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    'assets/images/icon23.svg',
                    width: 14.w,
                    height: 14.h,
                    colorFilter: const ColorFilter.mode(
                      Color(0xFF079BEE),
                      BlendMode.srcIn,
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Expanded(
                    child: Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.regular14.copyWith(
                        color: const Color(0xFF4F596B),
                        fontSize: 11.sp,
                        height: 1.1,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5.h),
              SizedBox(
                width: double.infinity,
                child: Text(
                  value,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.regular14.copyWith(
                    color: const Color(0xFF079BEE),
                    fontSize: 14.sp,
                    height: 1.1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
