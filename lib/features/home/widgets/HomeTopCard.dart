import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/widgets/AppCard.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_application_1/features/home/widgets/home_stats_section.dart';
import 'package:flutter_application_1/features/home/widgets/quick_access_section.dart';

class HomeTopCard extends StatelessWidget {
  final bool isGuest;
  final List<HomeStatItem> stats;

  const HomeTopCard({super.key, required this.isGuest, required this.stats});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      margin: EdgeInsets.symmetric(horizontal: 0.w),
      borderRadius: 12.r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (!isGuest) ...[
            HomeStatsSection(items: stats, showPoints: true),
            SizedBox(height: 14.h),
          ],
          const QuickAccessSection(insideParentCard: true),
        ],
      ),
    );
  }
}
