import 'package:dartz/dartz.dart';
import 'package:pdam_inventory/data/networks/failure.dart';
import 'package:pdam_inventory/domain/model/product_model.dart';
import 'package:pdam_inventory/domain/repository/product_repository.dart';
import 'package:pdam_inventory/domain/usecase/base_usecase.dart';

class ProductWarehouseUsecase implements BaseUsecase<int, ProductWarehouse> {
  final ProductRepository _productRepository;
  ProductWarehouseUsecase(this._productRepository);

  @override
  Future<Either<Failure, ProductWarehouse>> execute(int id) {
    return _productRepository.productWarehouse(id);
  }
}