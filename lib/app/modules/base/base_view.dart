import 'package:cloundry_care/shared/app_bar_view.dart';
import 'package:cloundry_care/shared/side_bar_view.dart';
import 'package:flutter/material.dart';

class BaseView extends StatelessWidget {
  final Widget body;
  const BaseView({
    Key? key,
    required this.body,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideBarView(),
          Expanded(
            child: Column(
              children: [
                const AppBarView(),
                Expanded(child: body),
              ],
            ),
          )
        ],
      ),
    );
  }
}
