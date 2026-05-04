import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';
import 'package:flutter_application_1/core/widgets/app_header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/attachment_box.dart';
import '../widgets/contact_dropdown_box.dart';
import '../widgets/contact_input_box.dart';

class NewMessageScreen extends StatelessWidget {
  const NewMessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF4F4F4),
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              AppHeader(
                title: 'تقديم شكوى أو اقتراح',
                onBackTap: () => Navigator.pop(context),
              ),

              Expanded(
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 12.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'أبلغ عن مشكلة',
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.right,
                          style: AppTextStyles.regular14,
                        ),
                      ),

                      SizedBox(height: 8.h),

                      const ContactDropdownBox(
                        hint: 'مثال : تسريب في خطوط المياه',
                      ),

                      SizedBox(height: 10.h),

                      const ContactInputBox(
                        hint: 'أدخل عنوان المشكلة أو الاقتراح',
                      ),

                      SizedBox(height: 10.h),

                      const ContactInputBox(
                        hint: 'أدخل رقم الجوال',
                        keyboardType: TextInputType.phone,
                      ),

                      SizedBox(height: 10.h),

                      const ContactInputBox(
                        hint: 'ملاحظات وتفاصيل',
                        maxLines: 7,
                        showCounter: true,
                      ),

                      SizedBox(height: 14.h),

                      const AttachmentBox(),

                      SizedBox(height: 30.h),
                    ],
                  ),
                ),
              ),

              Container(
                width: double.infinity,
                color: Colors.white,
                padding: EdgeInsets.fromLTRB(15.w, 12.h, 15.w, 16.h),
                child: SizedBox(
                  height: 45.h,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF079BEE),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                    child: Text(
                      'إرسال الآن',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontFamily: 'Bahij',
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
