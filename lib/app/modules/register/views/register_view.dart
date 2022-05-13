import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                  prefixIcon: const Icon(Icons.email),
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
              Row(
                children: const [
                  Text(
                    'Talents : ',
                    style: TextStyle(fontSize: 22),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 200,
                width: double.infinity,
                child: ValueBuilder<List<String>?>(
                  initialValue: controller.talents,
                  onUpdate: (v) => controller.talents = v ?? [],
                  builder: (value, update) => GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 3),
                    itemCount: controller.allTalents.length,
                    itemBuilder: (_, index) {
                      final talent = controller.allTalents[index];
                      return CheckboxListTile(
                        title: Text(talent),
                        value: value?.contains(talent),
                        onChanged: (v) {
                          if (value?.contains(talent) == true) {
                            value?.remove(talent);
                          } else {
                            value?.add(talent);
                          }
                          update(List.of(value ?? []));
                        },
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Obx(
                () => LoadingButton(
                  text: 'Register',
                  isLoading: controller.isLoading,
                  onClick: controller.register,
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
