import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    required this.title,
    required this.ontap,
    required this.icon,
    super.key,
  });
  final String title;
  final VoidCallback ontap;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      // horizontalTitleGap: 0.0,
      onTap: ontap,
      leading: icon,
      title: Text(title),
    );
  }
}
