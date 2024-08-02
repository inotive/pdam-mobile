// ignore: depend_on_referenced_packages
import 'package:dartz/dartz.dart';
import 'package:pdam_inventory/data/networks/failure.dart';
import 'package:pdam_inventory/data/requests/update_user_request.dart';
import 'package:pdam_inventory/domain/repository/authentication_repository.dart';
import 'package:pdam_inventory/domain/usecase/base_usecase.dart';
import 'package:pdam_inventory/domain/usecase/inputs/update_user_input.dart';

class UpdateUserUsecase implements BaseUsecase<UpdateUserInput, bool> {
  final AuthenticationRepository _authenticationRepository;
  UpdateUserUsecase(this._authenticationRepository);

  @override
  Future<Either<Failure, bool>> execute(UpdateUserInput input) async {
    return await _authenticationRepository.updateUser(
      UpdateUserRequest(
        input.name,
        input.password,
        input.noTelp,
        input.file,
      ),
    );
  }
}
