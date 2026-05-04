import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';
import 'package:flutter_application_1/features/currency/data/currency_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CurrencyCard extends StatelessWidget {
  final CurrencyItem item;

  const CurrencyCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52.h,
      padding: EdgeInsets.symmetric(horizontal: 13.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 7,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          ClipOval(
            child: SvgPicture.asset(
              item.flagPath,
              width: 22.w,
              height: 22.w,
              fit: BoxFit.cover,
              placeholderBuilder: (_) {
                return Container(
                  width: 22.w,
                  height: 22.w,
                  color: const Color(0xFFEDEDED),
                );
              },
            ),
          ),

          SizedBox(width: 10.w),

          Expanded(
            child: Text(
              item.name,
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              style: AppTextStyles.regular14.copyWith(
                fontFamily: 'Bahij',
                color: const Color(0xFF4F596B),
                fontSize: 14.sp,
              ),
            ),
          ),

          Text(
            item.value,
            textDirection: TextDirection.ltr,
            style: AppTextStyles.regular14.copyWith(
              fontFamily: 'Bahij',
              color: const Color(0xFF079BEE),
              fontSize: 12.sp,
            ),
          ),

          SizedBox(width: 8.w),

          Text(
            item.currency,
            textDirection: TextDirection.rtl,
            style: AppTextStyles.regular14.copyWith(
              fontFamily: 'Bahij',
              color: const Color(0xFF079BEE),
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}
