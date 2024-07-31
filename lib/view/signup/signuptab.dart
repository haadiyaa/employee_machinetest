import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machinetest_web/resources/appcolors.dart';
import 'package:machinetest_web/resources/mytextstyles.dart';
import 'package:machinetest_web/resources/validators.dart';
import 'package:machinetest_web/utils/mybutton.dart';
import 'package:machinetest_web/utils/mytextfield.dart';
import 'package:machinetest_web/view/login/login.dart';
import '../../controller/authcontroller.dart';

class SignUpTab extends GetWidget<AuthController> {
  SignUpTab({super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.bgColor,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: size.width * 0.9,
                height: size.height * 0.8,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const Spacer(
                            flex: 3,
                          ),
                          // Image(image: AssetImage(Strings.logo)),
                          const Spacer(),
                          const Text(
                            'Sign Up',
                            style: MyTextStyles.boldtext20,
                          ),
                          const Spacer(),
                          MyTextField(
                            validator: (value) {
                              return Validators.emailValidator(value);
                            },
                            text: 'Email',
                            textEditingController: email,
                          ),
                          const Spacer(),
                          MyTextField(
                            validator: (value) {
                              return Validators.nameValidator(value);
                            },
                            text: 'Name',
                            textEditingController: name,
                          ),
                          const Spacer(),
                          MyTextField(
                            validator: (value) {
                              return Validators.passValidator(value);
                            },
                            text: 'Password',
                            textEditingController: password,
                          ),
                          const Spacer(
                            flex: 2,
                          ),
                          MyButton(
                            text: 'Signup',
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                controller.createUser(
                                  name.text.trim(),
                                  email.text.trim(),
                                  password.text.trim(),
                                );
                              }
                            },
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              Get.offAll(() => Login());
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Already have an account? "),
                                Text(
                                  "Login",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(
                            flex: 3,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
