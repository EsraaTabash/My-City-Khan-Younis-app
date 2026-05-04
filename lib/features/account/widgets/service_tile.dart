import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/account/models/account_models.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';

class ServiceTile extends StatelessWidget {
  final ServiceItem item;
  final VoidCallback? onTap;

  const ServiceTile({super.key, required this.item, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3.r),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(3.r),
          child: Container(
            height: 66.h,
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.03),
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                Container(
                  width: 24.w,
                  height: 24.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F5FF),
                    borderRadius: BorderRadius.circular(3.r),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/images/icon24.svg',
                      width: 23.w,
                      height: 23.h,
                      colorFilter: const ColorFilter.mode(
                        Color(0xFF079BEE),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 12.w),

                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    textDirection: TextDirection.rtl,
                    children: [
                      Text(
                        item.title,
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.regular14.copyWith(
                          color: const Color(0xFF4F596B),
                          fontSize: 13.sp,
                        ),
                      ),
                      SizedBox(height: 3.h),
                      Text(
                        item.year,
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.regular14.copyWith(
                          color: const Color(0xFF079BEE),
                          fontSize: 10.sp,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(width: 8.w),

                Icon(
                  Icons.arrow_forward_ios,
                  color: const Color(0xFFA2A7B2),
                  size: 17.sp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
