
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machinetest_web/controller/authcontroller.dart';
import 'package:machinetest_web/view/dashboard/dashboard.dart';
import 'package:machinetest_web/view/login/login.dart';
class SplashScreen extends GetWidget<AuthController> {
  
  const SplashScreen({super.key});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          final authController = Get.find<AuthController>();
          if (authController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (authController.user != null) {
              return const DashBoard();
            } else {
              return const Login();
            }
          }
        },
      ),
    );
  }
}