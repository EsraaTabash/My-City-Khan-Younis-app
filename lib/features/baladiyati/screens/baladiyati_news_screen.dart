import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/routes/app_navigation.dart';
import 'package:flutter_application_1/core/routes/app_routes.dart';
import 'package:flutter_application_1/features/baladiyati/widgets/baladiyati_header.dart';
import 'package:flutter_application_1/features/menu/screens/menu_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';
import 'package:flutter_application_1/features/baladiyati/data/baladiyati_data.dart';

class BaladiyatiNewsScreen extends StatefulWidget {
  const BaladiyatiNewsScreen({super.key});

  @override
  State<BaladiyatiNewsScreen> createState() => _BaladiyatiNewsScreenState();
}

class _BaladiyatiNewsScreenState extends State<BaladiyatiNewsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int selectedTab = 0;

  final List<String> tabs = const [
    'أخبار اجتماعية',
    'أخبار رياضية',
    'أخبار عامة',
  ];

  void _openDetails(BaladiyatiNewsItem item) {
    AppNavigation.push(
      context,
      AppRoutes.baladiyatiNewsDetail,
      arguments: item,
    );
  }

  @override
  Widget build(BuildContext context) {
    final items = BaladiyatiData.news;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: const Color(0xFFF4F4F4),
        drawer: const SizedBox(width: 300, child: MenuScreen()),
        body: Stack(
          children: [
            Column(
              children: [
                BaladiyatiHeader(
                  title: 'أخبار المدينة',
                  imagePath: 'assets/images/login_bg.png',
                  showBackButton: true,
                  onMenuTap: () {
                    _scaffoldKey.currentState?.openDrawer();
                  },
                  onBackTap: () {
                    Navigator.of(context).pop();
                  },
                ),

                Expanded(child: Container(color: Colors.white)),
              ],
            ),

            Positioned(
              top: 145.h,
              left: 0,
              right: 0,
              bottom: 0,
              child: Column(
                children: [
                  _NewsTabs(
                    tabs: tabs,
                    selectedIndex: selectedTab,
                    onChanged: (index) {
                      setState(() {
                        selectedTab = index;
                      });
                    },
                  ),

                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.only(top: 16.h, bottom: 20.h),
                        itemCount: items.length,
                        separatorBuilder: (_, __) => SizedBox(height: 10.h),
                        itemBuilder: (context, index) {
                          return _NewsListItem(
                            item: items[index],
                            onTap: () => _openDetails(items[index]),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NewsTabs extends StatelessWidget {
  final List<String> tabs;
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const _NewsTabs({
    required this.tabs,
    required this.selectedIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44.h,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: const Color(0xFFE1E4EA), width: 1.h),
        ),
      ),
      child: Row(
        children: List.generate(tabs.length * 2 - 1, (index) {
          if (index.isOdd) {
            return SizedBox(
              width: 18.w,
              child: Center(
                child: Text(
                  '.',
                  style: AppTextStyles.regular16.copyWith(
                    color: const Color(0xFF7E8794),
                    fontSize: 18.sp,
                  ),
                ),
              ),
            );
          }

          final tabIndex = index ~/ 2;
          final isActive = selectedIndex == tabIndex;

          return Expanded(
            child: GestureDetector(
              onTap: () => onChanged(tabIndex),
              child: Container(
                height: 44.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: isActive
                          ? const Color(0xFF079BEE)
                          : Colors.transparent,
                      width: isActive ? 2.h : 0,
                    ),
                  ),
                ),
                child: Text(
                  tabs[tabIndex],
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.regular14.copyWith(
                    color: isActive
                        ? const Color(0xFF079BEE)
                        : const Color(0xFF4F596B),
                    fontSize: 13.sp,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _NewsListItem extends StatelessWidget {
  final BaladiyatiNewsItem item;
  final VoidCallback onTap;

  const _NewsListItem({required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 126.h,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Row(
          textDirection: TextDirection.rtl,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(3.r),
              child: Image.asset(
                item.imagePath,
                width: 105.w,
                height: 105.h,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  width: 105.w,
                  height: 92.h,
                  color: const Color(0xFFE9ECF2),
                  child: const Icon(Icons.image_not_supported_outlined),
                ),
              ),
            ),

            SizedBox(width: 16.w),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    textAlign: TextAlign.right,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.regular16.copyWith(
                      color: const Color(0xFF079BEE),
                      fontSize: 17.sp,
                    ),
                  ),

                  SizedBox(height: 3.h),

                  Text(
                    item.date,
                    textAlign: TextAlign.right,
                    style: AppTextStyles.regular14.copyWith(
                      color: const Color(0xFFD9188D),
                      fontSize: 11.sp,
                    ),
                  ),

                  SizedBox(height: 8.h),

                  Text(
                    item.description,
                    textAlign: TextAlign.right,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.regular14.copyWith(
                      color: const Color(0xFF8E96A4),
                      fontSize: 12.sp,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
