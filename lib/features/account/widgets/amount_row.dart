import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';

class AmountRow extends StatelessWidget {
  final String title;
  final String value;
  final String currency;
  final Color valueColor;

  const AmountRow({
    super.key,
    required this.title,
    required this.value,
    this.currency = 'شيكل',
    this.valueColor = const Color(0xFF079BEE),
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.rtl,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 5,
          child: Text(
            title,
            textAlign: TextAlign.right,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.regular14.copyWith(
              color: const Color(0xFF4F596B),
              fontSize: 12.sp,
            ),
          ),
        ),

        Expanded(
          flex: 3,
          child: Text(
            value,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.regular14.copyWith(
              color: valueColor,
              fontSize: 12.sp,
            ),
          ),
        ),

        Expanded(
          flex: 2,
          child: Text(
            currency,
            textAlign: TextAlign.left,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.regular14.copyWith(
              color: const Color(0xFF4F596B),
              fontSize: 11.sp,
            ),
          ),
        ),
      ],
    );
  }
}
