// ignore_for_file: depend_on_referenced_packages

import 'package:dartz/dartz.dart';
import 'package:pdam_inventory/data/networks/failure.dart';
import 'package:pdam_inventory/domain/repository/notification_repository.dart';
import 'package:pdam_inventory/domain/usecase/base_usecase.dart';

class ReadNotificationUsecase implements BaseUsecase<String, bool> {
  final NotificationRepository _notificationRepository;
  ReadNotificationUsecase(this._notificationRepository);

  @override
  Future<Either<Failure, bool>> execute(String id) {
    return _notificationRepository.readNotification(id);
  }
}
