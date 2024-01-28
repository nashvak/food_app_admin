import 'package:flutter/material.dart';
import 'package:food_app_admin/responsive_design/responsive.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_styles.dart';

class LoginTextfield extends StatelessWidget {
  const LoginTextfield({
    super.key,
    required this.width,
    required this.icon,
    required this.text,
    this.suffix,
    required this.obscure,
    required this.controller,
  });

  final double width;
  final IconData icon;
  final String text;
  final Icon? suffix;
  final bool obscure;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: ResponsiveWidget.isMobile(context)
          ? width
          : ResponsiveWidget.isTablet(context)
              ? width * 0.4
              : width * 0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        // color: Colors.red,
        color: white,
      ),
      child: TextFormField(
        controller: controller,
        style: ralewayStyle.copyWith(
          fontWeight: FontWeight.w400,
          color: appColor,
          fontSize: 12.0,
        ),
        obscureText: obscure,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            icon,
            size: 20,
          ),
          suffixIcon: suffix,
          contentPadding: const EdgeInsets.only(top: 16.0),
          hintText: text,
          hintStyle: ralewayStyle.copyWith(
            fontWeight: FontWeight.w400,
            color: appColor.withOpacity(0.5),
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }
}
