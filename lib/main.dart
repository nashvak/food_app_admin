import 'package:flutter/material.dart';

import 'package:food_app_admin/screens/login/login.dart';

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
      home: const LoginScreen(),
    );
  }
}
