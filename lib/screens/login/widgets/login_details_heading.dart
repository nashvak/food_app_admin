import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_styles.dart';

class LoginDetailsHeading extends StatelessWidget {
  const LoginDetailsHeading({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: ralewayStyle.copyWith(
        fontSize: 12.0,
        color: appColor,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
