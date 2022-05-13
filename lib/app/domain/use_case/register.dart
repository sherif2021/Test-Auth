import 'package:dartz/dartz.dart';
import 'package:test_auth/app/core/failure.dart';
import 'package:test_auth/app/core/use_case.dart';
import 'package:test_auth/app/domain/repository/auth_repository.dart';

class Register extends UseCase<bool, RegisterParams> {
  final AuthRepository repository;

  Register(this.repository);

  @override
  Future<Either<Failure, bool>> call(RegisterParams params) {
    return repository.register(params);
  }
}

class RegisterParams {
  final String fullName;
  final String email;
  final String phone;
  final String password;
  final String gender;
  final List<String> talents;

  const RegisterParams({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.password,
    required this.gender,
    required this.talents,
  });

  Map<String, dynamic> toJson() {
    return {
      'full_name': fullName,
      'email': email,
      'phone': phone,
      'password': password,
      'gender': gender,
      'talents': talents,
    };
  }
}
