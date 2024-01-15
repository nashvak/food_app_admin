import 'package:flutter/material.dart';

import 'package:food_app_admin/screens/widgets/drawe_listtile.dart';

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
              title: 'dashboard',
              ontap: () {},
            ),
            DrawerListTile(
              title: 'Orders',
              ontap: () {},
            ),
            DrawerListTile(
              title: 'dashboard',
              ontap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
