import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/features/contact_us/models/contact_models.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';

class MessageCard extends StatelessWidget {
  final ContactMessageItem item;

  const MessageCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 27.h),
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Text(
              item.date,
              textAlign: TextAlign.right,
              textDirection: TextDirection.ltr,
              style: AppTextStyles.regular12.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
          ),

          SizedBox(height: 6.h),

          Container(
            color: Colors.white,
            padding: EdgeInsets.only(top: 12.h, bottom: 12.h, left: 15.h),
            child: Row(
              textDirection: TextDirection.rtl,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(right: 8.w),
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          color: const Color(0xFF079BEE),
                          width: 2.w,
                        ),
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 24.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.type,
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl,
                            style: AppTextStyles.regular14.copyWith(
                              fontFamily: 'Bahij',
                              color: const Color(0xFF079BEE),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                          SizedBox(height: 6.h),

                          // عنوان الشكوى
                          Text(
                            item.title,
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.regular14.copyWith(
                              fontFamily: 'Bahij',
                              color: const Color(0xFF25325B),
                              fontSize: 13.sp,
                              height: 1.4,
                            ),
                          ),

                          SizedBox(height: 7.h),

                          // الوصف
                          Text(
                            item.body,
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.regular14.copyWith(
                              fontFamily: 'Bahij',
                              color: const Color(0xFF6D7280),
                              fontSize: 11.sp,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 12.w),

                // الساعة والباج يسار
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      item.time,
                      textDirection: TextDirection.ltr,
                      style: AppTextStyles.regular12.copyWith(
                        fontFamily: 'Bahij',
                        color: const Color(0xFF9EA4AF),
                      ),
                    ),

                    SizedBox(height: 12.h),

                    Container(
                      width: 22.w,
                      height: 22.w,
                      decoration: const BoxDecoration(
                        color: Color(0xFF079BEE),
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        item.badgeCount.toString(),
                        style: TextStyle(
                          fontFamily: 'Bahij',
                          color: Colors.white,
                          fontSize: 9.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
