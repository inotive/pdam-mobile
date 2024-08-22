// ignore_for_file: depend_on_referenced_packages

import 'package:dartz/dartz.dart';
import 'package:pdam_inventory/data/data_source/purchase_order_data_source.dart';
import 'package:pdam_inventory/data/mapper/purchase_order_mapper.dart';
import 'package:pdam_inventory/data/networks/error_handler.dart';
import 'package:pdam_inventory/data/networks/failure.dart';
import 'package:pdam_inventory/data/networks/network_info.dart';
import 'package:pdam_inventory/domain/model/purchase_order_model.dart';
import 'package:pdam_inventory/domain/repository/purchase_order_repository.dart';

class PurchaseOrderRepositoryImpl implements PurchaseOrderRepository {
  final PurchaseOrderDataSource _purchaseOrderDataSource;
  final NetworkInfo _networkInfo;

  PurchaseOrderRepositoryImpl(this._purchaseOrderDataSource, this._networkInfo);

  @override
  Future<Either<Failure, PurchaseOrder>> purchaseOrder() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _purchaseOrderDataSource.purchaseOrder();

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
  Future<Either<Failure, PurchaseOrderDetail>> purchaseOrderDetail(String id) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _purchaseOrderDataSource.purchaseOrderDetail(id);

        if (response.meta?.code == ResponseCode.SUCCESS) {
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
}
