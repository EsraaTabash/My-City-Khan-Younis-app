import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';

class AppInputBox extends StatelessWidget {
  final String hint;
  final TextEditingController? controller;
  final TextInputType keyboardType;

  const AppInputBox({
    super.key,
    required this.hint,
    this.controller,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 47.h,
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: AppTextStyles.regular14.copyWith(
            color: const Color(0xFFA2A7B2),
            fontSize: 13.sp,
          ),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.r),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.r),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(3.r),
            borderSide: const BorderSide(color: Color(0xFF079BEE)),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
        ),
      ),
    );
  }
}
