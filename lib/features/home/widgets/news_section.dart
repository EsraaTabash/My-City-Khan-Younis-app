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
  final VoidCallback? onTap;

  const NewsSection({super.key, required this.items, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _SectionHeader(title: 'آخر الأخبار', onTap: onTap),
        SizedBox(height: 8.h),
        ...items.map(
          (item) => Padding(
            padding: EdgeInsets.only(bottom: 12.h),
            child: _NewsCard(item: item, onTap: onTap),
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
                fontSize: 16.sp,
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

class _NewsCard extends StatelessWidget {
  final NewsItem item;
  final VoidCallback? onTap;

  const _NewsCard({required this.item, this.onTap});

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(8.r)),
                child: Image.asset(
                  item.imagePath,
                  height: 155.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    height: 155.h,
                    color: const Color(0xFFEAEAEA),
                    alignment: Alignment.center,
                    child: const Icon(Icons.image_not_supported_outlined),
                  ),
                ),
              ),
              SizedBox(height: 9.h),
              Padding(
                padding: EdgeInsets.fromLTRB(12.w, 10.h, 12.w, 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _TitleAndDate(item: item),
                    SizedBox(height: 15.h),
                    Text(
                      item.description,
                      textAlign: TextAlign.right,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.regular14.copyWith(
                        fontSize: 10.sp,
                        color: const Color(0xFF8F8F8F),
                        height: 1.4,
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

class _TitleAndDate extends StatelessWidget {
  final NewsItem item;

  const _TitleAndDate({required this.item});

  @override
  Widget build(BuildContext context) {
    final titleStyle = AppTextStyles.semiBold14.copyWith(
      fontSize: 15.sp,
      color: const Color(0xFF2F3654),
      height: 1.3,
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Text(
            item.title,
            textAlign: TextAlign.right,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: titleStyle,
          ),
        ),
        SizedBox(width: 8.w),
        Padding(
          padding: EdgeInsets.only(bottom: 2.h),
          child: Text(
            item.date,
            style: AppTextStyles.regular14.copyWith(
              color: AppColors.primary,
              fontSize: 12.sp,
            ),
          ),
        ),
      ],
    );
  }
}
