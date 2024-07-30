import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machinetest_web/controller/authcontroller.dart';
import 'package:machinetest_web/resources/appclass.dart';
import 'package:machinetest_web/resources/appcolors.dart';
import 'package:machinetest_web/resources/mytextstyles.dart';
import 'package:machinetest_web/resources/strings.dart';
import 'package:machinetest_web/resources/validators.dart';
import 'package:machinetest_web/utils/mybox.dart';
import 'package:machinetest_web/utils/mybutton.dart';
import 'package:machinetest_web/utils/mytextfield.dart';

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
                    )
                  ],
                ),
              ),
            ),
            //right side
            Expanded(
              child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: GestureDetector(
                      onTap: () {
                        myDialog(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
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
                                fontWeight: FontWeight.w200,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
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
      builder: (_) => AlertDialog(
        backgroundColor: AppColors.white,
        title: Row(
          children: [
            const Expanded(
              flex: 9,
              child: Text("Add Employee", style: MyTextStyles.boldtext),
            ),
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.close))
          ],
        ),
        content: Container(
          width: AppClass.getMqWidth(context) * 0.6,
          height: AppClass.getMqHeight(context) * 0.5,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                MyTextField(
                  text: 'Name of the Employee',
                  textEditingController: nameController,
                  validator: (value) {
                    return Validators.nameValidator(value);
                  },
                ),
                MyTextField(
                  text: 'Age of the Employee',
                  textEditingController: ageController,
                  validator: (value) {
                    return Validators.ageValidator(value);
                  },
                ),
                MyTextField(
                  text: 'Salary of the Employee',
                  textEditingController: salaryController,
                  validator: (value) {
                    return Validators.salaryValidator(value);
                  },
                ),
              ],
            ),
          ),
        ),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Get.back();
              }
               
            },
            child: const Text('Okay'),
          ),
        ],
      ),
    );
  }
}
