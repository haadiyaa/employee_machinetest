import 'package:flutter/material.dart';
import 'package:machinetest_web/utils/employeelist.dart';
import 'package:machinetest_web/utils/mycalendar.dart';
import 'package:machinetest_web/view/dashboard/dashboardweb.dart';

class AppClass {
  static List<Widget> items = [
    const EmployeeList(),
    const AddEmployee(),
    const MyCalendar(),
    const MyCalendar(),
  ];
  static List<Widget> itemsMobile = [
    const EmployeeList(),
    const AddEmployee(),
    const MyCalendar(),
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
