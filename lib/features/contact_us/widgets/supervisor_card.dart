import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/contact_us/models/contact_models.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SupervisorCard extends StatelessWidget {
  final SupervisorItem item;

  const SupervisorCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        height: 34.h,
        child: Row(
          textDirection: TextDirection.rtl,
          children: [
            SvgPicture.asset(
              'assets/images/icon25.svg',
              width: 15.w,
              height: 15.h,
              colorFilter: const ColorFilter.mode(
                Color(0xFF25325B),
                BlendMode.srcIn,
              ),
            ),

            SizedBox(width: 7.w),

            Expanded(
              child: Text(
                item.name,
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.regular14.copyWith(
                  fontFamily: 'Bahij',
                  color: const Color(0xFF25325B),
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),

            SizedBox(width: 10.w),

            SvgPicture.asset(
              'assets/images/icon26.svg',
              width: 17.w,
              height: 17.h,
              colorFilter: const ColorFilter.mode(
                Color(0xFF079BEE),
                BlendMode.srcIn,
              ),
            ),
            SizedBox(width: 8.w),

            Text(
              item.phone,
              textDirection: TextDirection.ltr,
              textAlign: TextAlign.left,
              style: AppTextStyles.regular14.copyWith(
                fontFamily: 'Bahij',
                color: const Color(0xFF079BEE),
                fontSize: 13.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
