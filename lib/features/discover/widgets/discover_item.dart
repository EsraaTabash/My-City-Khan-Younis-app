import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DiscoverItem extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback? onTap;

  const DiscoverItem({
    required this.title,
    required this.imagePath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4.r),
      child: Container(
        height: 52.h,
        margin: EdgeInsets.only(bottom: 6.h),
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4.r),
        ),
        child: Row(
          children: [
            SvgPicture.asset(imagePath, width: 22.sp),
            SizedBox(width: 13.w),
            Text(
              title,
              style: AppTextStyles.regular14.copyWith(
                color: const Color(0xFF4B4F58),
              ),
            ),
            const Spacer(),
            Icon(Icons.keyboard_arrow_left_rounded, size: 18.sp),
          ],
        ),
      ),
    );
  }
}
