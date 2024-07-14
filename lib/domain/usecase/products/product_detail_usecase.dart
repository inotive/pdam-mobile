// ignore: depend_on_referenced_packages
import 'package:dartz/dartz.dart';
import 'package:pdam_inventory/data/networks/failure.dart';
import 'package:pdam_inventory/domain/model/product_model.dart';
import 'package:pdam_inventory/domain/repository/product_repository.dart';
import 'package:pdam_inventory/domain/usecase/base_usecase.dart';

class ProductDetailUsecase implements BaseUsecase<int, ProductDetail> {
  final ProductRepository _productRepository;
  ProductDetailUsecase(this._productRepository);

  @override
  Future<Either<Failure, ProductDetail>> execute(int id) {
    return _productRepository.productDetail(id);
  }
}
