import 'package:get/get.dart';
import 'package:machinetest_web/controller/authcontroller.dart';

class InstanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
  }
}
