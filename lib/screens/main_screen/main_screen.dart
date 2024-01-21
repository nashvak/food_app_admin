import 'package:flutter/material.dart';
import 'package:food_app_admin/constants/app_colors.dart';
import 'package:food_app_admin/screens/dashboard/dashboard.dart';
import 'package:food_app_admin/screens/main_screen/widgets/side_menu.dart';
import 'package:food_app_admin/screens/menu_screen/menu_screen.dart';
import 'package:food_app_admin/screens/order_screen/order_screen.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int myIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final List<Widget> screens = [
      const DashboardScreen(),
      const OrderScreen(),
      const MenuScreen(),
    ];
    return Scaffold(
      // body: SafeArea(
      //   child: Row(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Expanded(
      //         // flex: size.width > 1340 ? 2 : 4,
      //         flex: 1,
      //         child: SideMenu(),
      //       ),
      //       Expanded(
      //         flex: 5,
      //         child: DashboardScreen(),
      //       ),
      //       Expanded(
      //         flex: 1,
      //         child: Container(
      //           color: Colors.red,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      body: Row(
        children: [
          if (MediaQuery.of(context).size.width >= 640)
            NavigationRail(
              onDestinationSelected: (value) {
                setState(() {
                  myIndex = value;
                });
              },
              selectedIndex: myIndex,
              labelType: NavigationRailLabelType.all,
              selectedLabelTextStyle: const TextStyle(color: appColor),
              unselectedLabelTextStyle: const TextStyle(color: Colors.grey),
              selectedIconTheme: IconThemeData(color: appColor),
              leading: const Column(children: [
                SizedBox(
                  height: 10,
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: appColor,
                  child: Icon(
                    Icons.person,
                    color: white,
                  ),
                ),
                SizedBox(
                  height: 15,
                )
              ]),
              destinations: const [
                NavigationRailDestination(
                    icon: Icon(Icons.home), label: Text('Home')),
                NavigationRailDestination(
                    icon: Icon(Icons.menu), label: Text('Menu')),
                NavigationRailDestination(
                    icon: Icon(Icons.favorite), label: Text('Orders')),
              ],
            ),
          Expanded(child: screens[myIndex]),
        ],
      ),
      bottomNavigationBar: (MediaQuery.of(context).size.width < 640)
          ? BottomNavigationBar(
              currentIndex: myIndex,
              onTap: (value) {
                myIndex = value;
                setState(() {});
              },
              items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.menu), label: 'Menu'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite), label: 'Order'),
                ])
          : null,
    );
  }
}
