// ignore_for_file: depend_on_referenced_packages

import 'package:dartz/dartz.dart';
import 'package:pdam_inventory/data/networks/failure.dart';
import 'package:pdam_inventory/domain/model/stock_opname_model.dart';
import 'package:pdam_inventory/domain/repository/stock_opname_repository.dart';
import 'package:pdam_inventory/domain/usecase/base_usecase.dart';

class StockOpnameDetailUsecase implements BaseUsecase<String, StockOpnameDetail> {
  final StockOpnameRepository _stockOpnameRepository;

  StockOpnameDetailUsecase(this._stockOpnameRepository);

  @override
  Future<Either<Failure, StockOpnameDetail>> execute(String id) {
    return _stockOpnameRepository.stockOpnameDetail(id);
  }
}
