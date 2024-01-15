import 'package:flutter/material.dart';
import 'package:food_app_admin/screens/dashboard/dashboard.dart';
import 'package:food_app_admin/screens/main_screen/widgets/side_menu.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              child: SideMenu(),
            ),
            Expanded(
              flex: 4,
              child: DashboardScreen(),
            ),
            // Expanded(
            //   flex: 1,
            //   child: Text('dgdg'),
            // ),
          ],
        ),
      ),
    );
  }
}
