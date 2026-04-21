import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';

class ContentSectionHeader extends StatelessWidget {
  final String title;
  final String? actionText;
  final VoidCallback? onActionTap;

  const ContentSectionHeader({
    super.key,
    required this.title,
    this.actionText,
    this.onActionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (actionText != null)
          TextButton(
            onPressed: onActionTap ?? () {},
            child: Text(
              actionText!,
              style: AppTextStyles.semiBold18.copyWith(
                color: AppColors.primary,
              ),
            ),
          )
        else
          SizedBox(width: 8.w),
        const Spacer(),
        Text(title, style: AppTextStyles.semiBold20),
      ],
    );
  }
}
