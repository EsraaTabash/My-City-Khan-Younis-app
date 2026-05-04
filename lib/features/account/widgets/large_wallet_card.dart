import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';

class LargeWalletCard extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const LargeWalletCard({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(3.r),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(3.r),
        child: Container(
          height: 142.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.r),
            border: Border.all(color: const Color(0xFFE7E7E7)),
          ),
          padding: EdgeInsets.all(14.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                textDirection: TextDirection.rtl,
                children: [
                  SvgPicture.asset(
                    'assets/images/icon23.svg',
                    width: 17.w,
                    height: 17.h,
                    colorFilter: const ColorFilter.mode(
                      Color(0xFF079BEE),
                      BlendMode.srcIn,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    title,
                    style: AppTextStyles.regular14.copyWith(
                      color: const Color(0xFF4F596B),
                      fontSize: 13.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
