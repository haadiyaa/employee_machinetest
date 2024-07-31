import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machinetest_web/controller/authcontroller.dart';
import 'package:machinetest_web/controller/employeecontroller.dart';
import 'package:machinetest_web/firebase_options.dart';
import 'package:machinetest_web/resources/appcolors.dart';
import 'package:machinetest_web/resources/instancebinding.dart';
import 'package:machinetest_web/view/splachscreen/splashscreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /// firebase initialization
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  /// dependency injuction
  Get.put(AuthController());
  Get.put(EmployeeController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InstanceBinding(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.bgColor,
        fontFamily: 'Poppins',
      ),
      home: const SplashScreen(),
    );
  }
}
