import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_auth/app/core/failure.dart';
import 'package:test_auth/app/core/routes/app_pages.dart';
import 'package:test_auth/app/domain/use_case/login.dart';

class LoginController extends GetxController {
  final _login = Get.find<Login>();

  final _isLoading = Rx(false);

  bool get isLoading => _isLoading.value;
  String? email, password;

  void login() async {
    String? error;
    if (email == null || !email!.isEmail) {
      error = 'Email is not enough';
    } else if (password == null || password!.length < 6) {
      error = "Password is not enough";
    }
    if (error != null) {
      _handleFailure(CustomFailure(error));
    } else {
      _isLoading.value = true;
      (await _login(LoginParams(email: email!, password: password!)))
          .fold(_handleFailure, (r) {
        Get.snackbar('Success', 'Login Success',
            snackPosition: SnackPosition.TOP,
            colorText: Colors.white,
            backgroundColor: Colors.green);
        Get.offAllNamed(Routes.HOME);
      });
      _isLoading.value = false;
    }
  }

  void _handleFailure(Failure failure) {
    Get.snackbar(
        'Error', failure is CustomFailure ? failure.message : 'Unknown Error',
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        backgroundColor: Colors.red);
  }
}
