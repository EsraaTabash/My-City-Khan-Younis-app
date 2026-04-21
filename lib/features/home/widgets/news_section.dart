import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';
import 'package:flutter_application_1/core/widgets/AppCard.dart';

class NewsItem {
  final String title;
  final String date;
  final String description;
  final String imagePath;

  const NewsItem({
    required this.title,
    required this.date,
    required this.description,
    required this.imagePath,
  });
}

class NewsSection extends StatelessWidget {
  final List<NewsItem> items;

  const NewsSection({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _SectionHeader(title: 'آخر الأخبار'),
        SizedBox(height: 8.h),
        ...items.map(
          (item) => Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: _NewsCard(item: item),
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

class _NewsCard extends StatelessWidget {
  final NewsItem item;

  const _NewsCard({required this.item});

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8.r)),
              child: Image.asset(
                item.imagePath,
                height: 170.h,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) =>
                    Container(height: 170.h, color: const Color(0xFFEAEAEA)),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(14.w, 12.h, 14.w, 14.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    item.title,
                    textAlign: TextAlign.right,
                    style: AppTextStyles.regular16.copyWith(
                      fontSize: 16.sp,
                      color: const Color(0xFF2F3654),
                      height: 1.45,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      item.date,
                      style: AppTextStyles.bold14.copyWith(
                        fontSize: 14.sp,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    item.description,
                    textAlign: TextAlign.right,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.regular14.copyWith(
                      fontSize: 13.sp,
                      color: const Color(0xFF9A9A9A),
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
