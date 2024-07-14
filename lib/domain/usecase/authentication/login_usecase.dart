// ignore_for_file: depend_on_referenced_packages

import 'package:dartz/dartz.dart';
import 'package:pdam_inventory/data/networks/failure.dart';
import 'package:pdam_inventory/data/requests/login_request.dart';
import 'package:pdam_inventory/domain/repository/authentication_repository.dart';
import 'package:pdam_inventory/domain/usecase/base_usecase.dart';
import 'package:pdam_inventory/domain/usecase/inputs/login_input.dart';

class LoginUsecase implements BaseUsecase<LoginInput, bool> {
  final AuthenticationRepository _authenticationRepository;

  LoginUsecase(this._authenticationRepository);

  @override
  Future<Either<Failure, bool>> execute(LoginInput output) {
    return _authenticationRepository.login(
      LoginRequest(
        output.username,
        output.password,
      ),
    );
  }
}
