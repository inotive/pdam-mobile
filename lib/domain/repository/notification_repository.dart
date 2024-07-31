// ignore_for_file: depend_on_referenced_packages

import 'package:dartz/dartz.dart';
import 'package:pdam_inventory/data/networks/failure.dart';
import 'package:pdam_inventory/domain/model/notification_model.dart';

abstract class NotificationRepository {
  Future<Either<Failure, NotificationCount>> notificationCount();
  Future<Either<Failure, NotificationModel>> notifications();
}
