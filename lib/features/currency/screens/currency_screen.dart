import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/widgets/image_page_header.dart';
import 'package:flutter_application_1/features/currency/data/currency_mock_data.dart';
import 'package:flutter_application_1/features/currency/widgets/bottom_buildings_background.dart';
import 'package:flutter_application_1/features/currency/widgets/currency_card.dart';
import 'package:flutter_application_1/features/currency/widgets/currency_header_content.dart';
import 'package:flutter_application_1/features/menu/screens/menu_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CurrencyScreen extends StatefulWidget {
  const CurrencyScreen({super.key});

  @override
  State<CurrencyScreen> createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openMenu() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    final currencies = CurrencyMockData.currencies;

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
              ImagePageHeader(
                title: 'أسعار العملات',
                backgroundImage: 'assets/images/currency-bg.png',
                height: 280,
                onBackTap: () => Navigator.pop(context),
                onMenuTap: _openMenu,
                content: const CurrencyHeaderContent(),
              ),

              Expanded(
                child: Stack(
                  children: [
                    const BottomBuildingsBackground(),

                    ListView.separated(
                      physics: const ClampingScrollPhysics(),
                      padding: EdgeInsets.fromLTRB(15.w, 18.h, 15.w, 150.h),
                      itemCount: currencies.length,
                      separatorBuilder: (_, __) => SizedBox(height: 10.h),
                      itemBuilder: (context, index) {
                        return CurrencyCard(item: currencies[index]);
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
