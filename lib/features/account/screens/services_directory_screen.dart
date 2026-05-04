import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/account/data/account_mock_data.dart';
import 'package:flutter_application_1/features/menu/screens/menu_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_application_1/core/widgets/app_header.dart';
import '../widgets/service_tile.dart';

class ServicesDirectoryScreen extends StatefulWidget {
  const ServicesDirectoryScreen({super.key});

  @override
  State<ServicesDirectoryScreen> createState() =>
      _ServicesDirectoryScreenState();
}

class _ServicesDirectoryScreenState extends State<ServicesDirectoryScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openMenu() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: const Color(0xFFF4F4F4),
        drawer: SizedBox(width: 300.w, child: const MenuScreen()),
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              AppHeader(
                title: 'دليل الخدمات',
                onBackTap: () => Navigator.pop(context),
                onMenuTap: _openMenu,
              ),
              Expanded(
                child: ListView.separated(
                  physics: const ClampingScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 10.h,
                  ),
                  itemCount: servicesMockData.length,
                  separatorBuilder: (_, __) => SizedBox(height: 8.h),
                  itemBuilder: (_, index) {
                    return ServiceTile(item: servicesMockData[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
