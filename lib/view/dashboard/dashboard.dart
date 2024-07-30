import 'package:flutter/material.dart';
import 'package:machinetest_web/resources/responsive_layout.dart';
import 'package:machinetest_web/view/dashboard/dashboardmobile.dart';
import 'package:machinetest_web/view/dashboard/dashboardtab.dart';
import 'package:machinetest_web/view/dashboard/dashboardweb.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileView: DashBoardMobile(),
        tabletView:DashBoardTab() ,
        desktopView: DashboardWeb(),
      );
  }
}