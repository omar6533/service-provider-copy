import 'package:cloundry_care/app/modules/dashboard/controllers/order_controller.dart';
import 'package:cloundry_care/util/constant/app_keys.dart';
import 'package:cloundry_care/util/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../util/constant/app_colors.dart';

class CleanerView extends StatelessWidget {
  final OrdersController ordersController = Get.put(OrdersController());
  CleanerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 39, left: 20, bottom: 37, right: 20),
      margin: EdgeInsets.only(
          top: 30,
          right: isArabic
              ? 0
              : ResponsiveLayout.isTablet(context)
                  ? 0
                  : 64,
          left: isArabic
              ? ResponsiveLayout.isTablet(context)
                  ? 0
                  : 64
              : 0),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: AppColors.whiteColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Text(
              DateFormat('dd/MMM/yyyy').format(DateTime.now()),
              style: TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w400,
                fontSize: 24,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            'Cleaner'.tr,
            style: TextStyle(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w400,
                fontSize: 24),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Total'.tr,
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 18),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    'Busy'.tr,
                    style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, BoxConstraints constraints) => Container(
                    height: 132,
                    decoration: BoxDecoration(
                      border: isArabic
                          ? Border(
                              right: BorderSide(
                                color: AppColors.lineColor,
                                width: 1,
                              ),
                            )
                          : Border(
                              left: BorderSide(
                                color: AppColors.lineColor,
                                width: 1,
                              ),
                            ),
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StreamBuilder(
                              stream: ordersController
                                  .cleanersController.cleaerTotalItems.stream,
                              builder: (context, snapshot) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      bottom: 20,
                                      right: isArabic ? 0 : 20,
                                      left: isArabic ? 20 : 0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            ordersController.cleanersController
                                                .cleaerTotalItems.string,
                                            style: TextStyle(
                                                color: AppColors.blackColor,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 20,
                                        width: constraints.maxWidth,
                                        decoration: BoxDecoration(
                                          color: AppColors.darkBlueColor,
                                          borderRadius: isArabic
                                              ? const BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  bottomLeft:
                                                      Radius.circular(20),
                                                )
                                              : const BorderRadius.only(
                                                  topRight: Radius.circular(20),
                                                  bottomRight:
                                                      Radius.circular(20),
                                                ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                          StreamBuilder<Object>(
                              stream: ordersController.busyEmp.stream,
                              builder: (context, snapshot) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      right: isArabic ? 0 : 20,
                                      left: isArabic ? 20 : 0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            ordersController.busyEmp.string,
                                            style: TextStyle(
                                              color: AppColors.blackColor,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width: ordersController
                                                .remainingEmp.value *
                                            constraints.maxWidth,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          color: AppColors.orangeColor,
                                          borderRadius: isArabic
                                              ? const BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  bottomLeft:
                                                      Radius.circular(20),
                                                )
                                              : const BorderRadius.only(
                                                  topRight: Radius.circular(20),
                                                  bottomRight:
                                                      Radius.circular(20),
                                                ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              })
                        ]),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
