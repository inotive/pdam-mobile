// ignore_for_file: depend_on_referenced_packages

import 'package:dartz/dartz.dart';
import 'package:pdam_inventory/data/data_source/history_stock_data_source.dart';
import 'package:pdam_inventory/data/mapper/history_stock_mapper.dart';
import 'package:pdam_inventory/data/networks/error_handler.dart';
import 'package:pdam_inventory/data/networks/failure.dart';
import 'package:pdam_inventory/data/networks/network_info.dart';
import 'package:pdam_inventory/domain/model/history_stock_model.dart';
import 'package:pdam_inventory/domain/repository/history_stock_repository.dart';

class HistoryStockRepositoryImpl implements HistoryStockRepository {
  final NetworkInfo _networkInfo;
  final HistoryStockDataSource _historyStockDataSource;

  HistoryStockRepositoryImpl(this._networkInfo, this._historyStockDataSource);

  @override
  Future<Either<Failure, HistoryStock>> historyStock() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _historyStockDataSource.historyStock();

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
