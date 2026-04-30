import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';
import 'package:flutter_application_1/features/baladiyati/data/baladiyati_data.dart';

class BaladiyatiNewsDetailScreen extends StatelessWidget {
  final BaladiyatiNewsItem item;

  const BaladiyatiNewsDetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              _NewsDetailHeader(item: item),

              SizedBox(height: 26.h),

              _Paragraph(text: BaladiyatiData.dummyText),

              SizedBox(height: 20.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Expanded(
                      child: _ImageBox(
                        imagePath: 'assets/images/Rectangle-4.png',
                      ),
                    ),

                    SizedBox(width: 10.w),

                    Expanded(
                      child: _ImageBox(
                        imagePath: 'assets/images/Rectangle-5.png',
                      ),
                    ),

                    SizedBox(width: 10.w),

                    Expanded(
                      child: _ImageBox(
                        imagePath: 'assets/images/Rectangle-6.png',
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 24.h),

              _Paragraph(text: BaladiyatiData.dummyText),

              SizedBox(height: 24.h),

              _Paragraph(text: BaladiyatiData.dummyText),

              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}

class _NewsDetailHeader extends StatelessWidget {
  final BaladiyatiNewsItem item;

  const _NewsDetailHeader({required this.item});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 293.h,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            item.imagePath,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) =>
                Container(color: const Color(0xFF5773D4)),
          ),

          Container(color: Colors.black.withOpacity(0.20)),

          Positioned(
            top: MediaQuery.of(context).padding.top + 10.h + 60.h,
            right: 16.w,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => Navigator.of(context).pop(),
              child: SizedBox(
                width: 36.w,
                height: 36.w,
                child: Center(
                  child: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.white,
                    size: 24.sp,
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            right: 58.w,
            left: 58.w,
            bottom: 72.h,
            child: Text(
              item.title,
              textAlign: TextAlign.center,
              style: AppTextStyles.semiBold25.copyWith(
                color: Colors.white,
                height: 1.45,
              ),
            ),
          ),

          Positioned(
            right: 22.w,
            left: 22.w,
            bottom: 24.h,
            child: Row(
              textDirection: TextDirection.rtl,
              children: [
                Icon(Icons.calendar_month, color: Colors.white, size: 18.sp),

                SizedBox(width: 5.w),

                Text(
                  '25 - 2 - 2019',
                  style: AppTextStyles.regular14.copyWith(
                    color: Colors.white,
                    fontSize: 11.sp,
                  ),
                ),
                const Spacer(),
                Icon(Icons.dashboard, color: Colors.white, size: 18.sp),

                SizedBox(width: 7.w),

                Text(
                  'أخبار العائلات',
                  style: AppTextStyles.regular14.copyWith(
                    color: Colors.white,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Paragraph extends StatelessWidget {
  final String text;

  const _Paragraph({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 22.w),
      child: Text(
        text,
        textAlign: TextAlign.right,
        style: AppTextStyles.regular14.copyWith(
          color: const Color(0xFFA0A8B3),
          fontSize: 13.sp,
          height: 1.8,
        ),
      ),
    );
  }
}

class _ImageBox extends StatelessWidget {
  final String imagePath;

  const _ImageBox({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(3.r),
      child: Image.asset(
        imagePath,
        height: 118.h,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => Container(
          height: 118.h,
          color: const Color(0xFFE9ECF2),
          child: const Icon(Icons.image_not_supported_outlined),
        ),
      ),
    );
  }
}
