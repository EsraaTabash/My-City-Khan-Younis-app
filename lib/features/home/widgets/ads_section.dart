import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';
import 'package:flutter_application_1/core/widgets/AppCard.dart';

class AdItem {
  final String title;
  final String subtitle;
  final String imagePath;
  final String date;

  const AdItem({
    required this.title,
    required this.subtitle,
    required this.imagePath,
    required this.date,
  });
}

class AdsSection extends StatelessWidget {
  final List<AdItem> items;
  final VoidCallback? onTap;

  const AdsSection({super.key, required this.items, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _SectionHeader(title: 'آخر الإعلانات', onTap: onTap),
        SizedBox(height: 8.h),
        ...items.map(
          (item) => Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: _AdCard(item: item, onTap: onTap),
          ),
        ),
      ],
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const _SectionHeader({required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6.r),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 4.h),
        child: Row(
          children: [
            Text(
              title,
              style: AppTextStyles.regular16.copyWith(
                fontSize: 17.sp,
                color: const Color(0xFF2F3654),
              ),
            ),
            const Spacer(),
            Row(
              children: List.generate(
                5,
                (index) => Container(
                  margin: EdgeInsets.only(left: 6.w),
                  width: 8.w,
                  height: 8.w,
                  decoration: BoxDecoration(
                    color: index == 0
                        ? const Color(0xFF2F3654)
                        : AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AdCard extends StatelessWidget {
  final AdItem item;
  final VoidCallback? onTap;

  const _AdCard({required this.item, this.onTap});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      elevation: 0,
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      borderRadius: 8.r,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8.r),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: const Color(0xFFE6E6E6)),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4.r),
                child: Image.asset(
                  item.imagePath,
                  width: 120.w,
                  height: 100.h,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    width: 120.w,
                    height: 82.h,
                    color: const Color(0xFFEAEAEA),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        textAlign: TextAlign.right,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.semiBold14.copyWith(
                          fontSize: 13.sp,
                          color: AppColors.textPrimary,
                          height: 1.45,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        item.subtitle,
                        textAlign: TextAlign.right,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.regular12.copyWith(
                          fontSize: 10.sp,
                          color: const Color(0xFF8E8E8E),
                          height: 1.45,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          item.date,
                          style: AppTextStyles.regular12.copyWith(
                            fontSize: 11.sp,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 8.w),
            ],
          ),
        ),
      ),
    );
  }
}
