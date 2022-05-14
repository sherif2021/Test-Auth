import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_auth/app/core/routes/app_pages.dart';
import 'package:test_auth/app/core/widget/CustomTextFormField.dart';
import 'package:test_auth/app/core/widget/loading_button.dart';
import 'package:test_auth/app/modules/register/controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
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
                  prefixIcon: const Icon(Icons.person),
                  label: 'Name',
                  keyboardType: TextInputType.name,
                  onChange: (v) => controller.name = v),
              const SizedBox(
                height: 30,
              ),
              CustomTextFormFiled(
                  prefixIcon: const Icon(Icons.phone),
                  label: 'Phone',
                  keyboardType: TextInputType.phone,
                  onChange: (v) => controller.phone = v),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ValueBuilder<String?>(
                  onUpdate: (v) => controller.gender = v,
                  builder: (value, update) => DropdownButton(
                      isExpanded: true,
                      hint: const Text('Gender'),
                      value: value,
                      items: ['Male', 'Female']
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e),
                              ))
                          .toList(),
                      onChanged: update),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                minWidth: 200,
                onPressed: () =>
                    Get.toNamed(Routes.TALENTS, arguments: controller),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text(
                    'Next',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
