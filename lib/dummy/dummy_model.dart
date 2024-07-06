class NotificationDummyModel {
  NotificationDummyModel({
    required this.id,
    required this.code,
    required this.desc,
    required this.date,
    required this.isRead,
  });

  final int id;
  final String code;
  final String desc;
  final String date;
  final int isRead;
}

class FeatureDummyModel {
  FeatureDummyModel({
    required this.id,
    required this.title,
    required this.icon,
    required this.routes,
  });

  final int id;
  final String title;
  final String icon;
  final String routes;
}
