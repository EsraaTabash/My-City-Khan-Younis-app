import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/widgets/app_header.dart';
import 'package:flutter_application_1/features/discover/discover_map_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widgets/discover_item.dart';

class DiscoverScreen extends StatelessWidget {
  final VoidCallback onMenuTap;
  final VoidCallback onBackTap;

  const DiscoverScreen({
    super.key,
    required this.onMenuTap,
    required this.onBackTap,
  });
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
                onBackTap: onBackTap,
                onMenuTap: onMenuTap,
              ),

              Expanded(
                child: ListView(
                  padding: EdgeInsets.fromLTRB(14.w, 16.h, 14.w, 16.h),
                  children: [
                    DiscoverItem(
                      title: 'مطاعم',
                      imagePath: "assets/images/icon12.svg",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                const DiscoverMapScreen(categoryTitle: 'مطاعم'),
                          ),
                        );
                      },
                    ),
                    DiscoverItem(
                      title: 'بناء و تأثيث المنازل',
                      imagePath: "assets/images/icon13.svg",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const DiscoverMapScreen(
                              categoryTitle: 'بناء و تأثيث المنازل',
                            ),
                          ),
                        );
                      },
                    ),
                    DiscoverItem(
                      title: 'ما يتعلق بالسيارات',
                      imagePath: "assets/images/icon14.svg",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const DiscoverMapScreen(
                              categoryTitle: 'ما يتعلق بالسيارات',
                            ),
                          ),
                        );
                      },
                    ),
                    DiscoverItem(
                      title: 'مساجد',
                      imagePath: "assets/images/icon15.svg",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                const DiscoverMapScreen(categoryTitle: 'مساجد'),
                          ),
                        );
                      },
                    ),
                    DiscoverItem(
                      title: 'مرافق البلدية',
                      imagePath: "assets/images/icon16.svg",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const DiscoverMapScreen(
                              categoryTitle: 'مرافق البلدية',
                            ),
                          ),
                        );
                      },
                    ),
                    DiscoverItem(
                      title: 'تسوق و شراء',
                      imagePath: "assets/images/icon17.svg",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const DiscoverMapScreen(
                              categoryTitle: 'تسوق و شراء',
                            ),
                          ),
                        );
                      },
                    ),
                    DiscoverItem(
                      title: 'خدمات الصيانة و الدعم الفني',
                      imagePath: "assets/images/icon18.svg",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const DiscoverMapScreen(
                              categoryTitle: 'خدمات الصيانة و الدعم الفني',
                            ),
                          ),
                        );
                      },
                    ),
                    DiscoverItem(
                      title: 'خدمات صحية',
                      imagePath: "assets/images/icon19.svg",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const DiscoverMapScreen(
                              categoryTitle: 'خدمات صحية',
                            ),
                          ),
                        );
                      },
                    ),
                    DiscoverItem(
                      title: 'أماكن ترفيه و تنزه',
                      imagePath: "assets/images/icon20.svg",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const DiscoverMapScreen(
                              categoryTitle: 'أماكن ترفيه و تنزه',
                            ),
                          ),
                        );
                      },
                    ),
                    DiscoverItem(
                      title: 'مرافق تعليمية',
                      imagePath: "assets/images/icon21.svg",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const DiscoverMapScreen(
                              categoryTitle: 'مرافق تعليمية',
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
