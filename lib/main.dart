import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:food_app_admin/screens/login/login.dart';
// import 'package:food_app_admin/screens/main_screen/main_screen.dart';

import 'bloc/auth/auth_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
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
      ),
    );
  }
}
