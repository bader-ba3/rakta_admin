import 'package:rakta_admin/controller/home_controller.dart';
import 'package:rakta_admin/controllers/MenuAppController.dart';
import 'package:rakta_admin/responsive.dart';
import 'package:rakta_admin/screens/account_management/account_management_screen.dart';
import 'package:rakta_admin/screens/ai/ai_screen.dart';
import 'package:rakta_admin/screens/buses/buses_screen.dart';
import 'package:rakta_admin/screens/cars/cars_screen.dart';
import 'package:rakta_admin/screens/customer_happiness/customer_happiness_screen.dart';
import 'package:rakta_admin/screens/dashboard/dashboard_screen.dart';
import 'package:rakta_admin/screens/drivers/drivers_screen.dart';
import 'package:rakta_admin/screens/ferrys/ferry_screen.dart';
import 'package:rakta_admin/screens/maps/maps_screen.dart';
import 'package:rakta_admin/screens/reports/reports_screen.dart';
import 'package:rakta_admin/screens/settings/settings_screen.dart';
import 'package:rakta_admin/screens/users/users_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:split_view/split_view.dart';

import '../notification/notification_screen.dart';
import '../taxi/taxi_screen.dart';
import 'components/side_menu.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          key: controller.scaffoldKey,
          drawer: SideMenu(),
          body: SafeArea(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // We want this side menu only for large screen
                if (Responsive.isDesktop(context))
                  Expanded(
                    flex: 15,
                    child: SideMenu(),
                  ),
                Expanded(
                  flex: 85,
                  child: IndexedStack(
                    index: controller.menuIndex,
                    children: [
                      DashboardScreen(),
                      UsersScreen(),
                      DriverScreen(),
                      CarsScreen(),
                      TaxiScreen(),
                      BusesScreen(),
                      FerryScreen(),
                      NotificationScreen(),
                      ReportsScreen(),
                      MapsScreen(),
                      AiScreen(),
                      CustomerHappinessScreen(),
                      AccountManagementScreen(),
                      SettingsScreen(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
