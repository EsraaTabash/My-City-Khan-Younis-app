import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/routes/app_navigation.dart';
import 'package:flutter_application_1/features/account/screens/account_screen.dart';
import 'package:flutter_application_1/features/ads/screens/ads_screen.dart';
import 'package:flutter_application_1/core/routes/app_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/features/home/data/home_data.dart';
import 'package:flutter_application_1/features/home/widgets/HomeTopCard.dart';
import 'package:flutter_application_1/features/home/widgets/ads_section.dart';
import 'package:flutter_application_1/features/home/widgets/home_bottom_nav_bar.dart';
import 'package:flutter_application_1/features/home/widgets/home_header.dart';
import 'package:flutter_application_1/features/home/widgets/news_section.dart';
import 'package:flutter_application_1/features/menu/screens/menu_screen.dart';
import 'package:flutter_application_1/features/discover/screens/discover_screen.dart';
import 'package:flutter_application_1/features/baladiyati/screens/baladiyati_screen.dart';

class HomeScreen extends StatefulWidget {
  final bool isGuest;

  const HomeScreen({super.key, required this.isGuest});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;

  Widget _buildHomeContent() {
    return SingleChildScrollView(
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
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  HomeTopCard(
                    isGuest: widget.isGuest,
                    stats: HomeData.stats,
                    onPointsTap: widget.isGuest
                        ? null
                        : () {
                            AppNavigation.push(context, AppRoutes.points);
                          },
                  ),
                  SizedBox(height: 26.h),
                  NewsSection(
                    items: HomeData.news,
                    onTap: () {
                      AppNavigation.push(context, AppRoutes.baladiyatiNews);
                    },
                  ),

                  SizedBox(height: 20.h),

                  AdsSection(
                    items: HomeData.ads,
                    onTap: () {
                      setState(() {
                        _selectedIndex = 2;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCurrentPage() {
    switch (_selectedIndex) {
      case 0:
        return _buildHomeContent();
      case 1:
        return DiscoverScreen(
          onMenuTap: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          onBackTap: () {
            setState(() {
              _selectedIndex = 0;
            });
          },
        );
      case 2:
        return AdsScreen(
          onMenuTap: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        );
      case 3:
        return BaladiyatiScreen(
          onMenuTap: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        );
      case 4:
        return AccountScreen(
          onMenuTap: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        );
      default:
        return _buildHomeContent();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: const Color(0xFFF3F5F8),
        drawer: const SizedBox(width: 300, child: MenuScreen()),
        body: SizedBox.expand(
          child: SafeArea(
            bottom: false,
            child: Column(
              children: [
                Expanded(child: _buildCurrentPage()),
                HomeBottomNavBar(
                  currentIndex: _selectedIndex,
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
      ),
    );
  }
}
