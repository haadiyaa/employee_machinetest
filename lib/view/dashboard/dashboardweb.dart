import 'package:flutter/material.dart';
import 'package:machinetest_web/resources/appcolors.dart';
import 'package:machinetest_web/resources/strings.dart';
import 'package:machinetest_web/utils/mybox.dart';

class DashboardWeb extends StatelessWidget {
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
                child: const Column(
                  children: [
                    DrawerHeader(
                      child: Image(
                        image: AssetImage(Strings.logo),
                        width: 200,
                      ),
                      // child: Icon(
                      //   Icons.person,
                      //   size: 50,
                      // ),
                    ),
                    ListTile(
                      leading: Icon(Icons.category_outlined),
                      title: Text('Dashboard'),
                    ),
                    ListTile(
                      leading: Icon(Icons.group),
                      title: Text('All Employees'),
                    ),
                    ListTile(
                      leading: Icon(Icons.logout),
                      title: Text('Logout'),
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
                              borderRadius: BorderRadius.circular(10)),
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
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10),
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
}
