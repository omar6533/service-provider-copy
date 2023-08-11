import 'package:cloundry_care/app/modules/dashboard/controllers/booking_controller.dart';
import 'package:cloundry_care/app/modules/dashboard/model/order_model.dart';
import 'package:cloundry_care/util/constant/app_colors.dart';
import 'package:cloundry_care/util/constant/app_keys.dart';
import 'package:cloundry_care/util/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/order_controller.dart';
import 'assign_dialog.dart';
import 'detail_dialog.dart';
import 'empty_view.dart';
import 'order_item.dart';

// ignore: must_be_immutable
class OrdersView extends StatelessWidget {
  OrdersController orderController = Get.put(OrdersController());
  BookingController bookingController = Get.put(BookingController());

  OrderModel? orderModel;
  OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30, left: 15, right: 15, bottom: 30),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 32,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: AppColors.whiteColor),
      child: StreamBuilder(
          stream: orderController.isAccepted.stream,
          builder: (context, snapshot) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Stack(children: [
                      GestureDetector(
                        onTap: () {
                          orderController.isAccepted.value =
                              !orderController.isAccepted.value;
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 4,
                          height: 4,
                          color: AppColors.lineColor.withOpacity(0.5),
                        ),
                      ),
                      orderController.isAccepted.isTrue
                          ? isArabic
                              ? Positioned(
                                  left: 0,
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 8,
                                    height: 4,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: AppColors.primaryColor),
                                  ),
                                )
                              : Positioned(
                                  right: 0,
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 8,
                                    height: 4,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: AppColors.primaryColor),
                                  ),
                                )
                          : isArabic
                              ? Positioned(
                                  right: 0,
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 8,
                                    height: 4,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: AppColors.primaryColor),
                                  ),
                                )
                              : Positioned(
                                  left: 0,
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 8,
                                    height: 4,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: AppColors.primaryColor),
                                  ),
                                )
                    ]),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 65, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              orderController.isSelected.value = true;
                              orderController.isAccepted.value = false;
                            },
                            child: Text(
                              'Pending'.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                      color: orderController.isAccepted.isTrue
                                          ? AppColors.greyColor
                                          : AppColors.darkGreyColor),
                            ),
                          ),
                          const SizedBox(
                            width: 100,
                          ),
                          GestureDetector(
                            onTap: () {
                              orderController.isSelected.value = true;
                              orderController.isAccepted.value = true;
                            },
                            child: Text(
                              'Accepted'.tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                      color: orderController.isAccepted.isTrue
                                          ? AppColors.darkGreyColor
                                          : AppColors.greyColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                ResponsiveLayout.isTablet(context)
                    ? SingleChildScrollView(
                        child: Column(
                          children: [
                            orderController.isAccepted.isFalse //pending
                                ? StreamBuilder(
                                    stream:
                                        orderController.pendingOrderList.stream,
                                    builder: (context, snapshot) {
                                      return orderController
                                              .pendingOrderList.isEmpty
                                          ? EmptyView(
                                              message:
                                                  'you don\'nt have any pending requests'
                                                      .tr,
                                            )
                                          : ListView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemCount: orderController
                                                  .pendingOrderList.length,
                                              itemBuilder: (context, index) =>
                                                  OrderItem(
                                                orderSort: OrderSort.pending,
                                                onTap: () {
                                                  detailDialog(
                                                      context,
                                                      orderController,
                                                      SortDetailDialog.orders,
                                                      orderController
                                                          .pendingOrderList
                                                          .elementAt(index));
                                                },
                                                orderModel: orderController
                                                    .pendingOrderList[index],
                                              ),
                                            );
                                    })
                                : StreamBuilder<Object>(
                                    stream: orderController
                                        .acceptedOrderList.stream,
                                    builder: (context, snapshot) {
                                      return orderController
                                              .acceptedOrderList.isEmpty
                                          ? EmptyView(
                                              message:
                                                  'you don\'nt have any accepted requests'
                                                      .tr,
                                            )
                                          : ListView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemCount: orderController
                                                  .acceptedOrderList.length,
                                              itemBuilder: (context, index) =>
                                                  OrderItem(
                                                orderSort: OrderSort.accepted,
                                                onTap: () async {
                                                  if (orderController
                                                          .acceptedOrderList[
                                                              index]
                                                          .isAssigned ==
                                                      true) {
                                                    return;
                                                  }
                                                  // ignore: use_build_context_synchronously
                                                  bookingController
                                                      .showLoaderDialog(
                                                          context);
                                                  await Future.wait([
                                                    bookingController
                                                        .getAllServiceTime(
                                                            context),
                                                    orderController
                                                        .assignToCleaners(
                                                            context,
                                                            orderController
                                                                    .acceptedOrderList[
                                                                index])
                                                  ]);
                                                  // ignore: use_build_context_synchronously
                                                  bookingController
                                                      .dismissLoaderDialog(
                                                          context);
                                                  // ignore: use_build_context_synchronously
                                                  assignDialog(
                                                      context,
                                                      orderController,
                                                      orderController
                                                              .acceptedOrderList[
                                                          index]);
                                                },
                                                orderModel: orderController
                                                    .acceptedOrderList[index],
                                              ),
                                            );
                                    })
                          ],
                        ),
                      )
                    : Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              orderController.isAccepted.isFalse
                                  ? StreamBuilder(
                                      stream: orderController
                                          .pendingOrderList.stream,
                                      builder: (context, snapshot) {
                                        return orderController
                                                .pendingOrderList.isEmpty
                                            ? EmptyView(
                                                message:
                                                    'you don\'nt have any pending requests'
                                                        .tr,
                                              )
                                            : ListView.builder(
                                                shrinkWrap: true,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                itemCount: orderController
                                                    .pendingOrderList.length,
                                                itemBuilder: (context, index) =>
                                                    OrderItem(
                                                  orderSort: OrderSort.pending,
                                                  onTap: () {
                                                    detailDialog(
                                                        context,
                                                        orderController,
                                                        SortDetailDialog.orders,
                                                        orderController
                                                            .pendingOrderList
                                                            .elementAt(index));
                                                  },
                                                  orderModel: orderController
                                                      .pendingOrderList[index],
                                                ),
                                              );
                                      })
                                  : StreamBuilder(
                                      stream: orderController
                                          .acceptedOrderList.stream,
                                      builder: (context, snapshot) {
                                        return orderController
                                                .acceptedOrderList.isEmpty
                                            ? EmptyView(
                                                message:
                                                    'you don\'nt have any accepted requests'
                                                        .tr,
                                              )
                                            : ListView.builder(
                                                shrinkWrap: true,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                itemCount: orderController
                                                    .acceptedOrderList.length,
                                                itemBuilder: (context, index) =>
                                                    OrderItem(
                                                  orderSort: OrderSort.accepted,
                                                  onTap: () async {
                                                    if (orderController
                                                            .acceptedOrderList[
                                                                index]
                                                            .isAssigned ==
                                                        true) {
                                                      return;
                                                    }
                                                    // ignore: use_build_context_synchronously
                                                    bookingController
                                                        .showLoaderDialog(
                                                            context);
                                                    await Future.wait([
                                                      bookingController
                                                          .getAllServiceTime(
                                                              context),
                                                      orderController
                                                          .assignToCleaners(
                                                              context,
                                                              orderController
                                                                      .acceptedOrderList[
                                                                  index])
                                                    ]);
                                                    // ignore: use_build_context_synchronously
                                                    bookingController
                                                        .dismissLoaderDialog(
                                                            context);
                                                    // ignore: use_build_context_synchronously
                                                    assignDialog(
                                                        context,
                                                        orderController,
                                                        orderController
                                                                .acceptedOrderList[
                                                            index]);
                                                  },
                                                  orderModel: orderController
                                                      .acceptedOrderList[index],
                                                ),
                                              );
                                      })
                            ],
                          ),
                        ),
                      )
              ],
            );
          }),
    );
  }
}
