import 'package:flutter/material.dart';
import 'package:machinetest_web/resources/appcolors.dart';
import 'package:machinetest_web/resources/mytextstyles.dart';
import 'package:machinetest_web/utils/mybutton.dart';
import 'package:machinetest_web/utils/mytextfield.dart';

class LoginMobile extends StatelessWidget {
  LoginMobile({super.key});

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
                              text: 'Email', textEditingController: email),
                          const Spacer(),
                          MyTextField(
                              text: 'Password',
                              textEditingController: password),
                          const Spacer(
                            flex: 2,
                          ),
                          MyButton(
                            text: 'Login',
                            onPressed: () {},
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
