import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/account/data/account_mock_data.dart';
import 'package:flutter_application_1/features/account/widgets/invoice_card.dart';
import 'package:flutter_application_1/features/account/widgets/invoice_tab_bar.dart';
import 'package:flutter_application_1/features/account/widgets/payment_card.dart';
import 'package:flutter_application_1/core/widgets/app_header.dart';

class InvoicesScreen extends StatefulWidget {
  const InvoicesScreen({super.key});

  @override
  State<InvoicesScreen> createState() => _InvoicesScreenState();
}

class _InvoicesScreenState extends State<InvoicesScreen> {
  int selectedIndex = 0;

  final tabs = const ['الفواتير', 'الدفعات المالية', 'كشف تفصيلي'];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF4F4F4),
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              AppHeader(
                title: 'فواتيري',
                onBackTap: () => Navigator.pop(context),
                onMenuTap: () {},
              ),

              const SizedBox(height: 0),

              InvoiceTabBar(
                tabs: tabs,
                selectedIndex: selectedIndex,
                onChanged: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),

              Expanded(
                child: IndexedStack(
                  index: selectedIndex,
                  children: [
                    ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 16),
                      itemCount: invoicesMockData.length,
                      itemBuilder: (_, index) {
                        return InvoiceCard(item: invoicesMockData[index]);
                      },
                    ),

                    ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 16),
                      itemCount: paymentsMockData.length,
                      itemBuilder: (_, index) {
                        return PaymentCard(item: paymentsMockData[index]);
                      },
                    ),

                    ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 16),
                      itemCount: paymentsMockData.length,
                      itemBuilder: (_, index) {
                        return PaymentCard(item: paymentsMockData[index]);
                      },
                    ),
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
