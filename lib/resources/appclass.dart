import 'package:flutter/material.dart';
import 'package:machinetest_web/utils/employeelist.dart';
import 'package:machinetest_web/utils/mycalendar.dart';
import 'package:machinetest_web/view/dashboard/dashboardweb.dart';

class AppClass {
  static List<Widget> items = [
    EmployeeList(),
    AddEmployee(),
    MyCalendar(),
    MyCalendar(),
  ];
  static List<Widget> itemsMobile = [
    EmployeeList(),
    AddEmployee(),
    MyCalendar(),
  ];
  static const List<Widget> itemsWeb = [
    EmployeeList(),
    MyCalendar(),
  ];

  static getMqWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static getMqHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
