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

class StatusModel {
  StatusModel({
    required this.id,
    required this.text,
    required this.isActive,
  });

  final int id;
  final String text;
  final bool isActive;
}

class ProductModel {
  ProductModel({
    required this.id,
    required this.name,
    required this.stock,
    required this.addedStock,
    required this.status,
    required this.type,
    required this.date,
    required this.image,
  });

  final int id;
  final String name;
  final int stock;
  final int addedStock;
  final String status;
  final String type;
  final String date;
  final String image;
}
