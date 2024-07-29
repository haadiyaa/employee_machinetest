import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:machinetest_web/model/employeemodel.dart';
import 'package:machinetest_web/resources/secrets.dart';

class EmployeeController extends GetxController {
  var employeeModel=<Data>[].obs;
  
  void fetchAllEmployees()async{
    try {
      final response=await http.get(Uri.parse('${Secrets.baseUrl}${Secrets.allEmployeesUrl}'));
      final data=jsonDecode(response.body);
      if (response.statusCode==200) {
        // employeeModel.value=Data.fromJson(data);
        print(employeeModel.value);
      } else {
        print(employeeModel.value);
        print('error');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}