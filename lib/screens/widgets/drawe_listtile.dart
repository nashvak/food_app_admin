import 'package:flutter/material.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    required this.title,
    required this.ontap,
    super.key,
  });
  final String title;
  final VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ontap,
      leading: const Icon(
        Icons.home,
        // color: Colors.white,
        // size: 16,
      ),
      title: Text(title),
    );
  }
}
