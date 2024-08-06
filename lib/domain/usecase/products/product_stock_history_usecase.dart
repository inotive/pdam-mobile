// ignore_for_file: depend_on_referenced_packages

import 'package:dartz/dartz.dart';
import 'package:pdam_inventory/data/networks/failure.dart';
import 'package:pdam_inventory/domain/model/product_model.dart';
import 'package:pdam_inventory/domain/repository/product_repository.dart';
import 'package:pdam_inventory/domain/usecase/base_usecase.dart';

class ProductStockHistoryUsecase implements BaseUsecase<String, ProductStockHistory> {
  final ProductRepository _productRepository;
  ProductStockHistoryUsecase(this._productRepository);

  @override
  Future<Either<Failure, ProductStockHistory>> execute(String id) {
    return _productRepository.productStockHistory(id);
  }
}
