// ignore_for_file: depend_on_referenced_packages

import 'package:dartz/dartz.dart';
import 'package:pdam_inventory/data/networks/failure.dart';
import 'package:pdam_inventory/domain/repository/authentication_repository.dart';
import 'package:pdam_inventory/domain/usecase/base_usecase.dart';

class LogoutUsecase implements BaseUsecase<void, bool> {
  final AuthenticationRepository _authenticationRepository;

  LogoutUsecase(this._authenticationRepository);

  @override
  Future<Either<Failure, bool>> execute(void output) {
    return _authenticationRepository.logout();
  }
}
