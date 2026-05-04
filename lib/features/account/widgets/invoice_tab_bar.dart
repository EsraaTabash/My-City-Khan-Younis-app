import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';

class InvoiceTabBar extends StatelessWidget {
  final List<String> tabs;
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const InvoiceTabBar({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.h,
      color: Colors.white,
      child: Row(
        children: List.generate(tabs.length, (index) {
          final isSelected = selectedIndex == index;

          return Expanded(
            child: InkWell(
              onTap: () => onChanged(index),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    tabs[index],
                    style: AppTextStyles.regular14.copyWith(
                      color: isSelected
                          ? const Color(0xFF079BEE)
                          : const Color(0xFF4F596B),
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(height: 7.h),
                  Container(
                    height: 2.h,
                    width: double.infinity,
                    color: isSelected
                        ? const Color(0xFF079BEE)
                        : Colors.transparent,
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
