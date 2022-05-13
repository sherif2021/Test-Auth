import 'package:get/get.dart';
import 'package:test_auth/app/data/datasource/remote/auth_remote_data_soure.dart';
import 'package:test_auth/app/data/datasource/repository/auth_reposirtory_imp.dart';
import 'package:test_auth/app/domain/repository/auth_repository.dart';
import 'package:test_auth/app/domain/use_case/register.dart';
import 'package:test_auth/app/modules/register/controllers/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(
      () => RegisterController(),
    );
    Get.lazyPut<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImp(),
    );
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImp(Get.find()),
    );
    Get.lazyPut(
      () => Register(Get.find()),
    );
  }
}
