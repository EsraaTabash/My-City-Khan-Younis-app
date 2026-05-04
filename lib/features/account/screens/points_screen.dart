import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/widgets/app_header.dart';
import 'package:flutter_application_1/features/account/widgets/app_dropdown_box.dart';
import 'package:flutter_application_1/features/account/widgets/app_input_box.dart';
import 'package:flutter_application_1/features/account/widgets/info_tile.dart';
import 'package:flutter_application_1/features/account/widgets/section_title.dart';
import 'package:flutter_application_1/features/menu/screens/menu_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PointsScreen extends StatefulWidget {
  const PointsScreen({super.key});

  @override
  State<PointsScreen> createState() => _PointsScreenState();
}

class _PointsScreenState extends State<PointsScreen> {
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
            textDirection: TextDirection.rtl,
            children: [
              AppHeader(
                title: 'نقاطي',
                onBackTap: () => Navigator.pop(context),
                onMenuTap: _openMenu,
              ),

              Container(
                width: double.infinity,
                height: 82.h,
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'رصيد النقاط',
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontFamily: 'Bahij',
                        color: const Color(0xFF079BEE),
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        height: 1.1,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      '412',
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontFamily: 'Bahij',
                        color: const Color(0xFFD9188D),
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w500,
                        height: 1.1,
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: IgnorePointer(
                        child: Opacity(
                          opacity: 0.50,
                          child: Image.asset(
                            'assets/images/header_bg.png',
                            height: 115.h,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            alignment: Alignment.bottomCenter,
                            errorBuilder: (_, __, ___) {
                              return const SizedBox.shrink();
                            },
                          ),
                        ),
                      ),
                    ),

                    SingleChildScrollView(
                      physics: const ClampingScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.w,
                        vertical: 20.h,
                      ),
                      child: Column(
                        textDirection: TextDirection.rtl,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SectionTitle(
                            title: 'اختر طريقة استبدال النقاط',
                            color: Color(0xFF4F596B),
                          ),

                          SizedBox(height: 8.h),

                          const AppDropdownBox(text: 'تحويل النقاط الى شيكل'),

                          SizedBox(height: 16.h),

                          const SectionTitle(
                            title: 'اختر قيمة النقاط',
                            color: Color(0xFF4F596B),
                          ),

                          SizedBox(height: 8.h),

                          const AppInputBox(
                            hint: 'مثال : 50 نقطة',
                            keyboardType: TextInputType.number,
                          ),

                          SizedBox(height: 20.h),

                          Align(
                            alignment: Alignment.centerRight,
                            child: SizedBox(
                              width: 158.w,
                              height: 47.h,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF079BEE),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.r),
                                  ),
                                ),
                                child: Text(
                                  'تحويل النقاط',
                                  textAlign: TextAlign.center,
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    fontFamily: 'Bahij',
                                    color: Colors.white,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 86.h),

                          const InfoTile(title: 'استبدال النقاط'),

                          SizedBox(height: 8.h),

                          const InfoTile(title: 'آلية احتساب النقاط'),

                          SizedBox(height: 120.h),
                        ],
                      ),
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
