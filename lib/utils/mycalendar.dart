
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class MyCalendar extends StatelessWidget {
  const MyCalendar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: TableCalendar(
        focusedDay: DateTime.now(),
        firstDay: DateTime.utc(2010, 3, 14),
        lastDay: DateTime.utc(2050, 12, 30),
      ),
    );
  }
}