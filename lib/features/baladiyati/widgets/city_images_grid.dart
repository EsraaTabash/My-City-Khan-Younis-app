import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CityImagesGrid extends StatelessWidget {
  final List<String> imagePaths;

  const CityImagesGrid({super.key, required this.imagePaths});

  @override
  Widget build(BuildContext context) {
    final safeImages = imagePaths.length >= 4
        ? imagePaths
        : [
            ...imagePaths,
            ...List.generate(4 - imagePaths.length, (_) => imagePaths.first),
          ];

    return SizedBox(
      height: 170.h,
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Column(
              children: [
                _ImageBox(imagePath: safeImages[1], height: 82.h),
                SizedBox(height: 6.h),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: _ImageBox(
                          imagePath: safeImages[2],
                          height: 82.h,
                        ),
                      ),
                      SizedBox(width: 6.w),
                      Expanded(
                        child: _ImageBox(
                          imagePath: safeImages[3],
                          height: 82.h,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 6.w),
          Expanded(
            flex: 5,
            child: _ImageBox(imagePath: safeImages[0], height: 170.h),
          ),
        ],
      ),
    );
  }
}

class _ImageBox extends StatelessWidget {
  final String imagePath;
  final double height;

  const _ImageBox({required this.imagePath, required this.height});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.r),
      child: Image.asset(
        imagePath,
        width: double.infinity,
        height: height,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => Container(
          width: double.infinity,
          height: height,
          color: const Color(0xFFE9ECF2),
          child: const Icon(Icons.image_not_supported_outlined),
        ),
      ),
    );
  }
}
