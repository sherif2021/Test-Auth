import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_auth/app/core/widget/loading_button.dart';
import 'package:test_auth/app/modules/register/controllers/register_controller.dart';

class TalentsView extends StatelessWidget {
  final RegisterController controller;

  const TalentsView({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Talents'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ValueBuilder<List<String>?>(
              initialValue: controller.talents,
              onUpdate: (v) => controller.talents = v ?? [],
              builder: (value, update) => ListView.builder(
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
              text: 'SIGN UP',
              isLoading: controller.isLoading,
              onClick: controller.register,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
