import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/widgets/app_header.dart';
import 'package:flutter_application_1/features/e_orders/data/e_orders_data.dart';
import 'package:flutter_application_1/features/e_orders/widgets/e_orders_tab_bar.dart';
import 'package:flutter_application_1/features/e_orders/widgets/my_orders_tab.dart';
import 'package:flutter_application_1/features/e_orders/widgets/new_order_tab.dart';
import 'package:flutter_application_1/features/menu/screens/menu_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EOrdersScreen extends StatefulWidget {
  const EOrdersScreen({super.key});

  @override
  State<EOrdersScreen> createState() => _EOrdersScreenState();
}

class _EOrdersScreenState extends State<EOrdersScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
        drawer: SizedBox(width: 300.w, child: const MenuScreen()),
        backgroundColor: const Color(0xFFF3F5F8),
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              AppHeader(
                title: 'الطلبات الإلكترونية',
                onBackTap: () => Navigator.of(context).pop(),
                onMenuTap: _openMenu,
              ),
              Expanded(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(14.w, 12.h, 14.w, 10.h),
                      child: EOrdersTabBar(controller: _tabController),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          MyOrdersTab(items: EOrdersData.myOrders),
                          NewOrderTab(categories: EOrdersData.categories),
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
