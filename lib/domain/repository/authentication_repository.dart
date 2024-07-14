// ignore_for_file: depend_on_referenced_packages

import 'package:pdam_inventory/data/networks/failure.dart';
import 'package:pdam_inventory/data/requests/login_request.dart';
import 'package:dartz/dartz.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, bool>> login(LoginRequest request);
}
