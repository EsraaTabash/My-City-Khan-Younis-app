import 'prayer_time_model.dart';

class PrayerTimesData {
  static PrayerTimeModel getNextPrayerForDate({
    required DateTime selectedDate,
    required List<PrayerTimeModel> prayers,
    required DateTime now,
  }) {
    final isToday = _isSameDate(selectedDate, now);

    if (!isToday) {
      return prayers.first;
    }

    final currentMinutes = now.hour * 60 + now.minute;

    for (final prayer in prayers) {
      final prayerMinutes = _timeToMinutes(prayer.time);
      if (prayerMinutes >= currentMinutes) {
        return prayer;
      }
    }

    return prayers.first;
  }

  static String getRemainingTime({
    required DateTime selectedDate,
    required PrayerTimeModel prayer,
    required DateTime now,
  }) {
    DateTime prayerDateTime = _dateWithPrayerTime(selectedDate, prayer.time);

    if (prayerDateTime.isBefore(now)) {
      prayerDateTime = prayerDateTime.add(const Duration(days: 1));
    }

    final diff = prayerDateTime.difference(now);

    final hours = diff.inHours;
    final minutes = diff.inMinutes % 60;

    return '$hours:${minutes.toString().padLeft(2, '0')}';
  }

  static String formatLiveClock(DateTime now) {
    final hour = now.hour.toString().padLeft(2, '0');
    final minute = now.minute.toString().padLeft(2, '0');

    return '$hour : $minute';
  }

  static DateTime _dateWithPrayerTime(DateTime date, String time) {
    final cleanTime = time.replaceAll(' ', '');
    final parts = cleanTime.split(':');

    final hour = int.tryParse(parts[0]) ?? 0;
    final minute = int.tryParse(parts[1]) ?? 0;

    return DateTime(date.year, date.month, date.day, hour, minute);
  }

  static int _timeToMinutes(String time) {
    final cleanTime = time.replaceAll(' ', '');
    final parts = cleanTime.split(':');

    final hour = int.tryParse(parts[0]) ?? 0;
    final minute = int.tryParse(parts[1]) ?? 0;

    return hour * 60 + minute;
  }

  static bool _isSameDate(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
