import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machinetest_web/controller/authcontroller.dart';
import 'package:machinetest_web/resources/appcolors.dart';
import 'package:machinetest_web/resources/strings.dart';
import 'package:machinetest_web/utils/mybox.dart';
import 'package:machinetest_web/utils/myshowdialog.dart';

class DashboardWeb extends GetWidget<AuthController> {
  const DashboardWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            //drawer items
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Drawer(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                backgroundColor: AppColors.white,
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
                      title: Text('All Employees'),
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
            ),
            //rest of the body
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 17.5 / 9,
                      child: SizedBox(
                        width: double.infinity,
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemCount: 2,
                          itemBuilder: (BuildContext context, int index) {
                            return MyBox(
                              index: index,
                            );
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //right side
            const Expanded(
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: AddEmployee(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}

class AddEmployee extends StatelessWidget {
  const AddEmployee({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        myDialog(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.person_add_alt_1_sharp),
            Text(
              'Add Employee',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
  myDialog(BuildContext context) {
    final nameController = TextEditingController();
    final salaryController = TextEditingController();
    final ageController = TextEditingController();

    final _formKey = GlobalKey<FormState>();
    return showDialog(
      context: context,
      builder: (_) => DialogAlert(
        formKey: _formKey,
        nameController: nameController,
        ageController: ageController,
        salaryController: salaryController,
      ),
    );
  }
}
