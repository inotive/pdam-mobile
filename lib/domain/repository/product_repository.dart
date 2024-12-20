// ignore_for_file: depend_on_referenced_packages

import 'package:dartz/dartz.dart';
import 'package:pdam_inventory/data/networks/failure.dart';
import 'package:pdam_inventory/domain/model/product_model.dart';

abstract class ProductRepository {
  Future<Either<Failure, Product>> products(Map<String, dynamic> queries);
  Future<Either<Failure, ProductSummary>> productSummary();
  Future<Either<Failure, ProductDetail>> productDetail(String id);
  Future<Either<Failure, ProductWarehouse>> productWarehouse(String id);
  Future<Either<Failure, ProductStockHistory>> productStockHistory(String id);
  Future<Either<Failure, ProductByWarehouse>> productByWarehouse(int warehouseId);
}
