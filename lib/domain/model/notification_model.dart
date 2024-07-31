class NotificationCount {
  NotificationCount(this.data);

  int data;
}

class NotificationDataDetail {
  NotificationDataDetail(this.requestNumber, this.status);

  String requestNumber;
  String status;
}

class NotificationData {
  NotificationData(
    this.id,
    this.type,
    this.notifiableId,
    this.data,
    this.readAt,
    this.createdAt,
    this.updatedAt,
  );

  String id;
  String type;
  String notifiableId;
  NotificationDataDetail? data;
  String readAt;
  String createdAt;
  String updatedAt;
}

class NotificationModel {
  NotificationModel(this.data);

  List<NotificationData> data;
}
