import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machinetest_web/model/employeemodel.dart';
import 'package:machinetest_web/resources/apiproviders.dart';

class EmployeeController extends GetxController {
  Rx<EmployeeModel?> employeeModel = (null as EmployeeModel?).obs;
  var isLoading = false.obs;

  /// fetching all employee details on initialization
  @override
  void onInit() {
    fetchAllEmployees();
    super.onInit();
  }

///Fetching the employee details
  void fetchAllEmployees() async {
    isLoading.value = true;
    try {
      var emoloyees = await ApiProviders.fetchEmployees();
      if (emoloyees != null) {
        employeeModel.value = emoloyees;
      } else {
        Get.dialog(
          AlertDialog(
            content: const Text('Error fetching employee details'),
            actions: [
              ElevatedButton.icon(
                onPressed: () async {
                  fetchAllEmployees();
                  Get.back(closeOverlays: true);
                },
                label: const Text('Reload'),
                icon: const Icon(Icons.replay_outlined),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      Get.dialog(
        AlertDialog(
          content: const Text('Error fetching employee details'),
          actions: [
            ElevatedButton.icon(
              onPressed: () async {
                fetchAllEmployees();
                Get.back(closeOverlays: true);
              },
              label: const Text('Reload'),
              icon: const Icon(Icons.replay_outlined),
            ),
          ],
        ),
      );
      Get.snackbar("Error getting data. Please try again", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

///Adding the employee details to using api
  Future<void> createEmployee(String name, String age, String salary) async {
    isLoading.value = true;
    try {
      var create = await ApiProviders.createEmployee(name, age, salary);
      if (create != null) {
        Get.snackbar("Added Successfully", "success");

        Get.back(closeOverlays: true);
      } else {
        Get.snackbar("Something went wrong!", "Plase try again");
        Get.dialog(
          AlertDialog(
            content: const Text('Error Adding employee details'),
            actions: [
              ElevatedButton.icon(
                onPressed: () async {
                  await createEmployee(name, age, salary).then(
                    (value) => Get.back(closeOverlays: true),
                  );
                },
                label: const Text('Reload'),
                icon: const Icon(Icons.replay_outlined),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      Get.dialog(
        AlertDialog(
          content: Text('Error Adding employee details : ${e.toString()}'),
          actions: [
            ElevatedButton.icon(
              onPressed: () async {
                await createEmployee(name, age, salary).then(
                  (value) => Get.back(closeOverlays: true),
                );
              },
              label: const Text('Reload'),
              icon: const Icon(Icons.replay_outlined),
            ),
          ],
        ),
      );
      Get.snackbar("Error adding employee", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

///deleting the employee details using delete endpoint
  Future<void> delete(String id) async {
    isLoading.value = true;
    try {
      final del = await ApiProviders.deleteEmployee(id);
      if (del != null) {
        Get.snackbar('Deletion Successful!', 'Employee deleted');
        Get.back(closeOverlays: true);
      } else {
        Get.snackbar('Error deleting employee details', 'Plase try again');
        Get.dialog(
          AlertDialog(
            content: const Text('Error Deleting employee details'),
            actions: [
              ElevatedButton.icon(
                onPressed: () async {
                  await delete(id).then(
                    (value) => Get.back(closeOverlays: true),
                  );
                },
                label: const Text('Reload'),
                icon: const Icon(Icons.replay_outlined),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      Get.snackbar('Error deleting details!', e.toString());
      Get.dialog(
        AlertDialog(
          content: Text('Error deleting employee details : ${e.toString()}'),
          actions: [
            ElevatedButton.icon(
              onPressed: () async {
                await delete(id).then(
                  (value) => Get.back(closeOverlays: true),
                );
              },
              label: const Text('Reload'),
              icon: const Icon(Icons.replay_outlined),
            ),
          ],
        ),
      );
    } finally {
      isLoading.value = false;
    }
  }

/// updating the employee details 
  Future<void> updateEmp(
      String id, String name, String age, String salary) async {
    isLoading.value = true;
    try {
      final update = await ApiProviders.updateEmployee(id, name, age, salary);
      if (update != null) {
        Get.snackbar('Updation Successful!', 'Employee Updated Id; $id');
        Get.back(closeOverlays: true);
      } else {
        Get.dialog(
          AlertDialog(
            content: const Text('Error updating employee details'),
            actions: [
              ElevatedButton.icon(
                onPressed: () async {
                  await updateEmp(id, name, age, salary);
                },
                label: const Text('Reload'),
                icon: const Icon(Icons.replay_outlined),
              ),
            ],
          ),
        );
        Get.snackbar('Error updating employee details', 'Plase try again');
      }
    } catch (e) {
      Get.dialog(
        AlertDialog(
          content: const Text('Error updating employee details'),
          actions: [
            ElevatedButton.icon(
              onPressed: () async {
                await updateEmp(id, name, age, salary);
              },
              label: const Text('Reload'),
              icon: const Icon(Icons.replay_outlined),
            ),
          ],
        ),
      );
      Get.snackbar('Error updating details!', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
