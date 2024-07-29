import 'package:flutter/material.dart';


class EmployeeList extends StatelessWidget {
  const EmployeeList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Expanded(
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            return const ListTile(
              title: Text('data'),
            );
          },
        ),
      ),
    );
  }
}
