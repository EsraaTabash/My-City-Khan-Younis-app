import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/widgets/app_header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_application_1/core/theme/app_text_styles.dart';

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
              AppHeader(
                title: 'الحساب',
                onBackTap: () {},
                onMenuTap: onMenuTap,
              ),

              _UserInfoCard(),

              SizedBox(height: 18.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'الوصول السريع',
                      textAlign: TextAlign.right,
                      style: AppTextStyles.regular14.copyWith(
                        color: const Color(0xFF079BEE),
                        fontSize: 13.sp,
                      ),
                    ),

                    SizedBox(height: 12.h),

                    Row(
                      children: [
                        Expanded(
                          child: _QuickCard(
                            title: 'فواتيري',
                            value: '105320',
                            color: const Color(0xFFEDEDED),
                            titleColor: const Color(0xFF4F596B),
                            valueColor: const Color(0xFF079BEE),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: _QuickCard(
                            title: 'رصيدي',
                            value: '25 شيكل',
                            color: const Color(0xFF079BEE),
                            titleColor: Colors.white,
                            valueColor: Colors.white,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: _QuickCard(
                            title: 'المحفظة',
                            value: '500 شيكل',
                            color: const Color(0xFF27304F),
                            titleColor: Colors.white,
                            valueColor: Colors.white,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 16.h),

                    Row(
                      children: [
                        Expanded(
                          child: _WalletCard(
                            title: 'اتفاقيات',
                            value: '5200 شيكل',
                          ),
                        ),
                        SizedBox(width: 14.w),
                        Expanded(
                          child: _WalletCard(
                            title: 'التنظيم',
                            value: '5200 شيكل',
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 14.h),

                    _LargeWalletCard(title: 'إيجارات'),

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

class _UserInfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88.h,
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          ClipOval(
            child: Image.asset(
              'assets/images/userimg.png',
              width: 58.w,
              height: 58.w,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: 58.w,
                height: 58.w,
                color: const Color(0xFFEDEDED),
                child: Icon(
                  Icons.person,
                  color: const Color(0xFF079BEE),
                  size: 30.sp,
                ),
              ),
            ),
          ),

          SizedBox(width: 12.w),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'أهلاً و سهلاً : ',
                        style: AppTextStyles.regular14.copyWith(
                          color: const Color(0xFF079BEE),
                          fontSize: 14.sp,
                        ),
                      ),
                      TextSpan(
                        text: 'محمد مصباح الرباطي',
                        style: AppTextStyles.regular14.copyWith(
                          color: const Color(0xFF25325B),
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 7.h),

                RichText(
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'رقم الاشتراك : ',
                        style: AppTextStyles.regular14.copyWith(
                          color: const Color(0xFF25325B),
                          fontSize: 11.sp,
                        ),
                      ),
                      TextSpan(
                        text: '152042',
                        style: AppTextStyles.regular14.copyWith(
                          color: const Color(0xFFD9188D),
                          fontSize: 11.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  final Color titleColor;
  final Color valueColor;

  const _QuickCard({
    required this.title,
    required this.value,
    required this.color,
    required this.titleColor,
    required this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 73.h,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(3.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyles.regular14.copyWith(
              color: titleColor,
              fontSize: 12.sp,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            value,
            textAlign: TextAlign.center,
            style: AppTextStyles.semiBold16.copyWith(
              color: valueColor,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}

class _WalletCard extends StatelessWidget {
  final String title;
  final String value;

  const _WalletCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3.r),
        border: Border.all(color: const Color(0xFFE7E7E7)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            textDirection: TextDirection.rtl,
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                'assets/images/icon23.svg',
                width: 14.w,
                height: 14.h,
                colorFilter: const ColorFilter.mode(
                  Color(0xFF079BEE),
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(width: 6.w),
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.regular14.copyWith(
                  color: const Color(0xFF4F596B),
                  fontSize: 11.sp,
                  height: 1.1,
                ),
              ),
            ],
          ),

          SizedBox(height: 5.h),

          SizedBox(
            width: double.infinity,
            child: Text(
              value,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.regular14.copyWith(
                color: const Color(0xFF079BEE),
                fontSize: 14.sp,
                height: 1.1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LargeWalletCard extends StatelessWidget {
  final String title;

  const _LargeWalletCard({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 142.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3.r),
        border: Border.all(color: const Color(0xFFE7E7E7)),
      ),
      padding: EdgeInsets.all(14.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            textDirection: TextDirection.rtl,
            children: [
              SvgPicture.asset(
                'assets/images/icon23.svg',
                width: 17.w,
                height: 17.h,
                colorFilter: const ColorFilter.mode(
                  Color(0xFF079BEE),
                  BlendMode.srcIn,
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                title,
                style: AppTextStyles.regular14.copyWith(
                  color: const Color(0xFF4F596B),
                  fontSize: 13.sp,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
