import 'package:dartz/dartz.dart';
import 'package:pdam_inventory/data/data_source/notification_data_source.dart';
import 'package:pdam_inventory/data/local_source/app_preference.dart';
import 'package:pdam_inventory/data/mapper/notification_mapper.dart';
import 'package:pdam_inventory/data/networks/error_handler.dart';
import 'package:pdam_inventory/data/networks/failure.dart';
import 'package:pdam_inventory/data/networks/network_info.dart';
import 'package:pdam_inventory/domain/model/notification_model.dart';
import 'package:pdam_inventory/domain/repository/notification_repository.dart';
import 'package:pdam_inventory/persentations/resources/string_app.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NetworkInfo _networkInfo;
  final NotificationDataSource _notificationDataSource;
  final AppPreference _appPreference;
  NotificationRepositoryImpl(this._networkInfo, this._notificationDataSource, this._appPreference);

  @override
  Future<Either<Failure, NotificationCount>> notificationCount() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _notificationDataSource.notificationCount();
        if (response.meta?.code == ResponseCode.SUCCESS) {
          _appPreference.setInt(PREFS_KEY_NOTIFICATION_COUNT, response.data ?? ZERO);
          return Right(response.toDomain());
        } else {
          return Left(
            Failure(
              response.meta?.code ?? ResponseCode.DEFAULT,
              response.meta?.message ?? ResponseMessage.DEFAULT,
            ),
          );
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, NotificationModel>> notifications() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _notificationDataSource.notifications();
        if (response.status?.code == ResponseCode.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(
            Failure(
              response.status?.code ?? ResponseCode.DEFAULT,
              response.status?.message ?? ResponseMessage.DEFAULT,
            ),
          );
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> readNotification(String id) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _notificationDataSource.readNotification(id);
        if (response.meta?.code == ResponseCode.SUCCESS) {
          return const Right(true);
        } else {
          return Left(
            Failure(
              response.meta?.code ?? ResponseCode.DEFAULT,
              response.meta?.message ?? ResponseMessage.DEFAULT,
            ),
          );
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
