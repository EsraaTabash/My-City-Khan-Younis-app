import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';
import 'package:flutter_application_1/features/menu/widgets/menu_item_tile.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final menuItems = <_MenuItemData>[
      const _MenuItemData(title: 'الأخبار', icon: Icons.article_outlined),
      const _MenuItemData(title: 'دليل الخدمات', icon: Icons.grid_view_rounded),
      const _MenuItemData(
        title: 'طلباتي',
        icon: Icons.assignment_outlined,
        badgeCount: 3,
      ),
      const _MenuItemData(
        title: 'الوظائف',
        icon: Icons.work_outline_rounded,
        badgeCount: 3,
      ),
      const _MenuItemData(
        title: 'العملات',
        icon: Icons.currency_exchange_outlined,
      ),
      const _MenuItemData(
        title: 'مواقيت الصلاة',
        icon: Icons.watch_later_outlined,
      ),
      const _MenuItemData(title: 'حالة الطقس', icon: Icons.wb_cloudy_outlined),
      const _MenuItemData(title: 'تواصل معنا', icon: Icons.chat_bubble_outline),
      const _MenuItemData(title: 'عن التطبيق', icon: Icons.info_outline),
      const _MenuItemData(title: 'مشاركة التطبيق', icon: Icons.share_outlined),
      const _MenuItemData(
        title: 'سياسة الاستخدام',
        icon: Icons.description_outlined,
      ),
    ];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Column(
          children: [
            Container(
              height: 96.h,
              width: double.infinity,
              padding: EdgeInsets.only(top: 34.h, left: 14.w, right: 14.w),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.primary, AppColors.gradientEnd],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Text(
                      'القائمة',
                      style: AppTextStyles.semiBold24.copyWith(
                        color: AppColors.white,
                        fontSize: 22.sp,
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
                    icon: item.icon,
                    badgeCount: item.badgeCount,
                    onTap: () {},
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
  final IconData icon;
  final int? badgeCount;

  const _MenuItemData({
    required this.title,
    required this.icon,
    this.badgeCount,
  });
}
