import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_styles.dart';

class LoginLogoContainer extends StatelessWidget {
  const LoginLogoContainer({
    super.key,
    required this.height,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      color: appColor,
      child: Center(
        child: Text(
          'Foodie',
          style: ralewayStyle.copyWith(
            fontSize: 48.0,
            color: white,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
