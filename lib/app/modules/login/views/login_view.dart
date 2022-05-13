import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_auth/app/core/widget/CustomTextFormField.dart';
import 'package:test_auth/app/core/widget/loading_button.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Image.asset(
                  'assets/images/logo.jpg',
                  height: 150,
                  width: 150,
                ),
                const SizedBox(
                  height: 20,
                ),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: 'You\'re in the right place ',
                        style: Get.textTheme.bodyMedium),
                    TextSpan(
                        text: 'JOIN US',
                        style: TextStyle(color: Get.theme.primaryColor))
                  ]),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextFormFiled(
                    prefixIcon: const Icon(Icons.email),
                    label: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    onChange: (v) => controller.email = v),
                const SizedBox(
                  height: 20,
                ),
                ValueBuilder<bool?>(
                  initialValue: true,
                  builder: (value, update) => CustomTextFormFiled(
                    label: 'Password',
                    obscureText: value!,
                    onChange: (v) => controller.password = v,
                    keyboardType: TextInputType.visiblePassword,
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: value == false
                          ? const Icon(Icons.remove_red_eye)
                          : const Icon(Icons.visibility_off_outlined),
                      onPressed: () => update(!value),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Obx(
                  () => LoadingButton(
                    text: 'Login',
                    isLoading: controller.isLoading,
                    onClick: controller.login,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
