import 'package:flutter/material.dart';
import 'package:food_app_admin/screens/widgets/side_menu.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            const Expanded(
              child: SideMenu(),
            ),
            Expanded(
              flex: 5,
              child: Container(
                color: Colors.purple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
