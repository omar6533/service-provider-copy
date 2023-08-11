// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloundry_care/app/modules/dashboard/model/order_model.dart';
import 'package:cloundry_care/util/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../shared/custom_button.dart';
import '../../../../util/constant/app_colors.dart';
import '../controllers/order_controller.dart';

// ignore: must_be_immutable
class OrderItem extends StatelessWidget {
  OrdersController ordersController = Get.put(OrdersController());
  final OrderSort orderSort;
  final VoidCallback onTap;
  final OrderModel orderModel;
  bool? isSelected;
  // bool? isAssigned;
  OrderItem({
    Key? key,
    required this.orderSort,
    this.isSelected,
    // this.isAssigned,
    required this.onTap,
    required this.orderModel,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
      padding: const EdgeInsets.only(left: 20, top: 37, bottom: 42, right: 25),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 3),
              blurRadius: 6,
              color: AppColors.lightGreyColor.withOpacity(0.2),
            )
          ]),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${'Order ID'.tr}' + " ${orderModel.orderID ?? 0}",
                    style: TextStyle(
                        color: AppColors.greyColor,
                        fontSize: 20,
                        fontFamily: GoogleFonts.ubuntu().fontFamily,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    orderModel.buildingName ?? '',
                    style: TextStyle(
                        color: AppColors.greyColor,
                        fontSize: 20,
                        fontFamily: GoogleFonts.ubuntu().fontFamily,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    '${'apartment number'.tr} : ${orderModel.apartmentName ?? ''}',
                    style: TextStyle(
                        color: AppColors.lightGreenColor,
                        fontSize: 18,
                        fontFamily: GoogleFonts.ubuntu().fontFamily,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  Text(
                    '${'floor number'.tr} : ${orderModel.floorNumber ?? ''}',
                    style: TextStyle(
                        color: AppColors.lightGreenColor,
                        fontSize: 18,
                        fontFamily: GoogleFonts.ubuntu().fontFamily,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  Text(
                    orderModel.street ?? '',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.primaryColor,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primaryColor,
                        ),
                  ),
                  ResponsiveLayout.isTablet(context)
                      ? const SizedBox(
                          height: 20,
                        )
                      : Container(),
                  Text(
                    DateFormat("dd/MMM/yyyy").format(
                        orderModel.requestCleanServiceDate ?? DateTime.now()),
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.primaryColor,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primaryColor,
                        ),
                  ),
                  ResponsiveLayout.isTablet(context)
                      ? orderSort == OrderSort.pending
                          ? CustomButton(
                              width: 133,
                              title: 'Details'.tr,
                              onTap: onTap,
                              type: CustomButtonType.filled,
                              height: 44)
                          : CustomButton(
                              titleColor: orderModel.statusSort.itemTitleColor,
                              width: 123,
                              title: orderModel.statusSort.itemTitle,
                              type: CustomButtonType.filled,
                              containerColor:
                                  orderModel.statusSort.itemContainerColor,
                              onTap: () {},
                              height: 29,
                              borderRadius: 65,
                            )
                      : Container()
                ],
              ),
              ResponsiveLayout.isWeb(context)
                  ? orderSort == OrderSort.pending
                      ? CustomButton(
                          width: 133,
                          title: 'Details'.tr,
                          onTap: onTap,
                          type: CustomButtonType.filled,
                          height: 44)
                      : CustomButton(
                          titleColor: orderModel.statusSort.itemTitleColor,
                          width: 123,
                          title: orderModel.statusSort.itemTitle,
                          type: CustomButtonType.filled,
                          containerColor:
                              orderModel.statusSort.itemContainerColor,
                          onTap: () {},
                          height: 29,
                          borderRadius: 65,
                        )
                  : Container()
            ],
          ),
          orderSort == OrderSort.accepted
              ? Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    CustomButton(
                        titleColor: orderModel.isAssigned == true
                            ? AppColors.primaryColor
                            : AppColors.whiteColor,
                        width: 133,
                        title: orderModel.isAssigned == true
                            ? 'Assigned'.tr
                            : 'Assign'.tr,
                        onTap: onTap,
                        type: orderModel.isAssigned != true
                            ? CustomButtonType.filled
                            : CustomButtonType.bordered,
                        height: 44),
                  ],
                )
              : Container()
        ],
      ),
    );
  }
}
