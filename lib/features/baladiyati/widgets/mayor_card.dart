import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';
import 'package:flutter_application_1/features/baladiyati/data/baladiyati_data.dart';

class MayorCard extends StatelessWidget {
  final MayorInfo mayor;

  const MayorCard({super.key, required this.mayor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 168.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            blurRadius: 18,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      padding: EdgeInsets.only(
        left: 12.w,
        right: 14.w,
        top: 14.h,
        bottom: 14.h,
      ),
      child: Row(
        textDirection: TextDirection.rtl,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(3.r),
            child: Image.asset(
              mayor.imagePath,
              width: 92.w,
              height: 122.h,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: 92.w,
                height: 122.h,
                color: const Color(0xFFE9ECF2),
                child: Icon(Icons.person, size: 34.sp),
              ),
            ),
          ),

          SizedBox(width: 12.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mayor.title,
                  textAlign: TextAlign.right,
                  style: AppTextStyles.regular14.copyWith(
                    color: const Color(0xFF079BEE),
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  mayor.name,
                  textAlign: TextAlign.right,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.regular16.copyWith(
                    color: const Color(0xFF33415C),
                    fontSize: 15.sp,
                  ),
                ),
                SizedBox(height: 9.h),
                Expanded(
                  child: Text(
                    mayor.description,
                    textAlign: TextAlign.right,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.regular14.copyWith(
                      color: const Color(0xFF9AA2AE),
                      fontSize: 11.sp,
                      height: 1.65,
                    ),
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
