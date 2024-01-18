import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_styles.dart';

class FirstHeading extends StatelessWidget {
  const FirstHeading({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "Let's ",
            style: ralewayStyle.copyWith(
              fontSize: 25.0,
              color: appColor,
              fontWeight: FontWeight.normal,
            ),
          ),
          TextSpan(
            text: '$text 👇',
            style: ralewayStyle.copyWith(
              fontWeight: FontWeight.w800,
              color: textColor,
              fontSize: 25.0,
            ),
          ),
        ],
      ),
    );
  }
}
