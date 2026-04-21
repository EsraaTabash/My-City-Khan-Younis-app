import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/widgets/AppCard.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';

class QuickAccessSection extends StatelessWidget {
  final bool insideParentCard;

  const QuickAccessSection({super.key, this.insideParentCard = false});

  @override
  Widget build(BuildContext context) {
    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(right: 4.w, bottom: 6.h),
            child: Text(
              'الوصول السريع',
              style: AppTextStyles.regular14.copyWith(
                color: AppColors.primary,
                fontSize: 17.sp,
              ),
            ),
          ),
        ),
        SizedBox(height: 8.h),
        Row(
          children: [
            Expanded(
              child: _QuickCard(
                title: 'جدول المياه',
                subtitle: 'المنطقة الشرقية',
                imagePath: 'assets/images/save-water.png',
                color: const Color(0xFF169DEE),
                iconPosition: QuickCardIconPosition.top,
              ),
            ),
            SizedBox(width: 6.w),
            Expanded(
              child: _QuickCard(
                title: 'شكاوى واقتراحات',
                subtitle: 'رسائل ومقترحين',
                imagePath: 'assets/images/chat.png',
                color: const Color(0xFFD91B8A),
                iconPosition: QuickCardIconPosition.bottom,
              ),
            ),
          ],
        ),
      ],
    );

    if (insideParentCard) return content;

    return AppCard(
      padding: EdgeInsets.fromLTRB(14.w, 14.h, 14.w, 14.h),
      borderRadius: 12.r,
      child: content,
    );
  }
}

enum QuickCardIconPosition { top, bottom }

class _QuickCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final Color color;
  final QuickCardIconPosition iconPosition;

  const _QuickCard({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.color,
    required this.iconPosition,
  });

  @override
  Widget build(BuildContext context) {
    final iconWidget = Image.asset(
      imagePath,
      width: 40.w,
      height: 40.h,
      color: Colors.white,
      colorBlendMode: BlendMode.srcIn,
    );

    final textWidget = Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          textAlign: TextAlign.right,
          style: AppTextStyles.bold14.copyWith(
            color: Colors.white,
            fontSize: 14.5.sp,
            height: 1.1,
          ),
        ),
        SizedBox(height: 3.h),
        Text(
          subtitle,
          textAlign: TextAlign.right,
          style: AppTextStyles.regular16.copyWith(
            color: Colors.white,
            fontSize: 11.2.sp,
            height: 1.1,
          ),
        ),
      ],
    );

    return Container(
      height: 102.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 9.h),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: iconPosition == QuickCardIconPosition.top
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 2.w, top: 1.h),
                    child: iconWidget,
                  ),
                ),
                SizedBox(height: 4.h),
                Align(alignment: Alignment.topRight, child: textWidget),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.only(right: 2.w),
                    child: textWidget,
                  ),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 2.w, bottom: 1.h),
                    child: iconWidget,
                  ),
                ),
              ],
            ),
    );
  }
}
