import 'package:flutter_application_1/features/home/widgets/ads_section.dart';
import 'package:flutter_application_1/features/home/widgets/home_stats_section.dart';
import 'package:flutter_application_1/features/home/widgets/news_section.dart';

class HomeData {
  static const List<HomeStatItem> stats = [
    HomeStatItem(title: 'الاشتراكات', value: '105320'),
    HomeStatItem(title: 'طلباتي', value: '25'),
    HomeStatItem(title: 'نقاطي', value: '500'),
  ];

  static const List<NewsItem> news = [
    NewsItem(
      title: 'بلدية خانيونس تنظم ورشة عمل حول "التنشيطات الخارجية" للمؤسسات',
      date: '18-2-2019',
      description:
          'هذا هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربي، حيث يمكنك أن تولد مثل هذا النص.',
      imagePath: 'assets/images/news_bg.png',
    ),
  ];

  static const List<AdItem> ads = [
    AdItem(
      title: 'إعلان توريد أجهزة تكييف و تبريد لقسم الصيانة و الدعم الفني',
      subtitle: 'قسم المشتريات',
      imagePath: 'assets/images/ads_bg.png',
      date: '18-2-2019',
    ),
  ];
}
