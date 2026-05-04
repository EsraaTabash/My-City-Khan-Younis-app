import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DiscoverButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final IconData? icon;
  final Color backgroundColor;
  final double width;

  const DiscoverButton({
    super.key,
    required this.label,
    required this.onTap,
    this.icon,
    this.backgroundColor = const Color(0xFF2F354D),
    this.width = 150,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.h,
      width: width.w,
      child: icon == null
          ? ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: backgroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22.r),
                ),
                elevation: 0,
              ),
              child: Text(
                label,
                style: AppTextStyles.bold14.copyWith(color: Colors.white),
              ),
            )
          : ElevatedButton.icon(
              onPressed: onTap,
              icon: Icon(icon, color: Colors.white, size: 18.sp),
              label: Text(
                label,
                style: AppTextStyles.bold14.copyWith(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: backgroundColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(22.r),
                    left: Radius.circular(4.r),
                  ),
                ),
              ),
            ),
    );
  }
}

class DiscoverCircleIconButton extends StatelessWidget {
  final String assetPath;
  final Color color;
  final VoidCallback onTap;

  const DiscoverCircleIconButton({
    super.key,
    required this.assetPath,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: Container(
        width: 40.w,
        height: 40.w,
        decoration: BoxDecoration(
          color: const Color(0xFFF7F7F7),
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFFE4E4E4), width: 1.2),
        ),
        child: Center(
          child: SvgPicture.asset(
            assetPath,
            width: 20.w,
            height: 20.w,
            fit: BoxFit.contain,
            colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
          ),
        ),
      ),
    );
  }
}

class DiscoverMapButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final IconData icon;
  final Color backgroundColor;

  const DiscoverMapButton({
    super.key,
    required this.label,
    required this.onTap,
    required this.icon,
    this.backgroundColor = const Color(0xFF2F354D),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: ElevatedButton.icon(
        onPressed: onTap,
        icon: Icon(icon, color: Colors.white, size: 20.sp),
        label: Text(
          label,
          style: AppTextStyles.bold16.copyWith(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(
              left: Radius.circular(22.r),
              right: Radius.circular(4.r),
            ),
          ),
        ),
      ),
    );
  }
}
