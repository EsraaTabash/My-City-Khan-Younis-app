import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';
import 'package:flutter_application_1/core/widgets/AppCard.dart';

class AdItem {
  final String title;
  final String subtitle;
  final String imagePath;

  const AdItem({
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });
}

class AdsSection extends StatelessWidget {
  final List<AdItem> items;

  const AdsSection({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _SectionHeader(title: 'آخر الإعلانات'),
        SizedBox(height: 8.h),
        ...items.map(
          (item) => Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: _AdCard(item: item),
          ),
        ),
      ],
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: List.generate(
            5,
            (index) => Container(
              margin: EdgeInsets.only(left: 6.w),
              width: 8.w,
              height: 8.w,
              decoration: BoxDecoration(
                color: index == 0 ? const Color(0xFF2F3654) : AppColors.primary,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        const Spacer(),
        Text(
          title,
          style: AppTextStyles.regular16.copyWith(
            fontSize: 17.sp,
            color: const Color(0xFF2F3654),
          ),
        ),
      ],
    );
  }
}

class _AdCard extends StatelessWidget {
  final AdItem item;

  const _AdCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      borderRadius: 8.r,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: const Color(0xFFE6E6E6)),
        ),
        child: Padding(
          padding: EdgeInsets.all(12.w),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item.title,
                      textAlign: TextAlign.right,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.regular16.copyWith(
                        fontSize: 15.sp,
                        color: const Color(0xFF2F3654),
                        height: 1.45,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      item.subtitle,
                      textAlign: TextAlign.right,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.regular14.copyWith(
                        fontSize: 13.sp,
                        color: const Color(0xFF8E8E8E),
                        height: 1.45,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 12.w),
              ClipRRect(
                borderRadius: BorderRadius.circular(6.r),
                child: Image.asset(
                  item.imagePath,
                  width: 120.w,
                  height: 82.h,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    width: 120.w,
                    height: 82.h,
                    color: const Color(0xFFEAEAEA),
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
