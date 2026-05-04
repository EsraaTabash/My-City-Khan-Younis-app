import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';

class AppDropdownBox extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const AppDropdownBox({super.key, required this.text, this.onTap});

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
            height: 47.h,
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                Expanded(
                  child: Text(
                    text,
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                    style: AppTextStyles.regular14.copyWith(
                      color: const Color(0xFFA2A7B2),
                      fontSize: 13.sp,
                    ),
                  ),
                ),

                Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.grey,
                  size: 22.sp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
