// ignore: depend_on_referenced_packages
import 'package:dartz/dartz.dart';
import 'package:pdam_inventory/data/networks/failure.dart';
import 'package:pdam_inventory/domain/model/history_stock_model.dart';
import 'package:pdam_inventory/domain/repository/history_stock_repository.dart';
import 'package:pdam_inventory/domain/usecase/base_usecase.dart';

class HistoryStockUsecase implements BaseUsecase<void, HistoryStock> {
  final HistoryStockRepository _historyStockRepository;
  HistoryStockUsecase(this._historyStockRepository);

  @override
  Future<Either<Failure, HistoryStock>> execute(void output) {
    return _historyStockRepository.historyStock();
  }
}
