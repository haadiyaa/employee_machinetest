import 'dart:convert';

import 'package:get/get.dart';
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
      return null;
    }
  }

  static Future<http.Response?> createEmployee(
      String name, String age, String salary) async {
    var response = await http.post(
      Uri.parse('${Secrets.baseUrl}${Secrets.createEmployee}'),
      body: {
        "name": name,
        "salary": salary,
        "age": age,
      },
    );
    if (response.statusCode == 200) {
      print(response.body);
      return response;
    } else {
      print('Error creating employee');
      return null;
    }
  }

  static Future<http.Response?> deleteEmployee(String id) async {
    var response = await http
        .delete(Uri.parse('${Secrets.baseUrl}${Secrets.deleteEmployee}$id'));
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body);
      return response;
    } else {
      print('null');
      return null;
    }
  }

  static Future<http.Response?> updateEmployee(
      String id, String name, String age, String salary) async {
    var response = await http.put(
        Uri.parse('${Secrets.baseUrl}${Secrets.updateEmployee}$id'),
        body: {
          "name": name,
          "age": age,
          "salary": salary,
        });
    if (response.statusCode == 200) {
      return response;
    } else {
      print('null ${response.statusCode}');
      return null;
    }
  }
}
