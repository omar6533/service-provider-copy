// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../util/responsive_layout.dart';
import '../../base/base_view.dart';
import '../controllers/cleaners_controller.dart';
import '../widgets/cleaners_body.dart';

@RoutePage()
class CleanersView extends StatefulWidget {
  const CleanersView({Key? key}) : super(key: key);

  @override
  State<CleanersView> createState() => _CleanersViewState();
}

class _CleanersViewState extends State<CleanersView> {
  CleanersController cleanersController = Get.put(CleanersController());
  @override
  Widget build(BuildContext context) {
    return BaseView(
      body: ResponsiveLayout(
        tablet: SingleChildScrollView(
          child: Column(
            children: [CleanersBody(cleanersController: cleanersController)],
          ),
        ),
        web: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [CleanersBody(cleanersController: cleanersController)],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await cleanersController.getAllCleaner(context);
    });
  }
}
