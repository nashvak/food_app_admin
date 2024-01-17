import 'package:flutter/material.dart';

import 'package:food_app_admin/screens/main_screen/widgets/drawe_listtile.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const DrawerHeader(
              child: Center(
                child: Text('Logo'),
              ),
            ),
            DrawerListTile(
              icon: const Icon(Icons.home),
              title: 'dashboard',
              ontap: () {},
            ),
            DrawerListTile(
              // icon: Image.asset(name),
              icon: const Icon(Icons.beenhere_outlined),
              title: 'Orders',
              ontap: () {},
            ),
            DrawerListTile(
              icon: const Icon(Icons.menu_book),
              title: 'Menu',
              ontap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
