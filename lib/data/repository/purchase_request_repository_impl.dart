// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:pdam_inventory/data/data_source/purchase_request_data_source.dart';
import 'package:pdam_inventory/data/mapper/purchase_request_mapper.dart';
import 'package:pdam_inventory/data/networks/error_handler.dart';
import 'package:pdam_inventory/data/networks/failure.dart';
import 'package:pdam_inventory/data/networks/network_info.dart';
import 'package:pdam_inventory/data/requests/create_request_item_request.dart';
import 'package:pdam_inventory/domain/model/purchase_request_model.dart';
import 'package:pdam_inventory/domain/repository/purchase_request_repository.dart';

class PurchaseRequestRepositoryImpl implements PurchaseRequestRepository {
  PurchaseRequestRepositoryImpl(this._purchaseRequestDatasource, this._networkInfo);

  final PurchaseRequestDataSource _purchaseRequestDatasource;
  final NetworkInfo _networkInfo;

  @override
  Future<Either<Failure, PurchaseRequestPagination>> purchaseRequest(Map<String, dynamic> queries) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _purchaseRequestDatasource.purchaseRequest(queries);

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

  @override
  Future<Either<Failure, PurchaseRequestSummary>> purchaseRequestSummary() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _purchaseRequestDatasource.purchaseRequestSummary();

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

  @override
  Future<Either<Failure, PurchaseRequestDetail>> purchaseRequestDetail(int id) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _purchaseRequestDatasource.purchaseRequestDetail(id);

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

  @override
  Future<Either<Failure, bool>> createPurchaseRequest(CreateRequestItemRequest request) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _purchaseRequestDatasource.createPurchaseRequest(request);

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
        log(error.toString());
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
