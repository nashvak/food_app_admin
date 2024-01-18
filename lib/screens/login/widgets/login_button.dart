import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_styles.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.ontap,
    required this.text,
  });
  final VoidCallback ontap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: ontap,
        borderRadius: BorderRadius.circular(16.0),
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 70.0, vertical: 18.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: appColor,
          ),
          child: Text(
            text,
            style: ralewayStyle.copyWith(
              fontWeight: FontWeight.w700,
              color: white,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}
