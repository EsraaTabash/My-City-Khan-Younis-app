import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/widgets/image_page_header.dart';
import 'package:flutter_application_1/features/adan_time/data/prayer_times_api.dart';
import 'package:flutter_application_1/features/adan_time/data/prayer_times_data.dart';
import 'package:flutter_application_1/features/adan_time/widgets/prayer_date_bar.dart';
import 'package:flutter_application_1/features/adan_time/widgets/prayer_header_content.dart';
import 'package:flutter_application_1/features/adan_time/widgets/prayer_time_tile.dart';
import 'package:flutter_application_1/features/menu/screens/menu_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AdanTimeScreen extends StatefulWidget {
  const AdanTimeScreen({super.key});

  @override
  State<AdanTimeScreen> createState() => _AdanTimeScreenState();
}

class _AdanTimeScreenState extends State<AdanTimeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  DateTime selectedDate = DateTime.now();
  DateTime currentTime = DateTime.now();

  Timer? _clockTimer;
  late Future<PrayerDayResult> _prayerFuture;

  @override
  void initState() {
    super.initState();

    _loadPrayerTimes();

    _clockTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) return;

      setState(() {
        currentTime = DateTime.now();
      });
    });
  }

  void _loadPrayerTimes() {
    _prayerFuture = PrayerTimesApi.getPrayerTimes(selectedDate);
  }

  @override
  void dispose() {
    _clockTimer?.cancel();
    super.dispose();
  }

  void _nextDay() {
    setState(() {
      selectedDate = selectedDate.add(const Duration(days: 1));
      _loadPrayerTimes();
    });
  }

  void _previousDay() {
    setState(() {
      selectedDate = selectedDate.subtract(const Duration(days: 1));
      _loadPrayerTimes();
    });
  }

  void _openMenu() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PrayerDayResult>(
      future: _prayerFuture,
      builder: (context, snapshot) {
        final hasData = snapshot.hasData;
        final data = snapshot.data;

        final prayers = data?.prayers ?? const [];

        final nextPrayer = prayers.isNotEmpty
            ? PrayerTimesData.getNextPrayerForDate(
                selectedDate: selectedDate,
                prayers: prayers,
                now: currentTime,
              )
            : null;

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
                    title: 'مواقيت الأذان',
                    backgroundImage: 'assets/images/adan-bg.png',
                    height: 280,
                    showShareIcon: true,
                    onBackTap: () => Navigator.pop(context),
                    onMenuTap: _openMenu,
                    content: nextPrayer == null
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          )
                        : PrayerHeaderContent(
                            nextPrayer: nextPrayer,
                            selectedDate: selectedDate,
                            currentTime: currentTime,
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
                              opacity: 0.22,
                              child: Image.asset(
                                'assets/images/header_bg.png',
                                height: 118.h,
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

                        Column(
                          children: [
                            PrayerDateBar(
                              selectedDate: selectedDate,
                              hijriText: data?.hijriDate ?? '',
                              onPreviousDay: _previousDay,
                              onNextDay: _nextDay,
                            ),

                            Expanded(
                              child: Builder(
                                builder: (_) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }

                                  if (snapshot.hasError) {
                                    return Center(
                                      child: Padding(
                                        padding: EdgeInsets.all(20.w),
                                        child: Text(
                                          'تعذر تحميل مواعيد الصلاة، تأكد من الاتصال بالإنترنت',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Bahij',
                                            color: Colors.red,
                                            fontSize: 13.sp,
                                          ),
                                        ),
                                      ),
                                    );
                                  }

                                  if (!hasData || prayers.isEmpty) {
                                    return Center(
                                      child: Text(
                                        'لا توجد مواعيد متاحة',
                                        style: TextStyle(
                                          fontFamily: 'Bahij',
                                          fontSize: 13.sp,
                                        ),
                                      ),
                                    );
                                  }

                                  return ListView.separated(
                                    physics: const ClampingScrollPhysics(),
                                    padding: EdgeInsets.fromLTRB(
                                      15.w,
                                      12.h,
                                      15.w,
                                      140.h,
                                    ),
                                    itemCount: prayers.length,
                                    separatorBuilder: (_, __) {
                                      return SizedBox(height: 8.h);
                                    },
                                    itemBuilder: (context, index) {
                                      return PrayerTimeTile(
                                        item: prayers[index],
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
