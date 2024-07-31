// ignore_for_file: depend_on_referenced_packages

import 'package:dartz/dartz.dart';
import 'package:pdam_inventory/data/networks/failure.dart';
import 'package:pdam_inventory/domain/model/notification_model.dart';
import 'package:pdam_inventory/domain/repository/notification_repository.dart';
import 'package:pdam_inventory/domain/usecase/base_usecase.dart';

class NotificationCountUsecase implements BaseUsecase<void, NotificationCount> {
  final NotificationRepository _notificationRepository;
  NotificationCountUsecase(this._notificationRepository);

  @override
  Future<Either<Failure, NotificationCount>> execute(void output) async {
    return await _notificationRepository.notificationCount();
  }
}
