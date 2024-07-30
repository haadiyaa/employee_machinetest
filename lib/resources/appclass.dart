import 'package:flutter/material.dart';
import 'package:machinetest_web/utils/employeelist.dart';
import 'package:machinetest_web/utils/mycalendar.dart';

class AppClass {
  static const List<Widget> items=[
    EmployeeList(),
    MyCalendar(),
    // MyCalendar(),
    MyCalendar(),
    MyCalendar(),
  ];
  static const List<Widget> itemsWeb=[
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