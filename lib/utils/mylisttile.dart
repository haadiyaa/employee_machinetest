import 'package:flutter/material.dart';
import 'package:machinetest_web/resources/appclass.dart';
import 'package:machinetest_web/resources/appcolors.dart';

class MyListTile extends StatelessWidget {
  const MyListTile({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: AppClass.items[index],
      ),
    );
  }
}
