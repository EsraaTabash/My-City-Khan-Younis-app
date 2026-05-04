import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/account/data/account_models.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'amount_row.dart';
import 'date_box.dart';

class PaymentCard extends StatelessWidget {
  final PaymentItem item;
  final VoidCallback? onTap;

  const PaymentCard({super.key, required this.item, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        margin: EdgeInsets.only(bottom: 8.h),
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(2.r),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(2.r),
            child: Container(
              height: 95.h,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
              child: Row(
                children: [
                  DateBox(
                    title: 'تاريخ الدفعة',
                    date: item.date,
                    color: const Color(0xFF4F5BD5),
                  ),

                  SizedBox(width: 10.w),

                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AmountRow(
                          title: 'المبلغ المدفوع:',
                          value: item.paidAmount,
                        ),
                        SizedBox(height: 7.h),
                        AmountRow(
                          title: 'المبلغ المطلوب:',
                          value: item.requiredAmount,
                          valueColor: const Color(0xFFD9188D),
                        ),
                        SizedBox(height: 7.h),
                        AmountRow(
                          title: 'المبلغ المخصوم:',
                          value: item.discountAmount,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
