import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/e_orders/models/order_category.dart';
import 'package:flutter_application_1/features/e_orders/widgets/order_category_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewOrderTab extends StatelessWidget {
  final List<OrderCategory> categories;

  const NewOrderTab({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.fromLTRB(14.w, 6.h, 14.w, 16.h),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return OrderCategoryCard(category: categories[index]);
      },
    );
  }
}
