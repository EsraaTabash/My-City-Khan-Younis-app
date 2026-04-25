import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/e_orders/model/order_category.dart';
import 'package:flutter_application_1/routes/app_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';

class OrderCategoryCard extends StatefulWidget {
  final OrderCategory category;

  const OrderCategoryCard({super.key, required this.category});

  @override
  State<OrderCategoryCard> createState() => _OrderCategoryCardState();
}

class _OrderCategoryCardState extends State<OrderCategoryCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final hasChildren = widget.category.requests.isNotEmpty;

    if (!hasChildren) {
      return Container(
        margin: EdgeInsets.only(bottom: 8.h),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4.r),
          border: Border.all(color: const Color(0xFFEAEAEA)),
        ),
        child: Row(
          children: [
            Icon(
              Icons.folder_open_outlined,
              size: 18.sp,
              color: AppColors.primary,
            ),
            SizedBox(width: 20.w),
            Expanded(
              child: Text(
                widget.category.title,
                textAlign: TextAlign.right,
                style: AppTextStyles.regular14.copyWith(
                  fontSize: 14.sp,
                  color: const Color(0xFF5E6278),
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Icon(
              Icons.keyboard_arrow_left_rounded,
              color: const Color(0xFF8A90A0),
              size: 20.sp,
            ),
          ],
        ),
      );
    }

    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(color: const Color(0xFFEAEAEA)),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: ExpansionTile(
          onExpansionChanged: (value) {
            setState(() {
              _isExpanded = value;
            });
          },
          tilePadding: EdgeInsets.symmetric(horizontal: 12.w),
          childrenPadding: EdgeInsets.only(bottom: 8.h),
          collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r),
          ),
          leading: Icon(
            Icons.folder_open_outlined,
            size: 18.sp,
            color: AppColors.primary,
          ),
          trailing: Icon(
            _isExpanded
                ? Icons.keyboard_arrow_down_rounded
                : Icons.keyboard_arrow_left_rounded,
            color: const Color(0xFF8A90A0),
            size: 20.sp,
          ),
          title: Text(
            widget.category.title,
            textAlign: TextAlign.right,
            style: AppTextStyles.regular14.copyWith(
              fontSize: 14.sp,
              color: const Color(0xFF5E6278),
            ),
          ),
          children: widget.category.requests
              .map(
                (request) => Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF7F7F7),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          request,
                          textAlign: TextAlign.right,
                          style: AppTextStyles.regular14.copyWith(
                            fontSize: 12.sp,
                            color: const Color(0xFF6B7280),
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      SizedBox(
                        width: 48.w,
                        height: 28.h,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoutes.newOrder);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.zero,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3.r),
                            ),
                          ),
                          child: Text(
                            'تقديم',
                            style: AppTextStyles.semiBold14.copyWith(
                              fontSize: 11.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
