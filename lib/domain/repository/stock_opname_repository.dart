// ignore: depend_on_referenced_packages
import 'package:dartz/dartz.dart';
import 'package:pdam_inventory/data/networks/failure.dart';
import 'package:pdam_inventory/domain/model/stock_opname_model.dart';

abstract class StockOpnameRepository {
  Future<Either<Failure, StockOpname>> stockOpname(Map<String, dynamic> queries);
  Future<Either<Failure, StockOpnameDetail>> stockOpnameDetail(String id);
}
