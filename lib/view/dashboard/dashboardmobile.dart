import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:machinetest_web/controller/authcontroller.dart';
import 'package:machinetest_web/resources/appcolors.dart';
import 'package:machinetest_web/resources/mytextstyles.dart';
import 'package:machinetest_web/resources/strings.dart';
import 'package:machinetest_web/utils/mybox.dart';
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
              // child: Icon(
              //   Icons.person,
              //   size: 50,
              // ),
            ),
            const ListTile(
              leading: Icon(Icons.category_outlined),
              title: Text('Dashboard'),
            ),
            const ListTile(
              leading: Icon(Icons.group),
              title: Text('Employees'),
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
                // child: GridView.builder(
                //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //     crossAxisCount: 2,
                //   ),
                //   itemCount: 4,
                //   itemBuilder: (BuildContext context, int index) {
                //     return MyBox(index: index,);
                //   },
                // ),
                child: ListView.builder(
                  itemCount: 4,
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
