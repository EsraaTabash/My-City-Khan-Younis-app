import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';
import 'package:flutter_application_1/features/discover/models/discover_place.dart';
import 'package:flutter_application_1/features/discover/widgets/discover_place_widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlaceDetailsScreen extends StatefulWidget {
  final DiscoverPlace place;

  const PlaceDetailsScreen({super.key, required this.place});

  @override
  State<PlaceDetailsScreen> createState() => _PlaceDetailsScreenState();
}

class _PlaceDetailsScreenState extends State<PlaceDetailsScreen> {
  final ScrollController _imagesController = ScrollController();

  int _currentPage = 0;
  static const int itemsPerPage = 3;

  @override
  void dispose() {
    _imagesController.dispose();
    super.dispose();
  }

  void _openMap() {
    Navigator.pop(context, widget.place);
  }

  void _updateIndicator(ScrollNotification notification) {
    final itemWidth = 74.w + 10.w;
    final pageWidth = itemWidth * itemsPerPage;

    final page = (notification.metrics.pixels / pageWidth).round();

    setState(() {
      _currentPage = page.clamp(0, 100);
    });
  }

  void _snapToPage(int totalPages) {
    final itemWidth = 74.w + 10.w;
    final pageWidth = itemWidth * itemsPerPage;

    final targetPage = (_imagesController.offset / pageWidth).round().clamp(
      0,
      totalPages - 1,
    );

    final targetOffset = targetPage * pageWidth;

    _imagesController.animateTo(
      targetOffset.toDouble(),
      duration: const Duration(milliseconds: 320),
      curve: Curves.easeOutCubic,
    );

    setState(() {
      _currentPage = targetPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    final imagePath =
        (widget.place.imagePath == null || widget.place.imagePath!.isEmpty)
        ? 'assets/images/placeimg.png'
        : widget.place.imagePath!;

    final images = [
      imagePath,
      'assets/images/placeimg.png',
      'assets/images/placeimg.png',
      'assets/images/placeimg.png',
      'assets/images/placeimg.png',
      'assets/images/placeimg.png',
      'assets/images/placeimg.png',
      'assets/images/placeimg.png',
      'assets/images/placeimg.png',
    ];

    final totalPages = (images.length / itemsPerPage).ceil();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              SizedBox(
                height: 0.5.sh,
                width: double.infinity,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(imagePath, fit: BoxFit.cover),
                    ),
                    Positioned(
                      right: 16.w,
                      top: 16.h,
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.white,
                          size: 22.sp,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 16.w,
                      right: 16.w,
                      bottom: 22.h,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 10.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.45),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/images/locationimg.svg",
                              width: 14.sp,
                              colorFilter: const ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                            SizedBox(width: 6.w),
                            Expanded(
                              child: Text(
                                'يبعد عنك ${widget.place.distance}',
                                style: AppTextStyles.regular12.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(width: 12.w),
                            SvgPicture.asset(
                              "assets/images/catimg.svg",
                              width: 14.sp,
                              colorFilter: const ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                            SizedBox(width: 6.w),
                            Text(
                              widget.place.category,
                              style: AppTextStyles.regular12.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 16.h),
                  child: Column(
                    children: [
                      Text(
                        widget.place.name,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.semiBold24.copyWith(
                          color: AppColors.textPrimary,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        widget.place.mainCategory,
                        style: AppTextStyles.regular12.copyWith(
                          color: AppColors.primary,
                        ),
                      ),

                      const Spacer(),

                      NotificationListener<ScrollNotification>(
                        onNotification: (notification) {
                          if (notification is ScrollUpdateNotification) {
                            _updateIndicator(notification);
                          }

                          if (notification is ScrollEndNotification) {
                            _snapToPage(totalPages);
                          }

                          return false;
                        },
                        child: SizedBox(
                          height: 76.h,
                          child: ListView.separated(
                            controller: _imagesController,
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: images.length,
                            separatorBuilder: (_, __) => SizedBox(width: 10.w),
                            itemBuilder: (context, index) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(5.r),
                                child: Image.asset(
                                  images[index],
                                  width: 74.w,
                                  height: 66.h,
                                  fit: BoxFit.cover,
                                ),
                              );
                            },
                          ),
                        ),
                      ),

                      SizedBox(height: 12.h),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(totalPages, (index) {
                          final isActive = index == _currentPage;

                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOut,
                            margin: EdgeInsets.symmetric(horizontal: 3.w),
                            width: isActive ? 14.w : 6.w,
                            height: 6.w,
                            decoration: BoxDecoration(
                              color: isActive
                                  ? const Color(0xFF2F354D)
                                  : const Color(0xFFD0D5DD),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          );
                        }),
                      ),

                      SizedBox(height: 28.h),

                      Row(
                        children: [
                          Transform.translate(
                            offset: Offset(15.w, 0),
                            child: DiscoverMapButton(
                              label: 'مشاهدة الخريطة',
                              icon: Icons.arrow_forward,
                              onTap: _openMap,
                            ),
                          ),
                          const Spacer(),
                          DiscoverCircleIconButton(
                            assetPath: 'assets/images/faceimg.svg',
                            color: const Color(0xFF1877F2),
                            onTap: () {},
                          ),
                          SizedBox(width: 12.w),
                          DiscoverCircleIconButton(
                            assetPath: 'assets/images/whatsimg.svg',
                            color: const Color(0xFF25D366),
                            onTap: () {},
                          ),
                          SizedBox(width: 12.w),
                          DiscoverCircleIconButton(
                            assetPath: 'assets/images/emailimg.svg',
                            color: const Color(0xFFE91E8F),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
