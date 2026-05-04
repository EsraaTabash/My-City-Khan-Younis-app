enum BaladiyatiSection { khanYounis, departments, history }

enum BaladiyatiDetailType { city, history, departments }

class MayorInfo {
  final String title;
  final String name;
  final String description;
  final String imagePath;

  const MayorInfo({
    required this.title,
    required this.name,
    required this.description,
    required this.imagePath,
  });
}

class BaladiyatiActionItem {
  final BaladiyatiSection section;
  final String label;
  final int colorValue;

  const BaladiyatiActionItem({
    required this.section,
    required this.label,
    required this.colorValue,
  });
}

class BaladiyatiNewsItem {
  final String title;
  final String date;
  final String description;
  final String imagePath;
  final String category;

  const BaladiyatiNewsItem({
    required this.title,
    required this.date,
    required this.description,
    required this.imagePath,
    required this.category,
  });
}

class BaladiyatiData {
  static const String dummyText =
      'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربي، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التي يولدها التطبيق إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربي زيادة عدد الفقرات كما تريد، النص لن يبدو مقسماً ولا يحتوي أخطاء لغوية، مولد النص العربي مفيد لمصممي المواقع على وجه الخصوص، حيث يحتاج العميل في كثير من الأحيان أن يطلع على صورة حقيقية لتصميم الموقع';

  static const MayorInfo mayor = MayorInfo(
    title: 'كلمة رئيس البلدية',
    name: 'م. علاء الدين محمد البطة',
    description:
        'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربي، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى.',
    imagePath: 'assets/images/president.png',
  );

  static const List<BaladiyatiActionItem> actions = [
    BaladiyatiActionItem(
      section: BaladiyatiSection.history,
      label: 'بلدية خانيونس',
      colorValue: 0xFF079BEE,
    ),
    BaladiyatiActionItem(
      section: BaladiyatiSection.departments,
      label: 'دوائر البلدية',
      colorValue: 0xFF27304F,
    ),

    BaladiyatiActionItem(
      section: BaladiyatiSection.khanYounis,
      label: 'مدينة خانيونس',
      colorValue: 0xFFD9188D,
    ),
  ];

  static const List<String> cityImages = [
    'assets/images/Bitmap.png',
    'assets/images/Bitmap-1.png',
    'assets/images/Bitmap-2.png',
    'assets/images/Bitmap-3.png',
  ];

  static const List<BaladiyatiNewsItem> news = [
    BaladiyatiNewsItem(
      title: 'بلدية خانيونس تنظم ورشة عمل حول "التشبيكيات الخارجية" للمؤسسات',
      date: '18-2-2019',
      description:
          'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربي.',
      imagePath: 'assets/images/coverimage.png',
      category: 'أخبار اجتماعية',
    ),
    BaladiyatiNewsItem(
      title: 'عنوان الخبر الرئيسي',
      date: '15-5-2019',
      description:
          'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربي.',
      imagePath: 'assets/images/Rectangle-2.png',
      category: 'أخبار رياضية',
    ),
    BaladiyatiNewsItem(
      title: 'عنوان الخبر الرئيسي',
      date: '15-5-2019',
      description:
          'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربي.',
      imagePath: 'assets/images/Rectangle-3.png',
      category: 'أخبار عامة',
    ),
    BaladiyatiNewsItem(
      title: 'عنوان الخبر الرئيسي',
      date: '15-5-2019',
      description:
          'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربي.',
      imagePath: 'assets/images/Rectangle-1.png',
      category: 'أخبار اجتماعية',
    ),
    BaladiyatiNewsItem(
      title: 'عنوان الخبر الرئيسي',
      date: '15-5-2019',
      description:
          'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربي.',
      imagePath: 'assets/images/Rectangle-2.png',
      category: 'أخبار اجتماعية',
    ),
    BaladiyatiNewsItem(
      title: 'عنوان الخبر الرئيسي',
      date: '15-5-2019',
      description:
          'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربي.',
      imagePath: 'assets/images/Rectangle-3.png',
      category: 'أخبار اجتماعية',
    ),
    BaladiyatiNewsItem(
      title: 'عنوان الخبر الرئيسي',
      date: '15-5-2019',
      description:
          'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربي.',
      imagePath: 'assets/images/Rectangle-2.png',
      category: 'أخبار اجتماعية',
    ),
  ];

  static const List<String> cityTabs = [
    'لمحة عامة',
    'التجارة',
    'الزراعة',
    'الصناعة',
    'السياحة',
  ];

  static const List<String> historyTabs = [
    'نبذة تاريخية',
    'الرؤية و الأهداف',
    'المجلس البلدي',
    'مرافق البلدية',
  ];

  static const List<String> departmentsTabs = [
    'المياه و الصرف',
    'الصحة و البيئة',
    'المشاريع',
    'التخطيط و التطوير',
  ];

  static List<String> tabsForType(BaladiyatiDetailType type) {
    switch (type) {
      case BaladiyatiDetailType.city:
        return cityTabs;
      case BaladiyatiDetailType.history:
        return historyTabs;
      case BaladiyatiDetailType.departments:
        return departmentsTabs;
    }
  }

  static String titleForType(BaladiyatiDetailType type) {
    switch (type) {
      case BaladiyatiDetailType.city:
        return 'مدينة خان يونس';
      case BaladiyatiDetailType.history:
        return 'بلدية خان يونس';
      case BaladiyatiDetailType.departments:
        return 'دوائر البلدية';
    }
  }

  static BaladiyatiDetailType typeFromSection(BaladiyatiSection section) {
    switch (section) {
      case BaladiyatiSection.khanYounis:
        return BaladiyatiDetailType.city;
      case BaladiyatiSection.departments:
        return BaladiyatiDetailType.departments;
      case BaladiyatiSection.history:
        return BaladiyatiDetailType.history;
    }
  }
}
