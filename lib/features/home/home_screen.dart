import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/data/home_data.dart';
import 'package:flutter_application_1/features/home/widgets/HomeTopCard.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/features/home/widgets/ads_section.dart';
import 'package:flutter_application_1/features/home/widgets/home_bottom_nav_bar.dart';
import 'package:flutter_application_1/features/home/widgets/home_header.dart';
import 'package:flutter_application_1/features/home/widgets/home_stats_section.dart';
import 'package:flutter_application_1/features/home/widgets/news_section.dart';
import 'package:flutter_application_1/features/home/widgets/quick_access_section.dart';
import 'package:flutter_application_1/features/menu/menu_screen.dart';

class HomeScreen extends StatefulWidget {
  final bool isGuest;

  const HomeScreen({super.key, required this.isGuest});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: const Color(0xFFF3F5F8),

        // بما أن التطبيق RTL وبدنا المنيو من اليمين => نستخدم drawer
        drawer: const SizedBox(width: 300, child: MenuScreen()),

        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      HomeHeader(
                        isGuest: widget.isGuest,
                        onMenuPressed: () {
                          _scaffoldKey.currentState?.openDrawer();
                        },
                      ),
                      Transform.translate(
                        offset: Offset(0, -50.h),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              HomeTopCard(
                                isGuest: widget.isGuest,
                                stats: HomeData.stats,
                              ),
                              SizedBox(height: 12.h),
                              NewsSection(items: HomeData.news),
                              SizedBox(height: 12.h),
                              AdsSection(items: HomeData.ads),
                              SizedBox(height: 20.h),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              HomeBottomNavBar(
                selectedIndex: _selectedIndex,
                onTap: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
