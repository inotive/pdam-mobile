// ignore_for_file: depend_on_referenced_packages

import 'package:pdam_inventory/data/networks/failure.dart';
import 'package:dartz/dartz.dart';

abstract class BaseUsecase<In, Out> {
  Future<Either<Failure, Out>> execute(In output);
}
