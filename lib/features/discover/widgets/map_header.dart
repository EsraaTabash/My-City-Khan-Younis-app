import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MapHeader extends StatelessWidget {
  final VoidCallback onBackTap;
  final VoidCallback onMyLocationTap;

  const MapHeader({
    super.key,
    required this.onBackTap,
    required this.onMyLocationTap,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        child: Row(
          children: [
            _HeaderIconButton(
              img: "assets/images/backlocation.svg",
              onTap: onBackTap,
            ),
            const Spacer(),
            _HeaderIconButton(
              img: "assets/images/mylocation.svg",
              onTap: onMyLocationTap,
            ),
            const Spacer(),
            _HeaderIconButton(
              img: "assets/images/searchlocation.svg",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _HeaderIconButton extends StatelessWidget {
  final String img;
  final VoidCallback onTap;

  const _HeaderIconButton({required this.img, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44.w,
      height: 44.w,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(12.w), // تحكم بالحجم من هون
          child: SvgPicture.asset(img),
        ),
      ),
    );
  }
}
