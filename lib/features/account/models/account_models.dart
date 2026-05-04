class QuickAccessItem {
  final String title;
  final String value;

  const QuickAccessItem({required this.title, required this.value});
}

class InvoiceItem {
  final String date;
  final String cumulativeAmount;
  final String currentMonthAmount;

  const InvoiceItem({
    required this.date,
    required this.cumulativeAmount,
    required this.currentMonthAmount,
  });
}

class PaymentItem {
  final String date;
  final String paidAmount;
  final String requiredAmount;
  final String discountAmount;

  const PaymentItem({
    required this.date,
    required this.paidAmount,
    required this.requiredAmount,
    required this.discountAmount,
  });
}

class ServiceItem {
  final String title;
  final String year;

  const ServiceItem({required this.title, required this.year});
}
