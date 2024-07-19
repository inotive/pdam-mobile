// ignore: depend_on_referenced_packages
import 'package:dartz/dartz.dart';
import 'package:pdam_inventory/data/networks/failure.dart';
import 'package:pdam_inventory/domain/model/product_model.dart';
import 'package:pdam_inventory/domain/repository/product_repository.dart';
import 'package:pdam_inventory/domain/usecase/base_usecase.dart';

class ProductSummaryUsecase implements BaseUsecase<void, ProductSummary> {
  final ProductRepository _productRepository;
  ProductSummaryUsecase(this._productRepository);

  @override
  Future<Either<Failure, ProductSummary>> execute(void output) {
    return _productRepository.productSummary();
  }
}
