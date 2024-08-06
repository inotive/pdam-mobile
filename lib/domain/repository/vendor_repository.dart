// ignore_for_file: depend_on_referenced_packages

import 'package:dartz/dartz.dart';
import 'package:pdam_inventory/data/networks/failure.dart';
import 'package:pdam_inventory/domain/model/vendor_model.dart';

abstract class VendorRepository {
  Future<Either<Failure, VendorModel>> vendors(Map<String, dynamic> queries);
}
