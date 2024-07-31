import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machinetest_web/controller/employeecontroller.dart';
import 'package:machinetest_web/resources/appclass.dart';
import 'package:machinetest_web/resources/appcolors.dart';
import 'package:machinetest_web/resources/mytextstyles.dart';
import 'package:machinetest_web/resources/validators.dart';
import 'package:machinetest_web/utils/mytextfield.dart';

class EmployeeProfileAlert extends GetWidget<EmployeeController> {
  const EmployeeProfileAlert({
    required this.id,
    super.key,
    required this.enabled,
    required this.name,
    required this.age,
    required this.salary,
  });

  final bool enabled;
  final TextEditingController name;
  final TextEditingController age;
  final TextEditingController salary;
  final String id;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          const Expanded(
            flex: 9,
            child: Text('Profile Details', style: MyTextStyles.boldtext),
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
        width: AppClass.getMqWidth(context) * 0.4,
        height: AppClass.getMqHeight(context) * 0.5,
        child: Column(
          children: [
            MyTextField(
              validator: (value) {
                return Validators.nameValidator(value);
              },
              enabled: enabled,
              text: 'Name',
              textEditingController: name,
            ),
            MyTextField(
              validator: (value) {
                return Validators.ageValidator(value);
              },
              enabled: enabled,
              text: 'Age',
              textEditingController: age,
            ),
            MyTextField(
              validator: (value) {
                return Validators.salaryValidator(value);
              },
              enabled: enabled,
              text: 'Salary',
              textEditingController: salary,
            ),
          ],
        ),
      ),
      actions: [
        Obx(() {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 10,
              foregroundColor: AppColors.bgColor,
              backgroundColor: AppColors.red,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            ),
            child: controller.isLoading.value
                ? CircularProgressIndicator(
                    color: AppColors.white,
                  )
                : const Text('Delete'),
            onPressed: () async {
              await controller.delete(id);
            },
          );
        }),
        Obx(
          () {
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 10,
                foregroundColor: AppColors.bgColor,
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              child: controller.isLoading.value
                  ? CircularProgressIndicator(
                      color: AppColors.white,
                    )
                  : const Text('Update'),
              onPressed: () async {
                await controller.updateEmp(
                    id, name.text.trim(), age.text.trim(), salary.text.trim());
              },
            );
          },
        ),
      ],
    );
  }
}
