import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';

abstract class BaseUsecase<T> {
  Future<Either<Failure, T>> call();
}
