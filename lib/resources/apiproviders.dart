import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:machinetest_web/model/employeemodel.dart';
import 'package:machinetest_web/resources/secrets.dart';

class ApiProviders {
  static Future<EmployeeModel?> fetchEmployees() async {
    var response = await http
        .get(Uri.parse('${Secrets.baseUrl}${Secrets.allEmployeesUrl}'));
    if (response.statusCode == 200) {
      var json = response.body;
      return EmployeeModel.fromJson(jsonDecode(json));
    } else {
      print('Error response ${response.body}');
    }
    return null;
  }

  // static Future<void> createEmployee(String name,String age,String salary)async{
  //   var response=await http.post(Uri.parse('${Secrets.baseUrl}${Secrets.createEmployee}'));
  // }
}
