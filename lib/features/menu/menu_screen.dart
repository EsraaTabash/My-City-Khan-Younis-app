import 'package:flutter/material.dart';
import 'package:flutter_application_1/routes/app_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';
import 'package:flutter_application_1/features/menu/widgets/menu_item_tile.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final menuItems = <_MenuItemData>[
      const _MenuItemData(
        title: 'الأخبار',
        iconPath: 'assets/images/icon1.svg',
        //route: AppRoutes.news,
      ),
      const _MenuItemData(
        title: 'دليل الخدمات',
        iconPath: 'assets/images/icon2.svg',
        //route: AppRoutes.servicesGuide,
      ),
      const _MenuItemData(
        title: 'طلباتي',
        iconPath: 'assets/images/icon3.svg',
        badgeCount: 3,
        route: AppRoutes.eOrders,
      ),
      const _MenuItemData(
        title: 'الوظائف',
        iconPath: 'assets/images/icon4.svg',
        badgeCount: 3,
        //route: AppRoutes.jobs,
      ),
      const _MenuItemData(
        title: 'العملات',
        iconPath: 'assets/images/icon5.svg',
        //route: AppRoutes.currency,
      ),
      const _MenuItemData(
        title: 'مواقيت الصلاة',
        iconPath: 'assets/images/icon6.svg',
        //route: AppRoutes.prayerTimes,
      ),
      const _MenuItemData(
        title: 'حالة الطقس',
        iconPath: 'assets/images/icon7.svg',
        //route: AppRoutes.weather,
      ),
      const _MenuItemData(
        title: 'تواصل معنا',
        iconPath: 'assets/images/icon8.svg',
        //route: AppRoutes.contactUs,
      ),
      const _MenuItemData(
        title: 'عن التطبيق',
        iconPath: 'assets/images/icon9.svg',
        //route: AppRoutes.aboutApp,
      ),
      const _MenuItemData(
        title: 'مشاركة التطبيق',
        iconPath: 'assets/images/icon10.svg',
        //route: AppRoutes.shareApp,
      ),
      const _MenuItemData(
        title: 'سياسة الاستخدام',
        iconPath: 'assets/images/icon11.svg',
        //route: AppRoutes.usagePolicy,
      ),
    ];
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Column(
          children: [
            /// 🔹 HEADER
            Container(
              height: 109.h,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset('assets/images/header_bg.png', fit: BoxFit.cover),

                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.primary.withOpacity(0.7),
                          AppColors.gradientEnd.withOpacity(0.7),
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(
                      top: 34.h,
                      left: 14.w,
                      right: 14.w,
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: Text(
                            'القائمة',
                            style: AppTextStyles.semiBold16.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            onPressed: () => Navigator.of(context).pop(),
                            padding: EdgeInsets.zero,
                            constraints: const BoxConstraints(),
                            icon: Icon(
                              Icons.close_rounded,
                              color: AppColors.white,
                              size: 26.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// 🔹 LIST
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemCount: menuItems.length,
                separatorBuilder: (_, __) => Divider(
                  height: 1.h,
                  thickness: 1,
                  color: const Color(0xFFEAEAEA),
                  indent: 14.w,
                  endIndent: 14.w,
                ),
                itemBuilder: (context, index) {
                  final item = menuItems[index];
                  return MenuItemTile(
                    title: item.title,
                    iconPath: item.iconPath,
                    badgeCount: item.badgeCount,
                    onTap: () {
                      Navigator.of(context).pop();

                      if (item.route != null) {
                        Navigator.pushNamed(
                          context,
                          item.route ?? AppRoutes.home,
                        );
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuItemData {
  final String title;
  final String iconPath;
  final int? badgeCount;
  final String? route;

  const _MenuItemData({
    required this.title,
    required this.iconPath,
    this.badgeCount,
    this.route,
  });
}
