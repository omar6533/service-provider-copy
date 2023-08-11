// ignore_for_file: public_member_api_docs, sort_constructors_first, deprecated_member_use
import 'package:auto_route/auto_route.dart';
import 'package:cloundry_care/app/modules/dashboard/controllers/booking_controller.dart';
import 'package:cloundry_care/app/modules/dashboard/controllers/order_controller.dart';
import 'package:cloundry_care/app/modules/dashboard/model/order_model.dart';
import 'package:cloundry_care/app/modules/dashboard/widgets/search_for_person_view.dart';
import 'package:cloundry_care/util/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../shared/custom_button.dart';
import '../../../../util/constant/app_assets.dart';
import '../../../../util/constant/app_colors.dart';
import '../../../../util/constant/app_keys.dart';
import 'available_time_section.dart';

Future<dynamic> assignDialog(BuildContext context,
    OrdersController orderController, OrderModel orderModel) {
  BookingController bookingController = Get.put(BookingController());
  orderController.currentTimeBooked.value = -1;
  orderController.cleanerName.value =
      SearchForPersonModel(cleanerName: '', houseNumber: -1, cleanerId: -1);
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return Dialog(
        insetPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(
                  left: 66, right: 66, top: 87, bottom: 36),
              width: MediaQuery.of(context).size.width / 2,
              height: MediaQuery.of(context).size.height / 1.1,
              decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(30)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(orderModel.buildingName ?? '',
                            style: TextStyle(
                                color: AppColors.greyColor,
                                fontSize: 20,
                                fontFamily: GoogleFonts.ubuntu().fontFamily,
                                fontWeight: FontWeight.w400)),
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
                        Text(orderModel.street ?? '',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.primaryColor,
                                color: AppColors.primaryColor,
                                fontSize: 14,
                                fontFamily: GoogleFonts.ubuntu().fontFamily,
                                fontWeight: FontWeight.w400)),
                        ResponsiveLayout.isTablet(context)
                            ? const SizedBox(
                                height: 20,
                              )
                            : Container(),
                        Text(
                          DateFormat("dd/MMM/yyyy").format(
                              orderModel.requestCleanServiceDate ??
                                  DateTime.now()),
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: AppColors.primaryColor,
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColors.primaryColor,
                                  ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 51,
                    ),
                    StreamBuilder<Object>(
                        stream: orderController.searchForPersonList.stream,
                        builder: (context, snapshot) {
                          return Container(
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 18,
                              top: 16,
                              bottom: 14,
                            ),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: AppColors.assignTextFieldBgColor),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  AppAssets.person,
                                  color: AppColors.lightGreyColor,
                                ),
                                const SizedBox(
                                  width: 14,
                                ),
                                StreamBuilder<Object>(
                                    stream: orderController.cleanerName.stream,
                                    builder: (context, snapshot) {
                                      return SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2.78,
                                        height: 48,
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                            icon: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 0),
                                              child: SvgPicture.asset(
                                                AppAssets.arrowDown,
                                                color: AppColors.lightGreyColor,
                                                width: 14,
                                                height: 7,
                                              ),
                                            ),
                                            iconSize: 20,
                                            isDense: true,
                                            hint: SizedBox(
                                              // width: width,
                                              child: Text(
                                                orderController
                                                            .cleanerName
                                                            .value
                                                            .cleanerName
                                                            .isNotEmpty ==
                                                        true
                                                    ? orderController
                                                        .cleanerName
                                                        .value
                                                        .cleanerName
                                                    : 'Assign to ...'.tr,
                                                overflow: TextOverflow.ellipsis,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelMedium
                                                    ?.copyWith(
                                                      color: AppColors
                                                          .textFieldColor
                                                          .withOpacity(0.5),
                                                    ),
                                              ),
                                            ),
                                            onChanged: (value) {
                                              orderController
                                                      .cleanerName.value =
                                                  value ??
                                                      SearchForPersonModel(
                                                          cleanerId: -1,
                                                          cleanerName: '',
                                                          houseNumber: -1);
                                            },
                                            items: orderController
                                                .searchForPersonList
                                                .map(
                                                  (e) => DropdownMenuItem(
                                                    value: e,
                                                    child: SearchForPersonView(
                                                        searchForPersonModel:
                                                            e),
                                                  ),
                                                )
                                                .toList(),
                                          ),
                                        ),
                                      );
                                    }),
                              ],
                            ),
                          );
                        }),
                    const SizedBox(
                      height: 51,
                    ),
                    AvailableTimeSection(
                      orderController: orderController,
                      sortAvailableTime: SortAvailableTime.assignDialog,
                      orderModel: orderModel,
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        StreamBuilder<Object>(
                            stream: orderController.currentTimeBooked.stream,
                            builder: (context, snapshot) {
                              return CustomButton(
                                  titleColor:
                                      orderController.currentTimeBooked.value !=
                                              (-1)
                                          ? AppColors.whiteColor
                                          : AppColors.primaryColor,
                                  width: MediaQuery.of(context).size.width / 7,
                                  height: 44,
                                  type:
                                      orderController.currentTimeBooked.value !=
                                              (-1)
                                          ? CustomButtonType.filled
                                          : CustomButtonType.bordered,
                                  title: 'Done'.tr,
                                  onTap: () async {
                                    if (orderController
                                                .currentTimeBooked.value !=
                                            (-1) &&
                                        orderController
                                                .cleanerName.value.cleanerId !=
                                            -1) {
                                      await orderController
                                          .assignRequestCleanServiceToEmp(
                                              context, orderModel);
                                    }
                                  },
                                  containerColor: AppColors.primaryColor);
                            }),
                      ],
                    )
                  ]),
            ),
            isArabic
                ? Positioned(
                    left: 30,
                    top: 30,
                    child: GestureDetector(
                        onTap: () {
                          orderController.cleanerName.value =
                              SearchForPersonModel(
                                  cleanerName: '',
                                  houseNumber: -1,
                                  cleanerId: -1);
                          orderController.currentTimeBooked.value = (-1);
                          context.popRoute();
                        },
                        child: SvgPicture.asset(AppAssets.close)),
                  )
                : Positioned(
                    right: 30,
                    top: 30,
                    child: GestureDetector(
                        onTap: () {
                          orderController.cleanerName.value =
                              SearchForPersonModel(
                                  cleanerName: '',
                                  houseNumber: -1,
                                  cleanerId: -1);
                          orderController.currentTimeBooked.value = (-1);
                          context.popRoute();
                        },
                        child: SvgPicture.asset(AppAssets.close)),
                  ),
          ],
        ),
      );
    },
  );
}
