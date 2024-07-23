// ignore: depend_on_referenced_packages
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:pdam_inventory/data/data_source/stock_opname_data_source.dart';
import 'package:pdam_inventory/data/mapper/stock_opname_mapper.dart';
import 'package:pdam_inventory/data/networks/error_handler.dart';
import 'package:pdam_inventory/data/networks/failure.dart';
import 'package:pdam_inventory/data/networks/network_info.dart';
import 'package:pdam_inventory/domain/model/stock_opname_model.dart';
import 'package:pdam_inventory/domain/repository/stock_opname_repository.dart';

class StockOpnameRepositoryImpl implements StockOpnameRepository {
  final NetworkInfo _networkInfo;
  final StockOpnameDataSource _stockOpnameDataSource;
  StockOpnameRepositoryImpl(this._networkInfo, this._stockOpnameDataSource);

  @override
  Future<Either<Failure, StockOpname>> stockOpname(Map<String, dynamic> queries) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _stockOpnameDataSource.stockOpname(queries);

        if (response.status?.code == ResponseCode.SUCCESS) {
          return Right(response.toDomain());
        } else {
          log(response.status?.message ?? '');
          return Left(Failure(
              response.status?.code ?? ResponseCode.DEFAULT, response.status?.message ?? ResponseMessage.DEFAULT));
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