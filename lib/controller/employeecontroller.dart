import 'package:get/get.dart';
import 'package:machinetest_web/model/employeemodel.dart';
import 'package:machinetest_web/resources/apiproviders.dart';

class EmployeeController extends GetxController {
  Rx<EmployeeModel?> employeeModel =(null as EmployeeModel?).obs;
  var isLoading = false.obs;
  @override
  void onInit() {
    fetchAllEmployees();
    super.onInit();
  }

  void fetchAllEmployees() async {
    isLoading.value=true;
    try {
      var emoloyees = await ApiProviders.fetchEmployees();
      if (emoloyees != null) {
        employeeModel.value=emoloyees;
        print(employeeModel);
      }
    } catch (e) {
      print(e.toString());
    }
    finally{
      isLoading.value=false;
    }
  }
}
