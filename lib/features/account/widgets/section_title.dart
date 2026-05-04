import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final Color color;
  final double? fontSize;
  final TextAlign textAlign;

  const SectionTitle({
    super.key,
    required this.title,
    this.color = const Color(0xFF079BEE),
    this.fontSize,
    this.textAlign = TextAlign.right,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      style: AppTextStyles.regular14.copyWith(
        color: color,
        fontSize: fontSize?.sp ?? 13.sp,
      ),
    );
  }
}
