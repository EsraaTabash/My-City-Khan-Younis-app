import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/baladiyati/widgets/baladiyati_header.dart';
import 'package:flutter_application_1/features/menu/screens/menu_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';
import 'package:flutter_application_1/features/baladiyati/data/baladiyati_data.dart';

class BaladiyatiDetailScreen extends StatefulWidget {
  final BaladiyatiDetailType type;

  const BaladiyatiDetailScreen({super.key, required this.type});

  @override
  State<BaladiyatiDetailScreen> createState() => _BaladiyatiDetailScreenState();
}

class _BaladiyatiDetailScreenState extends State<BaladiyatiDetailScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int selectedTab = 0;

  List<String> get tabs => BaladiyatiData.tabsForType(widget.type);

  String get title => BaladiyatiData.titleForType(widget.type);

  @override
  Widget build(BuildContext context) {
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
                  title: title,
                  imagePath: 'assets/images/login_bg.png',
                  showBackButton: true,
                  onBackTap: () {
                    Navigator.of(context).pop();
                  },
                  onMenuTap: () {
                    _scaffoldKey.currentState?.openDrawer();
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
                  _TabsBar(
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
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            SizedBox(height: 8.h),

                            _Paragraph(text: BaladiyatiData.dummyText),

                            _Divider(),

                            _Paragraph(text: BaladiyatiData.dummyText),

                            _Divider(),

                            _Paragraph(text: BaladiyatiData.dummyText),

                            SizedBox(height: 18.h),

                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: _ImageBox(
                                      imagePath:
                                          'assets/images/Rectangle-3.png',
                                    ),
                                  ),
                                  SizedBox(width: 10.w),
                                  Expanded(
                                    child: _ImageBox(
                                      imagePath:
                                          'assets/images/Rectangle-1.png',
                                    ),
                                  ),
                                  SizedBox(width: 10.w),
                                  Expanded(
                                    child: _ImageBox(
                                      imagePath:
                                          'assets/images/Rectangle-2.png',
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 24.h),
                          ],
                        ),
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

class _TabsBar extends StatelessWidget {
  final List<String> tabs;
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  const _TabsBar({
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
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        itemCount: tabs.length,
        separatorBuilder: (_, __) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Center(
            child: Text(
              '.',
              style: AppTextStyles.regular16.copyWith(
                color: const Color(0xFF7E8794),
                fontSize: 18.sp,
              ),
            ),
          ),
        ),
        itemBuilder: (context, index) {
          final isActive = selectedIndex == index;

          return GestureDetector(
            onTap: () => onChanged(index),
            child: Container(
              height: 44.h,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 2.w),
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
                tabs[index],
                style: AppTextStyles.regular14.copyWith(
                  color: isActive
                      ? const Color(0xFF079BEE)
                      : const Color(0xFF4F596B),
                  fontSize: 13.sp,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _Paragraph extends StatelessWidget {
  final String text;

  const _Paragraph({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      child: Text(
        text,
        textAlign: TextAlign.right,
        style: AppTextStyles.regular14.copyWith(
          color: const Color(0xFFA0A8B3),
          fontSize: 12.sp,
          height: 1.75,
        ),
      ),
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(height: 8.h, color: const Color(0xFFEDEDED));
  }
}

class _ImageBox extends StatelessWidget {
  final String imagePath;

  const _ImageBox({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(3.r),
      child: Image.asset(
        imagePath,
        height: 105.h,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => Container(
          height: 105.h,
          color: const Color(0xFFE9ECF2),
          child: const Icon(Icons.image_not_supported_outlined),
        ),
      ),
    );
  }
}
