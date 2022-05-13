import 'package:dartz/dartz.dart';
import 'package:test_auth/app/core/failure.dart';
import 'package:test_auth/app/core/use_case.dart';
import 'package:test_auth/app/domain/repository/auth_repository.dart';

class Login extends UseCase<String, LoginParams> {
  final AuthRepository repository;

  Login(this.repository);

  @override
  Future<Either<Failure, String>> call(LoginParams params) {
    return repository.login(params);
  }
}

class LoginParams {
  final String email;
  final String password;

  LoginParams({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}
