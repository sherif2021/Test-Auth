import 'package:test_auth/app/core/constants.dart';
import 'package:test_auth/app/core/exception.dart';

abstract class AuthRemoteDataSource {
  Future<String> login(Map<String, dynamic> json);

  Future<bool> register(Map<String, dynamic> json);
}

class AuthRemoteDataSourceImp extends AuthRemoteDataSource {
  @override
  Future<String> login(Map<String, dynamic> json) async {
    final result = await dio.post('/signin', data: json);
    final token = result.data['token'];

    if (token != null) {
      return token;
    } else {
      throw CustomException(result.data['message'] ?? result.data['error'].toString());
    }
  }

  @override
  Future<bool> register(Map<String, dynamic> json) async {
    final result = await dio.post('/talented_reg', data: json);
    final isSuccess = result.data['message'] == 'success';
    if (isSuccess) {
      return isSuccess;
    } else {
      throw CustomException(result.data['message'] ?? result.data['errors'].toString());
    }
  }
}
