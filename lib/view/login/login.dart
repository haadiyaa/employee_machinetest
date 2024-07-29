import 'package:flutter/material.dart';
import 'package:machinetest_web/resources/responsive_layout.dart';
import 'package:machinetest_web/view/login/loginmobile.dart';
import 'package:machinetest_web/view/login/logintab.dart';
import 'package:machinetest_web/view/login/loginweb.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileView: LoginMobile(),
      tabletView: LoginTab(),
      desktopView: LoginWeb(),
    );
  }
}
