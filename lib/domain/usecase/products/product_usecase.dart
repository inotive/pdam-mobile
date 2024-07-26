// ignore: depend_on_referenced_packages
import 'package:dartz/dartz.dart';
import 'package:pdam_inventory/data/networks/failure.dart';
import 'package:pdam_inventory/domain/model/product_model.dart';
import 'package:pdam_inventory/domain/repository/product_repository.dart';
import 'package:pdam_inventory/domain/usecase/base_usecase.dart';

class ProductUsecase implements BaseUsecase<Map<String, dynamic>, Product> {
  final ProductRepository _productRepository;
  ProductUsecase(this._productRepository);

  @override
  Future<Either<Failure, Product>> execute(Map<String, dynamic> queries) {
    return _productRepository.products(queries);
  }
}
