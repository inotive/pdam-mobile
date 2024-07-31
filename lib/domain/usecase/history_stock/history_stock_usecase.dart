// ignore: depend_on_referenced_packages
import 'package:dartz/dartz.dart';
import 'package:pdam_inventory/data/networks/failure.dart';
import 'package:pdam_inventory/domain/model/history_stock_model.dart';
import 'package:pdam_inventory/domain/repository/history_stock_repository.dart';
import 'package:pdam_inventory/domain/usecase/base_usecase.dart';

class HistoryStockUsecase implements BaseUsecase<Map<String, dynamic>, HistoryStock> {
  final HistoryStockRepository _historyStockRepository;
  HistoryStockUsecase(this._historyStockRepository);

  @override
  Future<Either<Failure, HistoryStock>> execute(Map<String, dynamic> output) {
    return _historyStockRepository.historyStock(output);
  }
}
