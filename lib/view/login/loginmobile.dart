import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:machinetest_web/controller/authcontroller.dart';
import 'package:machinetest_web/resources/appcolors.dart';
import 'package:machinetest_web/resources/mytextstyles.dart';
import 'package:machinetest_web/resources/validators.dart';
import 'package:machinetest_web/utils/mybutton.dart';
import 'package:machinetest_web/utils/mytextfield.dart';
import 'package:machinetest_web/view/signup/signup.dart';

class LoginMobile extends GetWidget<AuthController> {
  LoginMobile({super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
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
                width: size.width * 0.95,
                height: size.height * 0.8,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    padding: const EdgeInsets.all(15),
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
                            'Login',
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
                              return Validators.passValidator(value);
                            },
                            text: 'Password',
                            textEditingController: password,
                          ),
                          const Spacer(
                            flex: 2,
                          ),
                          MyButton(
                            text: 'Login',
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                controller.logIn(
                                    email.text.trim(), password.text.trim());
                              }
                            },
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              Get.offAll(() => const SignUp());
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Don't have an account? "),
                                Text(
                                  "Sign Up",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(
                            flex: 3,
                          )
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
