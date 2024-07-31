// ignore: depend_on_referenced_packages
import 'package:dartz/dartz.dart';
import 'package:pdam_inventory/data/networks/failure.dart';
import 'package:pdam_inventory/domain/model/notification_model.dart';
import 'package:pdam_inventory/domain/repository/notification_repository.dart';
import 'package:pdam_inventory/domain/usecase/base_usecase.dart';

class NotificationUsecase implements BaseUsecase<void, NotificationModel> {
  final NotificationRepository _notificationRepository;
  NotificationUsecase(this._notificationRepository);

  @override
  Future<Either<Failure, NotificationModel>> execute(void output) {
    return _notificationRepository.notifications();
  }
}
