import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ResponsiveWidget({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  }) : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 700;
//<500
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1200 &&
      MediaQuery.of(context).size.width >= 700;

//>=500&&<=1200
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;
  //>1200

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
    // if (size.width >= 1200) {
    //   return desktop;
    // } else if (size.width >= 500 && size.width<=1200) {
    //   return tablet??desktop;
    // } else {
    //   return mobile??desktop;
    // }
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 1200) {
        return desktop;
      } else if (constraints.maxWidth <= 1200 && constraints.maxWidth >= 700) {
        return tablet;
      } else {
        return mobile;
      }
    });
  }
}
