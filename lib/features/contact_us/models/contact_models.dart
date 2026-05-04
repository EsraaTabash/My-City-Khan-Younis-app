class ContactMessageItem {
  final String type;
  final String title;
  final String body;
  final String date;
  final String time;
  final int badgeCount;

  const ContactMessageItem({
    required this.type,
    required this.title,
    required this.body,
    required this.date,
    required this.time,
    required this.badgeCount,
  });
}

class SupervisorItem {
  final String name;
  final String location;
  final String phone;
  final double lat;
  final double lng;

  const SupervisorItem({
    required this.name,
    required this.location,
    required this.phone,
    required this.lat,
    required this.lng,
  });
}
