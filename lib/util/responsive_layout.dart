import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ResponsiveLayout extends StatelessWidget {
  Widget? mobile;
  Widget? tablet;
  Widget? web;

  ResponsiveLayout({
    super.key,
    this.mobile,
    this.tablet,
    this.web,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (isWeb(context)) {
          return web ?? Container();
        } else if (isTablet(context)) {
          return tablet ?? Container();
        } else {
          return mobile ?? Container();
        }
      },
    );
  }

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 850;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 900;

  static bool isWeb(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;
}
