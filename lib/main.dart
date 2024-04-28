import 'package:rakta_admin/constants.dart';
import 'package:rakta_admin/controllers/MenuAppController.dart';
import 'package:rakta_admin/core/binding.dart';
import 'package:rakta_admin/screens/login/login_screen.dart';
import 'package:rakta_admin/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: GetBinding(),
      debugShowCheckedModeBanner: false,
      title: 'Saqr Admin Panel',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      // home: MainScreen(),
      home: LoginScreen(),
    );
  }
}
