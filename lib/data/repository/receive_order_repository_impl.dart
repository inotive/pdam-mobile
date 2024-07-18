// ignore: depend_on_referenced_packages
import 'package:dartz/dartz.dart';
import 'package:pdam_inventory/data/data_source/receive_order_data_source.dart';
import 'package:pdam_inventory/data/mapper/receive_order_mapper.dart';
import 'package:pdam_inventory/data/networks/error_handler.dart';
import 'package:pdam_inventory/data/networks/failure.dart';
import 'package:pdam_inventory/data/networks/network_info.dart';
import 'package:pdam_inventory/domain/model/receive_order_model.dart';
import 'package:pdam_inventory/domain/repository/receive_order_repository.dart';

class ReceiveOrderRepositoryImpl implements ReceiveOrderRepository {
  final NetworkInfo _networkInfo;
  final ReceiveOrderDataSource _receiveOrderDataSource;
  ReceiveOrderRepositoryImpl(this._networkInfo, this._receiveOrderDataSource);

  @override
  Future<Either<Failure, ReceiveOrderPagination>> receiveOrders() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _receiveOrderDataSource.receiveOrders();

        if (response.status?.code == ResponseCode.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(
              response.status?.code ?? ResponseCode.DEFAULT, response.status?.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
