import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machinetest_web/controller/employeecontroller.dart';
import 'package:machinetest_web/model/employeemodel.dart';
import 'package:machinetest_web/resources/appcolors.dart';
import 'package:machinetest_web/utils/employeeprofilealert.dart';
import 'package:shimmer/shimmer.dart';

class EmployeeList extends GetWidget<EmployeeController> {
  const EmployeeList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Obx(
        () {
          return controller.isLoading.value || controller.employeeModel == null
              ? Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>const SizedBox(height: 4,),
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return Shimmer.fromColors(
                        baseColor: AppColors.bgColor,
                        highlightColor: AppColors.white,
                        child: Container(
                          color: AppColors.white,
                          child: const ListTile(
                            title: Text(
                                'controller.employeeModel.value!.data![index].employeeName!'),
                          ),
                        ),
                      );
                    },
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: controller.employeeModel.value!.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        onTap: () {
                          myDialog(context,
                              controller.employeeModel.value!.data![index]);
                        },
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

  myDialog(BuildContext context, Data data) {
    const enabled = true;
    final TextEditingController name =
        TextEditingController(text: data.employeeName);
    final TextEditingController salary =
        TextEditingController(text: data.employeeSalary.toString());
    final TextEditingController age =
        TextEditingController(text: data.employeeAge.toString());
    return showDialog(
      context: context,
      builder: (context) {
        return EmployeeProfileAlert(
          id: data.id.toString(),
          enabled: enabled,
          name: name,
          age: age,
          salary: salary,
        );
      },
    );
  }
}
