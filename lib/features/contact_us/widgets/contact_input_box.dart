import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';

class ContactInputBox extends StatelessWidget {
  final String hint;
  final int maxLines;
  final bool showCounter;
  final TextEditingController? controller;
  final TextInputType keyboardType;

  const ContactInputBox({
    super.key,
    required this.hint,
    this.maxLines = 1,
    this.showCounter = false,
    this.controller,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDetailsBox = maxLines > 1;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: isDetailsBox ? 165.h : 47.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(3.r),
        ),
        child: Stack(
          children: [
            TextField(
              controller: controller,
              keyboardType: keyboardType,
              maxLines: isDetailsBox ? null : 1,
              minLines: isDetailsBox ? null : 1,
              expands: isDetailsBox,
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              textAlignVertical: TextAlignVertical.top,
              style: AppTextStyles.regular14.copyWith(
                fontFamily: 'Bahij',
                color: const Color(0xFF4F596B),
                fontSize: 12.sp,
              ),
              decoration: InputDecoration(
                hintText: hint,
                hintTextDirection: TextDirection.rtl,
                hintStyle: AppTextStyles.regular14.copyWith(
                  fontFamily: 'Bahij',
                  color: const Color(0xFFA2A7B2),
                ),
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
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.fromLTRB(
                  12.w,
                  14.h,
                  12.w,
                  isDetailsBox ? 58.h : 12.h,
                ),
              ),
            ),

            if (showCounter && isDetailsBox) ...[
              Positioned(
                left: 12.w,
                bottom: 42.h,
                child: Text(
                  '0 / 3000',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    fontFamily: 'Bahij',
                    color: const Color(0xFF8D94A3),
                    fontSize: 11.sp,
                  ),
                ),
              ),

              Positioned(
                left: 12.w,
                right: 12.w,
                bottom: 32.h,
                child: Stack(
                  children: [
                    Container(
                      height: 1.3.h,
                      width: double.infinity,
                      color: const Color(0xFFE1E6EE),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: 1.3.h,
                        width: 95.w,
                        color: const Color(0xFF079BEE),
                      ),
                    ),
                  ],
                ),
              ),

              Positioned(
                right: 12.w,
                left: 12.w,
                bottom: 12.h,
                child: Text(
                  'بإمكانك كتابة ملاحظات بما يفيدنا في معرفة تفاصيل أكثر',
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: 'Bahij',
                    color: const Color(0xFF7B8190),
                    fontSize: 11.sp,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
