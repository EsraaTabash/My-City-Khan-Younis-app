import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/e_orders/model/my_order_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';

class MyOrderCard extends StatelessWidget {
  final MyOrderItem item;
  final VoidCallback? onTap;

  const MyOrderCard({super.key, required this.item, this.onTap});

  @override
  Widget build(BuildContext context) {
    final isApproved = item.status == 'تم الطلب';

    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 8.h),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4.r),
          border: Border.all(color: const Color(0xFFEAEAEA)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        item.title,
                        style: AppTextStyles.semiBold14.copyWith(
                          fontSize: 15.sp,
                          color: AppColors.primary,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        item.status,
                        style: AppTextStyles.semiBold14.copyWith(
                          fontSize: 13.sp,
                          color: isApproved
                              ? const Color(0xFF39B54A)
                              : const Color(0xFFE91E63),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),

                  RichText(
                    text: TextSpan(
                      style: AppTextStyles.regular14.copyWith(fontSize: 12.sp),
                      children: [
                        const TextSpan(
                          text: 'تاريخ الطلب: ',
                          style: TextStyle(color: Color(0xFF6B7280)),
                        ),
                        TextSpan(
                          text: item.date,
                          style: const TextStyle(
                            color: Color(0xFF1295F3),
                          ), // 🔵 أزرق
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 2.h),

                  RichText(
                    text: TextSpan(
                      style: AppTextStyles.regular14.copyWith(fontSize: 12.sp),
                      children: [
                        const TextSpan(
                          text: 'رسوم المعاملة: ',
                          style: TextStyle(color: Color(0xFF6B7280)),
                        ),
                        TextSpan(
                          text: item.fees,
                          style: const TextStyle(
                            color: Color(0xFF1295F3),
                          ), // 🔵 أزرق
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10.w),
            Icon(
              Icons.keyboard_arrow_left_rounded,
              color: const Color(0xFF7A7F8A),
              size: 22.sp,
            ),
          ],
        ),
      ),
    );
  }
}
