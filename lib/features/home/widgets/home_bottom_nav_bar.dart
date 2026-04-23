import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';

class HomeBottomNavBar extends StatelessWidget {
  const HomeBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    const items = <_BottomNavItem>[
      _BottomNavItem(label: 'الرئيسية', iconPath: 'assets/images/home.svg'),
      _BottomNavItem(label: 'استكشاف', iconPath: 'assets/images/explore.svg'),
      _BottomNavItem(label: 'إعلانات', iconPath: 'assets/images/ads.svg'),
      _BottomNavItem(label: 'بلديتي', iconPath: 'assets/images/my.svg'),
      _BottomNavItem(label: 'الحساب', iconPath: 'assets/images/account.svg'),
    ];

    return Container(
      height: 90.h,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(18.r)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 16,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Row(
        children: List.generate(items.length, (index) {
          final isSelected = currentIndex == index;

          return Expanded(
            child: InkWell(
              onTap: () => onTap(index),
              borderRadius: BorderRadius.circular(14.r),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFF1295F3)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: SvgPicture.asset(
                      items[index].iconPath,
                      width: 22.w,
                      height: 22.h,
                      colorFilter: ColorFilter.mode(
                        isSelected ? Colors.white : const Color(0xFF5E6278),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),

                  SizedBox(height: 6.h),

                  Text(
                    items[index].label,
                    style: AppTextStyles.medium14.copyWith(
                      fontSize: 12.sp,
                      color: isSelected
                          ? const Color(0xFF1295F3)
                          : const Color(0xFF5E6278),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _BottomNavItem {
  const _BottomNavItem({required this.label, required this.iconPath});

  final String label;
  final String iconPath;
}
