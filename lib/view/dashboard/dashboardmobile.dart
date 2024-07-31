import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:machinetest_web/controller/authcontroller.dart';
import 'package:machinetest_web/resources/appcolors.dart';
import 'package:machinetest_web/resources/mytextstyles.dart';
import 'package:machinetest_web/resources/strings.dart';
import 'package:machinetest_web/utils/mylisttile.dart';

class DashBoardMobile extends GetWidget<AuthController> {
  const DashBoardMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: const Text(
          'Dashboard',
          style: MyTextStyles.boldtext,
        ),
      ),
      drawer: Drawer(
        backgroundColor: AppColors.bgColor,
        child: Column(
          children: [
            const DrawerHeader(
              child: Image(
                image: AssetImage(Strings.logo),
                width: 200,
              ),
            ),
            const ListTile(
              leading: Icon(Icons.category_outlined),
              title: Text('Dashboard'),
            ),
            ListTile(
              onTap: () {
                controller.signOut();
              },
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: SizedBox(
                width: double.infinity,
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return MyListTile(index: index);
                  },
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
