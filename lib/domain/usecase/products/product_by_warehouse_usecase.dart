// ignore: depend_on_referenced_packages
import 'package:dartz/dartz.dart';
import 'package:pdam_inventory/data/networks/failure.dart';
import 'package:pdam_inventory/domain/model/product_model.dart';
import 'package:pdam_inventory/domain/repository/product_repository.dart';
import 'package:pdam_inventory/domain/usecase/base_usecase.dart';

class ProductByWarehouseUsecase implements BaseUsecase<int, ProductByWarehouse> {
  final ProductRepository _productRepository;
  ProductByWarehouseUsecase(this._productRepository);

  @override
  Future<Either<Failure, ProductByWarehouse>> execute(int warehouseId) async {
    return _productRepository.productByWarehouse(warehouseId);
  }
}
