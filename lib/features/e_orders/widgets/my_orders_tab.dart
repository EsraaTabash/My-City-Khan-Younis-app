import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/e_orders/model/my_order_item.dart';
import 'package:flutter_application_1/features/e_orders/widgets/my_order_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyOrdersTab extends StatelessWidget {
  final List<MyOrderItem> items;

  const MyOrdersTab({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.fromLTRB(14.w, 6.h, 14.w, 16.h),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return MyOrderCard(item: items[index], onTap: () {});
      },
    );
  }
}
