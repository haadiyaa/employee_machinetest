import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machinetest_web/controller/employeecontroller.dart';
import 'package:machinetest_web/resources/appclass.dart';
import 'package:machinetest_web/resources/appcolors.dart';
import 'package:machinetest_web/resources/mytextstyles.dart';
import 'package:machinetest_web/resources/validators.dart';
import 'package:machinetest_web/utils/mytextfield.dart';

class DialogAlert extends GetWidget<EmployeeController> {
  const DialogAlert({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.nameController,
    required this.ageController,
    required this.salaryController,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController nameController;
  final TextEditingController ageController;
  final TextEditingController salaryController;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      title: Row(
        children: [
          const Expanded(
            flex: 9,
            child: Text("Add Employee", style: MyTextStyles.boldtext),
          ),
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      content: SizedBox(
        width: AppClass.getMqWidth(context) * 0.6,
        height: AppClass.getMqHeight(context) * 0.5,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              MyTextField(
                text: 'Name of the Employee',
                textEditingController: nameController,
                validator: (value) {
                  return Validators.nameValidator(value);
                },
              ),
              MyTextField(
                text: 'Age of the Employee',
                textEditingController: ageController,
                validator: (value) {
                  return Validators.ageValidator(value);
                },
              ),
              MyTextField(
                text: 'Salary of the Employee',
                textEditingController: salaryController,
                validator: (value) {
                  return Validators.salaryValidator(value);
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        Obx(
          () {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: AppColors.bgColor,
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  await controller.createEmployee(
                    nameController.text.trim(),
                    ageController.text.trim(),
                    salaryController.text.trim(),
                  );
                }
              },
              child: controller.isLoading.value
                  ? CircularProgressIndicator(
                      color: AppColors.white,
                    )
                  : const Text('Okay'),
            );
          },
        )
      ],
    );
  }
}
