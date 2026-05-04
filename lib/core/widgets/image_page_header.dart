import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImagePageHeader extends StatelessWidget {
  final String title;
  final String backgroundImage;
  final double height;
  final Widget? content;
  final VoidCallback? onBackTap;
  final VoidCallback? onMenuTap;
  final bool showShareIcon;

  const ImagePageHeader({
    super.key,
    required this.title,
    required this.backgroundImage,
    this.height = 280,
    this.content,
    this.onBackTap,
    this.onMenuTap,
    this.showShareIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        height: height.h,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              backgroundImage,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) {
                return Container(color: const Color(0xFF5773D4));
              },
            ),

            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    AppColors.primary.withOpacity(0.62),
                    AppColors.secondary.withOpacity(0.58),
                  ],
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  SizedBox(height: 18.h),

                  SizedBox(
                    height: 40.h,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Center(
                          child: Text(
                            title,
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                            style: AppTextStyles.semiBold18.copyWith(
                              fontFamily: 'Bahij',
                              color: Colors.white,
                              fontSize: 18.sp,
                            ),
                          ),
                        ),

                        Align(
                          alignment: Alignment.centerRight,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            textDirection: TextDirection.rtl,
                            children: [
                              InkWell(
                                onTap:
                                    onBackTap ?? () => Navigator.pop(context),
                                borderRadius: BorderRadius.circular(8.r),
                                child: Padding(
                                  padding: EdgeInsets.all(4.w),
                                  child: Icon(
                                    Icons.arrow_back_rounded,
                                    color: Colors.white,
                                    size: 26.sp,
                                  ),
                                ),
                              ),

                              SizedBox(width: 16.w),

                              InkWell(
                                onTap: onMenuTap,
                                borderRadius: BorderRadius.circular(8.r),
                                child: Padding(
                                  padding: EdgeInsets.all(4.w),
                                  child: SvgPicture.asset(
                                    'assets/images/menu.svg',
                                    width: 24.w,
                                    height: 24.h,
                                    colorFilter: const ColorFilter.mode(
                                      Colors.white,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        if (showShareIcon)
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Icon(
                              Icons.share_outlined,
                              color: Colors.white,
                              size: 22.sp,
                            ),
                          ),
                      ],
                    ),
                  ),
                  if (content != null) Expanded(child: content!),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
