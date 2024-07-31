import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:machinetest_web/model/employeemodel.dart';
import 'package:machinetest_web/resources/secrets.dart';

class ApiProviders {

  /// fetch all employee api call
  static Future<EmployeeModel?> fetchEmployees() async {
    var response = await http
        .get(Uri.parse('${Secrets.baseUrl}${Secrets.allEmployeesUrl}'));
    if (response.statusCode == 200) {
      var json = response.body;
      return EmployeeModel.fromJson(jsonDecode(json));
    } else {
      return null;
    }
  }

/// create employee api call
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
      return response;
    } else {
      return null;
    }
  }

/// delete an employee api call
  static Future<http.Response?> deleteEmployee(String id) async {
    var response = await http
        .delete(Uri.parse('${Secrets.baseUrl}${Secrets.deleteEmployee}$id'));
    if (response.statusCode == 200) {
      return response;
    } else {
      return null;
    }
  }

/// update an existing employee details
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
      return null;
    }
  }
}
