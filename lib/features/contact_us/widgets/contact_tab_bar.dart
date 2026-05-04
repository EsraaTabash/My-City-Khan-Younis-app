import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';

class ContactTabBar extends StatelessWidget {
  final List<String> tabs;
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const ContactTabBar({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: 54.h, // زودنا الارتفاع
        width: double.infinity,
        color: Colors.white,
        child: Row(
          textDirection: TextDirection.rtl,
          children: List.generate(tabs.length, (index) {
            final isSelected = selectedIndex == index;

            return Expanded(
              child: InkWell(
                onTap: () => onChanged(index),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          tabs[index],
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                          style: AppTextStyles.regular14.copyWith(
                            color: isSelected
                                ? const Color(0xFF079BEE)
                                : const Color(0xFF4F596B),
                            fontSize: 14.sp, // كبرنا النص
                            height: 1.2,
                          ),
                        ),
                      ),
                    ),

                    AnimatedContainer(
                      duration: const Duration(milliseconds: 180),
                      height: 2.h,
                      width: isSelected ? 92.w : 0, // خط تحت التاب مش كل العرض
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF079BEE)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(2.r),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
