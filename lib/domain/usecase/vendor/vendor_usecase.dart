import 'package:dartz/dartz.dart';
import 'package:pdam_inventory/data/networks/failure.dart';
import 'package:pdam_inventory/domain/model/vendor_model.dart';
import 'package:pdam_inventory/domain/repository/vendor_repository.dart';
import 'package:pdam_inventory/domain/usecase/base_usecase.dart';

class VendorUsecase implements BaseUsecase<Map<String, dynamic>, VendorModel> {
  VendorUsecase(this._vendorRepository);

  final VendorRepository _vendorRepository;

  @override
  Future<Either<Failure, VendorModel>> execute(Map<String, dynamic> queries) {
    return _vendorRepository.vendors(queries);
  }
}
