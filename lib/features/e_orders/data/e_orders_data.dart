import 'package:flutter_application_1/features/e_orders/models/my_order_item.dart';
import 'package:flutter_application_1/features/e_orders/models/order_category.dart';

class EOrdersData {
  static const List<OrderCategory> categories = [
    OrderCategory(title: 'المياه و الصرف الصحي (المجاري)', requests: []),
    OrderCategory(
      title: 'الجباية و المستحقات المالية',
      requests: [
        'منح شهادة خلو من العوائد',
        'الاعتراض على مبالغ أضيفت على الفاتورة مقابل خدمات',
      ],
    ),
    OrderCategory(title: 'الأبنية و التنظيم و المخططات', requests: []),
    OrderCategory(title: 'الشوارع و الطرق', requests: []),
    OrderCategory(title: 'خدمات متنوعة', requests: []),
    OrderCategory(title: 'الصحة و البيئة', requests: []),
    OrderCategory(title: 'الحرف و المهن و الإيجارات', requests: []),
  ];

  static const List<MyOrderItem> myOrders = [
    MyOrderItem(
      title: 'خلو عوائد',
      date: '2019-2-18',
      fees: '20 شيكل',
      status: 'مرفوض',
    ),
    MyOrderItem(
      title: 'خلو عوائد',
      date: '2019-2-18',
      fees: '20 شيكل',
      status: 'تم الطلب',
    ),
    MyOrderItem(
      title: 'خلو عوائد',
      date: '2019-2-18',
      fees: '20 شيكل',
      status: 'مرفوض',
    ),
    MyOrderItem(
      title: 'خلو عوائد',
      date: '2019-2-18',
      fees: '20 شيكل',
      status: 'تم الطلب',
    ),
  ];
}
