import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_auth/app/core/failure.dart';
import 'package:test_auth/app/domain/use_case/register.dart';

class RegisterController extends GetxController {
  final _register = Get.find<Register>();

  final _isLoading = Rx(false);

  bool get isLoading => _isLoading.value;

  String? name, phone, gender, email, password;

  List<String> talents = [];

  final allTalents = [
    'Actor',
    'Photographer',
    'Graphic Designer',
    'Art Director',
    'Stylist & Fashion',
    'Makeup Artist',
    'Football Player',
    'Journalist',
    'Model',
    'Producer',
    'Director',
    'Videographer',
    'Editor',
    'Singer',
    'Colorist',
    'Sound Engineer',
    'Writer',
    'Production Manager',
    'Voice Over',
    'Other'
  ];

  void register() async {
    String? error;
    if (name == null || name!.length < 3) {
      error = "Name is not enough";
    } else if (phone == null || phone!.length < 7) {
      error = "Phone is not enough";
    }
    if (gender == null) {
      error = "Gender is not enough";
    } else if (email == null || !email!.isEmail) {
      error = 'Email is not enough';
    } else if (password == null || password!.length < 6) {
      error = "Password is not enough";
    }
    if (error != null) {
      _handleFailure(CustomFailure(error));
    } else {
      _isLoading.value = true;
      (await _register(
        RegisterParams(
            email: email!,
            password: password!,
            talents: talents,
            fullName: name!,
            gender: gender!,
            phone: phone!),
      ))
          .fold(_handleFailure, (r) {
        Get.back();
        Get.snackbar('Success', 'Register Success',
            snackPosition: SnackPosition.TOP,
            colorText: Colors.white,
            backgroundColor: Colors.green);
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
