// ignore_for_file: depend_on_referenced_packages

import 'package:dartz/dartz.dart';
import 'package:pdam_inventory/data/networks/failure.dart';
import 'package:pdam_inventory/data/requests/create_stock_opname_request.dart';
import 'package:pdam_inventory/domain/repository/stock_opname_repository.dart';
import 'package:pdam_inventory/domain/usecase/base_usecase.dart';
import 'package:pdam_inventory/domain/usecase/inputs/stock_opname_input.dart';

class StockOpnameCreateUsecase implements BaseUsecase<StockOpnameInput, bool> {
  StockOpnameCreateUsecase(this._stockOpnameRepository);

  final StockOpnameRepository _stockOpnameRepository;

  @override
  Future<Either<Failure, bool>> execute(StockOpnameInput output) {
    return _stockOpnameRepository.createStockOpname(
      CreateStockOpnameRequest(
        output.warehouseId,
        output.opnameNumber,
        output.date,
        output.description,
        output.products,
      ),
    );
  }
}
