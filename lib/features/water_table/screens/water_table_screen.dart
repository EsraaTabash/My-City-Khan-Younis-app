import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/routes/app_routes.dart';
import 'package:flutter_application_1/core/routes/app_navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';
import 'package:flutter_application_1/core/widgets/app_header.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_application_1/features/water_table/data/water_regions_data.dart';

class WaterTableScreen extends StatefulWidget {
  const WaterTableScreen({super.key});

  @override
  State<WaterTableScreen> createState() => _WaterTableScreenState();
}

class _WaterTableScreenState extends State<WaterTableScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF3F5F8),
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              AppHeader(
                title: 'جدول المياه',
                onBackTap: () => Navigator.pop(context),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 16.h,
                  ),
                  itemCount: WaterRegionsData.regions.length,
                  itemBuilder: (context, index) {
                    final region = WaterRegionsData.regions[index];

                    return GestureDetector(
                      onTap: () {
                        AppNavigation.push(
                          context,
                          AppRoutes.waterTableDetail,
                          arguments: region,
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 12.h),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 16.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/images/waterimg.svg",
                              width: 32.w,
                              height: 32.w,
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Text(
                                region['name'],
                                style: AppTextStyles.regular14.copyWith(
                                  color: AppColors.textPrimary,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: AppColors.primary,
                              size: 16.sp,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
