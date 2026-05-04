import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/routes/app_navigation.dart';
import 'package:flutter_application_1/core/routes/app_routes.dart';
import 'package:flutter_application_1/core/widgets/app_header.dart';
import 'package:flutter_application_1/features/discover/widgets/discover_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiscoverScreen extends StatelessWidget {
  final VoidCallback onMenuTap;
  final VoidCallback onBackTap;

  const DiscoverScreen({
    super.key,
    required this.onMenuTap,
    required this.onBackTap,
  });

  static const List<_DiscoverCategory> _categories = [
    _DiscoverCategory('مطاعم', 'assets/images/icon12.svg'),
    _DiscoverCategory('بناء و تأثيث المنازل', 'assets/images/icon13.svg'),
    _DiscoverCategory('ما يتعلق بالسيارات', 'assets/images/icon14.svg'),
    _DiscoverCategory('مساجد', 'assets/images/icon15.svg'),
    _DiscoverCategory('مرافق البلدية', 'assets/images/icon16.svg'),
    _DiscoverCategory('تسوق و شراء', 'assets/images/icon17.svg'),
    _DiscoverCategory(
      'خدمات الصيانة و الدعم الفني',
      'assets/images/icon18.svg',
    ),
    _DiscoverCategory('خدمات صحية', 'assets/images/icon19.svg'),
    _DiscoverCategory('أماكن ترفيه و تنزه', 'assets/images/icon20.svg'),
    _DiscoverCategory('مرافق تعليمية', 'assets/images/icon21.svg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF3F5F8),
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              AppHeader(
                title: 'التصنيفات الرئيسية',
                onMenuTap: onMenuTap,
                onBackTap: onBackTap,
                showBackButton: false,
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.fromLTRB(14.w, 16.h, 14.w, 16.h),
                  children: _categories.map((category) {
                    return DiscoverItem(
                      title: category.title,
                      imagePath: category.imagePath,
                      onTap: () {
                        AppNavigation.push(
                          context,
                          AppRoutes.discoverMap,
                          arguments: category.title,
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DiscoverCategory {
  final String title;
  final String imagePath;

  const _DiscoverCategory(this.title, this.imagePath);
}
