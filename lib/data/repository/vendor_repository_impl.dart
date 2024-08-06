// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:pdam_inventory/data/data_source/vendor_data_source.dart';
import 'package:pdam_inventory/data/mapper/vendor_mapper.dart';
import 'package:pdam_inventory/data/networks/error_handler.dart';
import 'package:pdam_inventory/data/networks/failure.dart';
import 'package:pdam_inventory/data/networks/network_info.dart';
import 'package:pdam_inventory/domain/model/vendor_model.dart';
import 'package:pdam_inventory/domain/repository/vendor_repository.dart';

class VendorRepositoryImpl implements VendorRepository {
  VendorRepositoryImpl(this._networkInfo, this._vendorDataSource);

  final VendorDataSource _vendorDataSource;
  final NetworkInfo _networkInfo;

  @override
  Future<Either<Failure, VendorModel>> vendors(Map<String, dynamic> queries) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _vendorDataSource.vendors(queries);

        if (response.status?.code == ResponseCode.SUCCESS) {
          return Right(response.toDomain());
        } else {
          log(response.status?.message ?? '');
          return Left(Failure(
              response.status?.code ?? ResponseCode.DEFAULT, response.status?.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        log(error.toString());
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
