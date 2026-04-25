import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';
import 'package:flutter_application_1/features/e_orders/widgets/e_orders_header.dart';

class NewOrderScreen extends StatelessWidget {
  const NewOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF3F5F8),
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              EOrdersHeader(
                title: 'طلب جديد',
                onBackTap: () => Navigator.of(context).pop(),
              ),

              Container(
                width: double.infinity,
                height: 43.h,
                color: Colors.white,
                alignment: Alignment.center,
                child: Text(
                  'منح شهادة خلو من العائدة',
                  style: AppTextStyles.regular14.copyWith(
                    fontSize: 14.sp,
                    color: const Color(0xFF5E6278),
                  ),
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(14.w, 22.h, 14.w, 16.h),
                  child: Column(
                    children: [
                      Container(
                        height: 260.h,
                        padding: EdgeInsets.all(13.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4.r),
                          border: Border.all(color: const Color(0xFFEAEAEA)),
                        ),
                        child: Column(
                          children: [
                            TextField(
                              maxLines: 6,
                              minLines: 6,
                              textAlign: TextAlign.right,
                              textAlignVertical: TextAlignVertical.top,
                              decoration: InputDecoration(
                                hintText: 'ملاحظات و تفاصيل',
                                hintStyle: AppTextStyles.regular14.copyWith(
                                  fontSize: 13.sp,
                                  color: const Color(0xFFB0B4BD),
                                ),
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                                counterText: '',
                              ),
                              maxLength: 3000,
                            ),

                            SizedBox(height: 6.h),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '0 / 3000',
                                  style: AppTextStyles.regular14.copyWith(
                                    fontSize: 11.sp,
                                    color: const Color(0xFF7A7F8A),
                                  ),
                                ),

                                SizedBox(height: 6.h),

                                Stack(
                                  children: [
                                    Container(
                                      height: 2.h,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFE5E7EB),
                                        borderRadius: BorderRadius.circular(
                                          2.r,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 2.h,
                                      width: 120.w,
                                      decoration: BoxDecoration(
                                        color: AppColors.primary,
                                        borderRadius: BorderRadius.circular(
                                          2.r,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 8.h),

                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'بإمكانك كتابة ملاحظات تعزز طلبك و تفيدنا في معرفة تفاصيل أكثر',
                                style: AppTextStyles.regular14.copyWith(
                                  fontSize: 11.sp,
                                  color: const Color(0xFF7A7F8A),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 18.h),

                      Container(
                        height: 80.h,
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE0F0F7),
                          borderRadius: BorderRadius.circular(4.r),
                          border: Border.all(color: const Color(0xFFC7E3EF)),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 56.w,
                              height: 38.h,
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(3.r),
                                image: const DecorationImage(
                                  image: AssetImage("assets/images/Folder.png"),
                                ),
                              ),
                            ),
                            SizedBox(width: 15.w),

                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'إرفاق ملفات',
                                    style: AppTextStyles.semiBold14.copyWith(
                                      fontSize: 14.sp,
                                      color: const Color(0xFF2F3654),
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    'بإمكانك إرفاق ملفات لدعم طلبك',
                                    style: AppTextStyles.regular14.copyWith(
                                      fontSize: 11.sp,
                                      color: const Color(0xFF6B7280),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 28.h),

                      Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: 180.w,
                          height: 48.h,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                            ),
                            child: Text(
                              'إرسال الطلب',
                              style: AppTextStyles.semiBold16.copyWith(
                                color: Colors.white,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                height: 78.h,
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x11000000),
                      blurRadius: 12,
                      offset: Offset(0, -2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(text: 'مدة إنجاز الطلب: '),
                            TextSpan(
                              text: '2 يوم',
                              style: TextStyle(color: AppColors.primary),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                        style: AppTextStyles.regular14.copyWith(
                          fontSize: 13.sp,
                          color: const Color(0xFF5E6278),
                        ),
                      ),
                    ),
                    Container(
                      height: 36.h,
                      width: 1.w,
                      color: const Color(0xFFD7D7D7),
                    ),
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(text: 'رسوم المعاملة: '),
                            TextSpan(
                              text: '25 ش',
                              style: TextStyle(color: AppColors.primary),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                        style: AppTextStyles.regular14.copyWith(
                          fontSize: 13.sp,
                          color: const Color(0xFF5E6278),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
