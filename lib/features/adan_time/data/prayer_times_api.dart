import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter_application_1/features/adan_time/models/prayer_time_model.dart';

class PrayerTimesApi {
  static const double khanYounisLat = 31.3462;
  static const double khanYounisLng = 34.3038;

  static Future<PrayerDayResult> getPrayerTimes(DateTime date) async {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year.toString();

    final url = Uri.parse(
      'https://api.aladhan.com/v1/timings/$day-$month-$year'
      '?latitude=$khanYounisLat'
      '&longitude=$khanYounisLng'
      '&method=3'
      '&school=0'
      '&timezonestring=Asia/Gaza',
    );

    final response = await http.get(url);

    if (response.statusCode != 200) {
      throw Exception('فشل تحميل مواعيد الصلاة');
    }

    final jsonBody = jsonDecode(response.body) as Map<String, dynamic>;
    final data = jsonBody['data'] as Map<String, dynamic>;
    final timings = data['timings'] as Map<String, dynamic>;
    final dateData = data['date'] as Map<String, dynamic>;
    final hijri = dateData['hijri'] as Map<String, dynamic>;
    final gregorian = dateData['gregorian'] as Map<String, dynamic>;

    return PrayerDayResult(
      gregorianDate: _cleanText(gregorian['date'].toString()),
      hijriDate:
          '${hijri['day']} ${hijri['month']['ar']} ${hijri['year']} هجري',
      prayers: [
        PrayerTimeModel(name: 'الفجر', time: _cleanTime(timings['Fajr'])),
        PrayerTimeModel(name: 'الشروق', time: _cleanTime(timings['Sunrise'])),
        PrayerTimeModel(name: 'الظهر', time: _cleanTime(timings['Dhuhr'])),
        PrayerTimeModel(name: 'العصر', time: _cleanTime(timings['Asr'])),
        PrayerTimeModel(name: 'المغرب', time: _cleanTime(timings['Maghrib'])),
        PrayerTimeModel(name: 'العشاء', time: _cleanTime(timings['Isha'])),
      ],
    );
  }

  static String _cleanTime(dynamic value) {
    final text = value.toString();

    // بعض الردود ترجع مثل: 04:32 (EET)
    final onlyTime = text.split(' ').first.trim();
    final parts = onlyTime.split(':');

    if (parts.length < 2) return onlyTime;

    return '${parts[0].padLeft(2, '0')} : ${parts[1].padLeft(2, '0')}';
  }

  static String _cleanText(String value) {
    return value.trim();
  }
}

class PrayerDayResult {
  final String gregorianDate;
  final String hijriDate;
  final List<PrayerTimeModel> prayers;

  const PrayerDayResult({
    required this.gregorianDate,
    required this.hijriDate,
    required this.prayers,
  });
}
