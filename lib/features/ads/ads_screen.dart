import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';
import 'package:flutter_application_1/features/baladiyati/widgets/baladiyati_header.dart';

class AdsScreen extends StatelessWidget {
  final VoidCallback? onMenuTap;

  const AdsScreen({super.key, this.onMenuTap});

  final List<_AdItem> ads = const [
    _AdItem(
      title: 'إعلان ممارسة كنس لشوارع المدينة',
      subtitle: 'بلدية خانيونس قسم المشتريات',
      publishDate: '15-5-2019',
      endDate: '15-5-2019',
      imagePath: 'assets/images/Rectangle-1.png',
    ),
    _AdItem(
      title: 'إعلان ممارسة صيانة شوارع مع مشروع',
      subtitle: 'بلدية خانيونس قسم المشتريات',
      publishDate: '15-5-2019',
      endDate: '15-5-2019',
      imagePath: 'assets/images/Rectangle-2.png',
    ),
    _AdItem(
      title: 'إعلان توريد و تركيب مكيفات جديدة',
      subtitle: 'بلدية خانيونس قسم المشتريات',
      publishDate: '15-5-2019',
      endDate: '15-5-2019',
      imagePath: 'assets/images/Rectangle-3.png',
    ),
    _AdItem(
      title: 'إعلان مناقصة أدوات مكتبية و دهانات',
      subtitle: 'بلدية خانيونس قسم المشتريات',
      publishDate: '15-5-2019',
      endDate: '15-5-2019',
      imagePath: 'assets/images/news_bg.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF4F4F4),
        body: Stack(
          children: [
            Column(
              children: [
                BaladiyatiHeader(
                  title: 'إعلانات البلدية',
                  imagePath: 'assets/images/login_bg.png',
                  onBackTap: () {
                    // يرجع للرئيسية داخل HomeScreen غير مطلوب هنا
                  },
                  onMenuTap: onMenuTap,
                ),
                Expanded(child: Container(color: Colors.white)),
              ],
            ),

            Positioned(
              top: 145.h,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                color: Colors.white,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.only(top: 16.h, bottom: 20.h),
                  itemCount: ads.length,
                  separatorBuilder: (_, __) => SizedBox(height: 10.h),
                  itemBuilder: (context, index) {
                    return _AdListItem(item: ads[index]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AdItem {
  final String title;
  final String subtitle;
  final String publishDate;
  final String endDate;
  final String imagePath;

  const _AdItem({
    required this.title,
    required this.subtitle,
    required this.publishDate,
    required this.endDate,
    required this.imagePath,
  });
}

class _AdListItem extends StatelessWidget {
  final _AdItem item;

  const _AdListItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 112.h,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(3.r),
            child: Image.asset(
              item.imagePath,
              width: 105.w,
              height: 92.h,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: 105.w,
                height: 92.h,
                color: const Color(0xFFE9ECF2),
                child: const Icon(Icons.image_not_supported_outlined),
              ),
            ),
          ),

          SizedBox(width: 16.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  textAlign: TextAlign.right,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.regular16.copyWith(
                    color: const Color(0xFF079BEE),
                    fontSize: 14.sp,
                    height: 1.2,
                  ),
                ),

                SizedBox(height: 5.h),

                Text(
                  item.subtitle,
                  textAlign: TextAlign.right,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.regular14.copyWith(
                    color: const Color(0xFF4F596B),
                    fontSize: 11.sp,
                    height: 1.2,
                  ),
                ),

                SizedBox(height: 6.h),

                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Text(
                      'تاريخ النشر',
                      style: AppTextStyles.regular14.copyWith(
                        color: const Color(0xFF4F596B),
                        fontSize: 11.sp,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      item.publishDate,
                      style: AppTextStyles.regular14.copyWith(
                        color: const Color(0xFF079BEE),
                        fontSize: 11.sp,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 3.h),

                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Text(
                      'تاريخ الانتهاء',
                      style: AppTextStyles.regular14.copyWith(
                        color: const Color(0xFF4F596B),
                        fontSize: 11.sp,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      item.endDate,
                      style: AppTextStyles.regular14.copyWith(
                        color: const Color(0xFFD9188D),
                        fontSize: 11.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
