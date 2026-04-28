import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';
import 'package:flutter_application_1/features/discover/widgets/discover_place_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/discover_place.dart';

class PlaceDetailsBottomSheet {
  static Future<DiscoverPlace?> show(
    BuildContext context,
    DiscoverPlace place,
  ) {
    return showModalBottomSheet<DiscoverPlace>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _PlaceDetailsContent(place: place),
    );
  }
}

class _PlaceDetailsContent extends StatelessWidget {
  final DiscoverPlace place;

  const _PlaceDetailsContent({required this.place});

  Future<void> _openUrl(String? url) async {
    if (url == null || url.isEmpty) return;

    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  Future<void> _openEmail(String? email) async {
    if (email == null || email.isEmpty) return;

    final uri = Uri(scheme: 'mailto', path: email);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  void _openDetailsScreen(BuildContext context) {
    Navigator.pop(context, place);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: EdgeInsets.fromLTRB(14.w, 10.h, 14.w, 14.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              blurRadius: 16,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _DragIndicator(),
            SizedBox(height: 36.h),
            _PlaceInfo(place: place),
            SizedBox(height: 25.h),
            Divider(height: 1.h, color: const Color(0xFFE8E8E8)),
            SizedBox(height: 25.h),
            Row(
              children: [
                DiscoverCircleIconButton(
                  assetPath: "assets/images/emailimg.svg",
                  color: const Color(0xFFE91E8F),
                  onTap: () => _openUrl(place.facebookUrl),
                ),
                SizedBox(width: 12.w),
                DiscoverCircleIconButton(
                  assetPath: "assets/images/whatsimg.svg",
                  color: const Color(0xFF25D366),
                  onTap: () => _openUrl(place.whatsappUrl),
                ),
                SizedBox(width: 12.w),
                DiscoverCircleIconButton(
                  assetPath: "assets/images/faceimg.svg",
                  color: const Color(0xFF1877F2),
                  onTap: () => _openEmail(place.email),
                ),
                const Spacer(),
                Transform.translate(
                  offset: Offset(-15.w, 0), // نفس قيمة padding
                  child: DiscoverButton(
                    label: 'تفاصيل المكان',
                    icon: Icons.arrow_back,
                    onTap: () => _openDetailsScreen(context),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _DragIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44.w,
      height: 3.h,
      decoration: BoxDecoration(
        color: const Color(0xFFDADADA),
        borderRadius: BorderRadius.circular(20.r),
      ),
    );
  }
}

class _PlaceInfo extends StatelessWidget {
  final DiscoverPlace place;

  const _PlaceInfo({required this.place});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 72.w,
          height: 72.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            image: DecorationImage(
              image: AssetImage(
                (place.imagePath == null || place.imagePath!.isEmpty)
                    ? "assets/images/placeimg.png"
                    : place.imagePath!,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(place.name, style: AppTextStyles.semiBold16),
              SizedBox(height: 4.h),
              Row(
                children: [
                  SvgPicture.asset(
                    place.categoryIcon,
                    width: 14.w,
                    height: 14.w,
                    colorFilter: ColorFilter.mode(
                      AppColors.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Text(
                    place.category,
                    style: AppTextStyles.regular12.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 15.sp,
                    color: AppColors.textSecondary,
                  ),
                  SizedBox(width: 4.w),
                  Expanded(
                    child: Text(
                      place.address,
                      style: AppTextStyles.regular12.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
