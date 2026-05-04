import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';

class ContactDropdownBox extends StatelessWidget {
  final String hint;
  final VoidCallback? onTap;

  const ContactDropdownBox({super.key, required this.hint, this.onTap});

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
                    hint,
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                    style: AppTextStyles.regular14.copyWith(
                      fontFamily: 'Bahij',
                      color: const Color(0xFFA2A7B2),
                      fontSize: 14.sp,
                    ),
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: const Color(0xFFA2A7B2),
                  size: 20.sp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
