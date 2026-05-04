import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';

class InfoTile extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const InfoTile({super.key, required this.title, this.onTap});

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
            height: 52.h,
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                Container(
                  width: 22.w,
                  height: 22.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F5FF),
                    borderRadius: BorderRadius.circular(3.r),
                  ),
                  child: Icon(
                    Icons.account_balance_wallet_outlined,
                    color: const Color(0xFF079BEE),
                    size: 15.sp,
                  ),
                ),

                SizedBox(width: 10.w),

                Expanded(
                  child: Text(
                    title,
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                    style: AppTextStyles.regular14.copyWith(
                      color: const Color(0xFF4F596B),
                      fontSize: 13.sp,
                    ),
                  ),
                ),

                Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.grey,
                  size: 21.sp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
