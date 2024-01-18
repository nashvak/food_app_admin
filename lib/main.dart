import 'package:flutter/material.dart';
import 'package:food_app_admin/responsive_design/mobile_scaffold.dart';
import 'package:food_app_admin/responsive_design/responsive.dart';
import 'package:food_app_admin/responsive_design/tablet_scaffold.dart';
import 'package:food_app_admin/screens/login/login.dart';
import 'package:food_app_admin/screens/main_screen/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food app admin',
      theme: ThemeData(
        useMaterial3: true,
      ),
      // home: const Responsive(
      //   mobile: MobileScaffold(),
      //   desktop: MainScreen(),
      //   tablet: TabletScaffold(),
      // ),
      home: LoginScreen(),
    );
  }
}
