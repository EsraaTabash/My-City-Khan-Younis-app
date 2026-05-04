import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';

class AttachmentBox extends StatelessWidget {
  final VoidCallback? onTap;

  const AttachmentBox({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Material(
        color: const Color(0xFFEAF6FB),
        borderRadius: BorderRadius.circular(3.r),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(3.r),
          child: Container(
            height: 72.h,
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            decoration: BoxDecoration(
              color: const Color(0xFFEAF6FB),
              borderRadius: BorderRadius.circular(3.r),
              border: Border.all(color: const Color(0xFFD6EAF3)),
            ),
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                Image.asset(
                  'assets/images/Folder.png',
                  width: 58.w,
                  height: 36.h,
                  fit: BoxFit.contain,
                ),

                SizedBox(width: 15.w),

                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'إرفاق ملفات',
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.right,
                        style: AppTextStyles.regular14.copyWith(
                          fontFamily: 'Bahij',
                          color: const Color(0xFF4F596B),
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 3.h),
                      Text(
                        'بإمكانك إرفاق ملفات تدعم طلبك',
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.right,
                        style: AppTextStyles.regular14.copyWith(
                          fontFamily: 'Bahij',
                          color: const Color(0xFFA2A7B2),
                          fontSize: 11.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
