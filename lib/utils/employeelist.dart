import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machinetest_web/controller/employeecontroller.dart';

class EmployeeList extends GetWidget<EmployeeController> {
  const EmployeeList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Obx(
        () {
          return controller.isLoading.value
              ? Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return const ListTile(
                        title: Text(
                            'controller.employeeModel.value!.data![index].employeeName!'),
                      );
                    },
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: controller.employeeModel.value!.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        title: Text(controller
                            .employeeModel.value!.data![index].employeeName!),
                      );
                    },
                  ),
                );
        },
      ),
    );
  }
}
