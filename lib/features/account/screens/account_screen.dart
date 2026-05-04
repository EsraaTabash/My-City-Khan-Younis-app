import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/routes/app_navigation.dart';
import 'package:flutter_application_1/core/routes/app_routes.dart';
import 'package:flutter_application_1/features/account/widgets/large_wallet_card.dart';
import 'package:flutter_application_1/features/account/widgets/wallet_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/core/widgets/app_header.dart';
import '../widgets/user_info_card.dart';
import '../widgets/quick_card.dart';

class AccountScreen extends StatelessWidget {
  final VoidCallback? onMenuTap;

  const AccountScreen({super.key, this.onMenuTap});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF4F4F4),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              AppHeader(title: 'الحساب', onMenuTap: onMenuTap),

              const UserInfoCard(),

              SizedBox(height: 18.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'الوصول السريع',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: const Color(0xFF079BEE),
                        fontSize: 13.sp,
                      ),
                    ),

                    SizedBox(height: 12.h),

                    Row(
                      children: [
                        Expanded(
                          child: QuickCard(
                            title: 'فواتيري',
                            value: '105320',
                            backgroundColor: const Color(0xFFEDEDED),
                            titleColor: const Color(0xFF4F596B),
                            valueColor: const Color(0xFF079BEE),
                            onTap: () {
                              AppNavigation.push(context, AppRoutes.invoices);
                            },
                          ),
                        ),
                        SizedBox(width: 8.w),
                        const Expanded(
                          child: QuickCard(
                            title: 'رصيدي',
                            value: '25 شيكل',
                            backgroundColor: Color(0xFF079BEE),
                            titleColor: Colors.white,
                            valueColor: Colors.white,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        const Expanded(
                          child: QuickCard(
                            title: 'المحفظة',
                            value: '500 شيكل',
                            backgroundColor: Color(0xFF27304F),
                            titleColor: Colors.white,
                            valueColor: Colors.white,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 16.h),

                    Row(
                      children: [
                        const Expanded(
                          child: WalletCard(
                            title: 'اتفاقيات',
                            value: '5200 شيكل',
                          ),
                        ),
                        SizedBox(width: 14.w),
                        const Expanded(
                          child: WalletCard(
                            title: 'التنظيم',
                            value: '5200 شيكل',
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 14.h),

                    const LargeWalletCard(title: 'إيجارات'),

                    SizedBox(height: 24.h),
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
