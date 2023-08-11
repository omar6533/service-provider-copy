// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:cloundry_care/app/modules/cleaners/controllers/cleaners_controller.dart';
import 'package:cloundry_care/app/modules/dashboard/controllers/booking_controller.dart';
import 'package:cloundry_care/app/modules/dashboard/controllers/order_controller.dart';
import 'package:cloundry_care/app/modules/dashboard/model/order_model.dart';
import 'package:cloundry_care/app/modules/dashboard/model/service_time_response.dart';
import 'package:cloundry_care/util/constant/app_keys.dart';
import 'package:cloundry_care/util/constant/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../util/constant/app_colors.dart';
import 'time_section.dart';

class AvailableTimeSection extends StatelessWidget {
  final OrdersController orderController;
  final SortAvailableTime sortAvailableTime;
  RxList<ServiceTimeResult>? serviceTimeSlotList;
  DateTime? selectedTimeSlot;
  CleanersController cleanersController = Get.put(CleanersController());
  BookingController bookingController = Get.put(BookingController());
  OrderModel? orderModel;
  AvailableTimeSection(
      {Key? key,
      required this.orderController,
      required this.sortAvailableTime,
      this.serviceTimeSlotList,
      this.selectedTimeSlot,
      this.orderModel})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 21),
          child: Text(
            'Available Time'.tr,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: AppColors.greyColor,
              fontFamily: GoogleFonts.ubuntu().fontFamily,
            ),
          ),
        ),
        serviceTimeSlotList != null
            ? Container(
                width: double.infinity,
                height:
                    orderController.cleanerName.value.cleanerName.isNotEmpty ||
                            cleanersController.selectedDateTime.value !=
                                DateTime.now()
                        ? 148
                        : 77,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColors.borderColor)),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 20,
                      left: 20,
                      top: 30,
                      bottom: 20,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            DateFormat(
                                    'EEEE d MMMM',
                                    isArabic
                                        ? arabicLocal.languageCode
                                        : englishLocal.languageCode)
                                .format(selectedTimeSlot ??
                                    orderModel?.requestCleanServiceDate ??
                                    DateTime.now())
                                .tr,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              fontFamily: GoogleFonts.ubuntu().fontFamily,
                              color: AppColors.textFieldColor.withOpacity(0.5),
                            )),
                        const SizedBox(
                          height: 26,
                        ),
                        StreamBuilder<Object>(
                            stream: serviceTimeSlotList!.stream,
                            builder: (context, snapshot) {
                              return ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: serviceTimeSlotList!.length,
                                itemBuilder: (context, index) => TimeView(
                                  isSelected: true,
                                  onTap: () {},
                                  serviceTimeResult:
                                      serviceTimeSlotList![index],
                                ),
                              );
                            })
                      ],
                    ),
                  ),
                ),
              )
            : StreamBuilder<Object>(
                stream: sortAvailableTime == SortAvailableTime.assignDialog
                    ? orderController.cleanerName.stream
                    : cleanersController.selectedDateTime.stream,
                builder: (context, snapshot) {
                  return Container(
                    width: double.infinity,
                    height: orderController
                                .cleanerName.value.cleanerName.isNotEmpty ||
                            cleanersController.selectedDateTime.value !=
                                DateTime.now()
                        ? 148
                        : 77,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.borderColor)),
                    child: (sortAvailableTime == SortAvailableTime.assignDialog)
                        ? orderController.cleanerName.value.cleanerName.isEmpty
                            ? Center(
                                child: Text(
                                  'No Data!'.tr,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(
                                        color: AppColors.textFieldColor
                                            .withOpacity(0.5),
                                      ),
                                ),
                              )
                            : SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    right: 20,
                                    left: 20,
                                    top: 30,
                                    bottom: 20,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          DateFormat(
                                                  'EEEE d MMMM',
                                                  isArabic
                                                      ? arabicLocal.languageCode
                                                      : englishLocal
                                                          .languageCode)
                                              .format(orderModel
                                                      ?.requestCleanServiceDate ??
                                                  DateTime.now())
                                              .tr,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            fontFamily:
                                                GoogleFonts.ubuntu().fontFamily,
                                            color: AppColors.textFieldColor
                                                .withOpacity(0.5),
                                          )),
                                      const SizedBox(
                                        height: 26,
                                      ),
                                      serviceTimeSlotList != null
                                          ? StreamBuilder<Object>(
                                              stream:
                                                  serviceTimeSlotList!.stream,
                                              builder: (context, snapshot) {
                                                return ListView.builder(
                                                  physics:
                                                      const NeverScrollableScrollPhysics(),
                                                  shrinkWrap: true,
                                                  itemCount:
                                                      serviceTimeSlotList!
                                                          .length,
                                                  itemBuilder:
                                                      (context, index) =>
                                                          TimeView(
                                                    isSelected: true,
                                                    onTap: () {},
                                                    serviceTimeResult:
                                                        serviceTimeSlotList![
                                                            index],
                                                  ),
                                                );
                                              })
                                          : StreamBuilder<Object>(
                                              stream: bookingController
                                                  .serviceTimeSlotList.stream,
                                              builder: (context, snapshot) {
                                                return StreamBuilder<Object>(
                                                    stream: orderController
                                                        .currentTimeBooked
                                                        .stream,
                                                    builder:
                                                        (context, snapshot) {
                                                      return ListView.builder(
                                                        physics:
                                                            const NeverScrollableScrollPhysics(),
                                                        shrinkWrap: true,
                                                        itemCount: bookingController
                                                            .serviceTimeSlotList
                                                            .length,
                                                        itemBuilder:
                                                            (context, index) =>
                                                                TimeView(
                                                          isSelected: orderController
                                                                  .currentTimeBooked
                                                                  .value ==
                                                              (bookingController
                                                                      .serviceTimeSlotList[
                                                                          index]
                                                                      .serviceTimeSlotId ??
                                                                  -1),
                                                          onTap: () {
                                                            orderController
                                                                .currentTimeBooked
                                                                .value = bookingController
                                                                    .serviceTimeSlotList[
                                                                        index]
                                                                    .serviceTimeSlotId ??
                                                                -1;
                                                          },
                                                          serviceTimeResult:
                                                              bookingController
                                                                      .serviceTimeSlotList[
                                                                  index],
                                                        ),
                                                      );
                                                    });
                                              })
                                    ],
                                  ),
                                ),
                              )
                        : cleanersController.selectedDateTime.value ==
                                DateTime.now()
                            ? Center(
                                child: Text(
                                  'No Data!'.tr,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(
                                        color: AppColors.textFieldColor
                                            .withOpacity(0.5),
                                      ),
                                ),
                              )
                            : SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    right: 20,
                                    left: 20,
                                    top: 30,
                                    bottom: 20,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Sunday 10 May'.tr,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            fontFamily:
                                                GoogleFonts.ubuntu().fontFamily,
                                            color: AppColors.textFieldColor
                                                .withOpacity(0.5),
                                          )),
                                      const SizedBox(
                                        height: 26,
                                      ),
                                      StreamBuilder<Object>(
                                          stream: cleanersController
                                              .currentTimeBooked.stream,
                                          builder: (context, snapshot) {
                                            return ListView.builder(
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: 5,
                                              itemBuilder: (context, index) =>
                                                  TimeView(
                                                isSelected: cleanersController
                                                        .currentTimeBooked
                                                        .value ==
                                                    index,
                                                onTap: () {
                                                  cleanersController
                                                      .currentTimeBooked
                                                      .value = index;
                                                },
                                              ),
                                            );
                                          })
                                    ],
                                  ),
                                ),
                              ),
                  );
                })
      ],
    );
  }
}

enum SortAvailableTime { calendardialog, assignDialog }
