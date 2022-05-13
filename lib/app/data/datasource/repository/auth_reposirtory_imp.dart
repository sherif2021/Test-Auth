import 'package:dartz/dartz.dart';
import 'package:test_auth/app/core/exception.dart';
import 'package:test_auth/app/core/failure.dart';
import 'package:test_auth/app/data/datasource/remote/auth_remote_data_soure.dart';
import 'package:test_auth/app/domain/repository/auth_repository.dart';
import 'package:test_auth/app/domain/use_case/login.dart';
import 'package:test_auth/app/domain/use_case/register.dart';

class AuthRepositoryImp extends AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImp(this.authRemoteDataSource);

  @override
  Future<Either<Failure, String>> login(LoginParams loginParams) async {
    try {
      final result = await authRemoteDataSource.login(loginParams.toJson());
      return Right(result);
    } catch (e) {
      return Left(
          e is CustomException ? CustomFailure(e.message) : UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> register(RegisterParams registerParams) async {
    try {
      final result =
          await authRemoteDataSource.register(registerParams.toJson());
      return Right(result);
    } catch (e) {
      return Left(
          e is CustomException ? CustomFailure(e.message) : UnknownFailure());
    }
  }
}
