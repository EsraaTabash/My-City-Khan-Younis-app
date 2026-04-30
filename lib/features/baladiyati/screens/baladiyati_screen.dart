import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/baladiyati/screens/baladiyati_detail_screen.dart';
import 'package:flutter_application_1/features/baladiyati/screens/baladiyati_news_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';
import 'package:flutter_application_1/features/baladiyati/data/baladiyati_data.dart';
import 'package:flutter_application_1/features/baladiyati/widgets/baladiyati_action_button.dart';
import 'package:flutter_application_1/features/baladiyati/widgets/baladiyati_header.dart';
import 'package:flutter_application_1/features/baladiyati/widgets/city_images_grid.dart';
import 'package:flutter_application_1/features/baladiyati/widgets/mayor_card.dart';
import 'package:flutter_application_1/features/baladiyati/widgets/news_card.dart';

class BaladiyatiScreen extends StatelessWidget {
  final VoidCallback? onMenuTap;

  const BaladiyatiScreen({super.key, this.onMenuTap});
  void _openDetail(BuildContext context, BaladiyatiSection section) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BaladiyatiDetailScreen(
          type: BaladiyatiData.typeFromSection(section),
        ),
      ),
    );
  }

  void _openNews(BuildContext context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (_) => const BaladiyatiNewsScreen()));
  }

  Widget _dots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(
        5,
        (index) => Container(
          width: 8.w,
          height: 8.w,
          margin: EdgeInsets.only(right: 4.w),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == 0
                ? const Color(0xFF263251)
                : const Color(0xFF08A6F4),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF4F4F4),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  BaladiyatiHeader(
                    title: 'بلديتي خان يونس',
                    imagePath: 'assets/images/login_bg.png',
                    onMenuTap: onMenuTap,
                  ),
                  Positioned(
                    left: 16.w,
                    right: 16.w,
                    top: 180.h,
                    child: MayorCard(mayor: BaladiyatiData.mayor),
                  ),
                ],
              ),
              SizedBox(height: 87.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Row(
                  children: BaladiyatiData.actions.map((action) {
                    return BaladiyatiActionButton(
                      label: action.label,
                      backgroundColor: Color(action.colorValue),
                      onTap: () => _openDetail(context, action.section),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 17.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'صور مدينتي',
                          style: AppTextStyles.regular16.copyWith(
                            color: const Color(0xFF333C55),
                            fontSize: 15.sp,
                          ),
                        ),
                        const Spacer(),
                        _dots(),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    CityImagesGrid(imagePaths: BaladiyatiData.cityImages),
                    SizedBox(height: 24.h),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () => _openNews(context),
                          child: Text(
                            'آخر الأخبار',
                            style: AppTextStyles.regular16.copyWith(
                              color: const Color(0xFF333C55),
                              fontSize: 15.sp,
                            ),
                          ),
                        ),
                        const Spacer(),
                        _dots(),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    BaladiyatiNewsCard(
                      item: BaladiyatiData.news.first,
                      onTap: () => _openNews(context),
                    ),
                    SizedBox(height: 24.h),
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
