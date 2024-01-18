import 'package:flutter/material.dart';

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
  });

  final double width;
  final IconData icon;
  final String text;
  final Icon? suffix;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: white,
      ),
      child: TextFormField(
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
