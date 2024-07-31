import 'package:flutter/widgets.dart';
import 'package:machinetest_web/resources/responsive_layout.dart';
import 'package:machinetest_web/view/signup/signupmobile.dart';
import 'package:machinetest_web/view/signup/signuptab.dart';
import 'package:machinetest_web/view/signup/signupweb.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileView: SignUpMobile(),
      tabletView: SignUpTab(),
      desktopView: SignUpWeb(),
    );
  }
}
