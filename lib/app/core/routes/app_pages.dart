import 'package:get/get.dart';
import 'package:test_auth/app/modules/auth_home/views/auth_home_view.dart';
import 'package:test_auth/app/modules/home/bindings/home_binding.dart';
import 'package:test_auth/app/modules/home/views/home_view.dart';
import 'package:test_auth/app/modules/login/bindings/login_binding.dart';
import 'package:test_auth/app/modules/login/views/login_view.dart';
import 'package:test_auth/app/modules/register/bindings/register_binding.dart';
import 'package:test_auth/app/modules/register/views/register_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.AUTH_HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
      transition: Transition.leftToRight,
    ),
    GetPage(
        name: _Paths.AUTH_HOME,
        page: () => const AuthHomeView(),
        transition: Transition.leftToRight),
  ];
}
