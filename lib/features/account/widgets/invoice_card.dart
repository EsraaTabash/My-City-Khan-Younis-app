import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/account/data/account_models.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'amount_row.dart';
import 'date_box.dart';

class InvoiceCard extends StatelessWidget {
  final InvoiceItem item;
  final VoidCallback? onTap;

  const InvoiceCard({super.key, required this.item, this.onTap});

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
              height: 86.h,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
              child: Row(
                children: [
                  DateBox(
                    title: 'تاريخ الفاتورة',
                    date: item.date,
                    color: const Color(0xFF079BEE),
                  ),
                  SizedBox(width: 27.w),
                  Expanded(
                    child: Column(
                      children: [
                        AmountRow(
                          title: 'المبلغ التراكمي:',
                          value: item.cumulativeAmount,
                        ),
                        SizedBox(height: 10.h),
                        AmountRow(
                          title: 'الشهر الحالي:',
                          value: item.currentMonthAmount,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 27.w),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 17.sp,
                    color: const Color(0xFF4F596B),
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
