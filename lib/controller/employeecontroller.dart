import 'package:get/get.dart';
import 'package:machinetest_web/model/employeemodel.dart';
import 'package:machinetest_web/resources/apiproviders.dart';

class EmployeeController extends GetxController {
  Rx<EmployeeModel?> employeeModel = (null as EmployeeModel?).obs;
  var isLoading = false.obs;
  @override
  void onInit() {
    fetchAllEmployees();
    super.onInit();
  }

  void fetchAllEmployees() async {
    isLoading.value = true;
    try {
      var emoloyees = await ApiProviders.fetchEmployees();
      if (emoloyees != null) {
        employeeModel.value = emoloyees;
        print(employeeModel);
      }
    } catch (e) {
      print(e.toString());
      Get.snackbar("Error getting data. Please try again", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> createEmployee(String name, String age, String salary) async {
    isLoading.value = true;
    try {
      var create = await ApiProviders.createEmployee(name, age, salary);
      if (create != null) {
        if (create.isEmpty) {
          Get.snackbar("Added Successfully", "success");
        }
        Get.back();
      } else {
        Get.snackbar("Something went wrong!", "Plase try again");
      }
    } catch (e) {
      print(e.toString());
      Get.snackbar("Error adding employee", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> delete(String id) async {
    isLoading.value = true;
    print('object');
    try {
      final del = await ApiProviders.deleteEmployee(id);
      if (del != null) {
        print('object1');
        Get.snackbar('Deletion Successful!', 'Employee deleted Id; $id');
        
      } else {
        print('object3');
        Get.snackbar('Error deleting employee details', 'Plase try again');
      }
    } catch (e) {
      print('object4');
      Get.snackbar('Error deleting details!', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateEmp(String id,String name,String age,String salary) async {
    isLoading.value = true;
    print('object');
    try {
      final update = await ApiProviders.updateEmployee(id,name,age,salary);
      if (update != null) {
        print('object1');
        Get.snackbar('Updation Successful!', 'Employee Updated Id; $id');
        
      } else {
        print('object3');
        Get.snackbar('Error updating employee details', 'Plase try again');
      }
    } catch (e) {
      print('object4');
      Get.snackbar('Error updating details!', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
