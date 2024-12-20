// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:pdam_inventory/data/data_source/product_data_source.dart';
import 'package:pdam_inventory/data/mapper/product_mapper.dart';
import 'package:pdam_inventory/data/networks/error_handler.dart';
import 'package:pdam_inventory/data/networks/failure.dart';
import 'package:pdam_inventory/data/networks/network_info.dart';
import 'package:pdam_inventory/domain/model/product_model.dart';
import 'package:pdam_inventory/domain/repository/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDataSource _productDataSource;
  final NetworkInfo _networkInfo;

  ProductRepositoryImpl(
    this._productDataSource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, Product>> products(Map<String, dynamic> queries) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _productDataSource.products(queries);

        if (response.status?.code == ResponseCode.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(
            Failure(
              response.status?.code ?? ResponseCode.DEFAULT,
              response.status?.message ?? ResponseMessage.DEFAULT,
            ),
          );
        }
      } catch (error) {
        log(error.toString());
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, ProductDetail>> productDetail(String id) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _productDataSource.productDetail(id);

        if (response.status?.code == ResponseCode.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(
            Failure(
              response.status?.code ?? ResponseCode.DEFAULT,
              response.status?.message ?? ResponseMessage.DEFAULT,
            ),
          );
        }
      } catch (error) {
        log(error.toString());
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, ProductSummary>> productSummary() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _productDataSource.productSummary();

        if (response.meta?.code == ResponseCode.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(
            Failure(
              response.meta?.code ?? ResponseCode.DEFAULT,
              response.meta?.message ?? ResponseMessage.DEFAULT,
            ),
          );
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, ProductWarehouse>> productWarehouse(String id) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _productDataSource.productWarehouse(id);

        if (response.meta?.code == ResponseCode.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(
            Failure(
              response.meta?.code ?? ResponseCode.DEFAULT,
              response.meta?.message ?? ResponseMessage.DEFAULT,
            ),
          );
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, ProductStockHistory>> productStockHistory(String id) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _productDataSource.productStockHistory(id);

        if (response.meta?.code == ResponseCode.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(
            Failure(
              response.meta?.code ?? ResponseCode.DEFAULT,
              response.meta?.message ?? ResponseMessage.DEFAULT,
            ),
          );
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, ProductByWarehouse>> productByWarehouse(int warehouseId) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _productDataSource.productByWarehouse(warehouseId);

        if (response.status?.code == ResponseCode.SUCCESS) {
          return Right(response.toDomain());
        } else {
          return Left(
            Failure(
              response.status?.code ?? ResponseCode.DEFAULT,
              response.status?.message ?? ResponseMessage.DEFAULT,
            ),
          );
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
