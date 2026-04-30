import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';
import 'package:flutter_application_1/features/baladiyati/data/baladiyati_data.dart';

class BaladiyatiNewsCard extends StatelessWidget {
  final BaladiyatiNewsItem item;
  final VoidCallback? onTap;

  const BaladiyatiNewsCard({super.key, required this.item, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 206.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(3.r),
          border: Border.all(color: const Color(0xFFE2E4EA)),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(3.r)),
              child: Image.asset(
                item.imagePath,
                height: 116.h,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  height: 116.h,
                  color: const Color(0xFFE9ECF2),
                  child: const Icon(Icons.image_not_supported_outlined),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            item.title,
                            textAlign: TextAlign.right,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.regular14.copyWith(
                              color: const Color(0xFF333C55),
                              fontSize: 12.sp,
                              height: 1.25,
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            item.description,
                            textAlign: TextAlign.right,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.regular14.copyWith(
                              color: const Color(0xFFA1A8B5),
                              fontSize: 10.sp,
                              height: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      item.date,
                      style: AppTextStyles.regular14.copyWith(
                        color: const Color(0xFF079BEE),
                        fontSize: 10.sp,
                        height: 1.1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
