import 'package:auto_route/auto_route.dart';
import 'package:cloundry_care/app/modules/dashboard/controllers/order_controller.dart';
import 'package:cloundry_care/app/modules/dashboard/widgets/orders_view.dart';
import 'package:cloundry_care/util/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../base/base_view.dart';
import '../../cleaner/views/cleaner_view.dart';
import '../../ordersDetails/views/orders_details_view.dart';

@RoutePage()
class DashboardView extends StatefulWidget {
  const DashboardView({
    Key? key,
  }) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  var orderController = Get.put(OrdersController());
  @override
  Widget build(BuildContext context) {
    return BaseView(
      body: ResponsiveLayout(
        tablet: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: CleanerView(),
              ),
              OrdersView(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: OrdersDetailsView(),
              ),
            ],
          ),
        ),
        web: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 1, child: OrdersView()),
            Expanded(
              child: Column(
                children: [
                  CleanerView(),
                  // Expanded(child: OrdersDetailsView()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await orderController.getAllHomeInfo(context);
    });
  }
}
