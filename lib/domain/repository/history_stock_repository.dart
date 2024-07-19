// ignore_for_file: depend_on_referenced_packages

import 'package:dartz/dartz.dart';

import 'package:pdam_inventory/data/networks/failure.dart';
import 'package:pdam_inventory/domain/model/history_stock_model.dart';

abstract class HistoryStockRepository {
  Future<Either<Failure, HistoryStock>> historyStock();
}
