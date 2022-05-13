import 'package:dartz/dartz.dart';
import 'package:test_auth/app/core/failure.dart';
import 'package:test_auth/app/domain/use_case/login.dart';
import 'package:test_auth/app/domain/use_case/register.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> register(RegisterParams registerParams);

  Future<Either<Failure, String>> login(LoginParams loginParams);
}
