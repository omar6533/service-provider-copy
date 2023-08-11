import 'package:auto_route/auto_route.dart';
import 'package:cloundry_care/app/modules/dashboard/controllers/booking_controller.dart';
import 'package:cloundry_care/app/modules/dashboard/controllers/order_controller.dart';
import 'package:cloundry_care/app/modules/dashboard/model/service_time_response.dart';
import 'package:cloundry_care/app/modules/dashboard/widgets/available_time_section.dart';
import 'package:cloundry_care/util/constant/app_assets.dart';
import 'package:cloundry_care/util/constant/app_keys.dart';
import 'package:cloundry_care/util/constant/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../shared/custom_button.dart';
import '../../../../util/constant/app_colors.dart';
import '../controllers/cleaners_controller.dart';

Future<dynamic> calendarDialog(
    BuildContext context, SortCalenderView sortCalenderView) {
  CleanersController cleanersController = Get.put(CleanersController());
  OrdersController ordersController = Get.put(OrdersController());
  BookingController bookingController = Get.put(BookingController());
  DateTime eventDay = DateTime.now();
  List<ServiceTimeResult> _getEventsForDay(DateTime day) {
    if (cleanersController.assignSpScheduleList.isEmpty) {
      return [];
    }
    var hasThisDay = cleanersController.assignSpScheduleList
        .where((element) =>
            DateFormat("dd/MMM/yyyy").format(
                element.spOrderAssign?.spOrderAssignCreateDate ??
                    DateTime.now()) ==
            DateFormat("dd/MMM/yyyy").format(day))
        .toList();
    if (hasThisDay.isEmpty) {
      return [];
    }
    return hasThisDay.first.serviceTime == null
        ? []
        : [hasThisDay.first.serviceTime ?? ServiceTimeResult()];
  }

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
                  left: 30, right: 30, top: 55, bottom: 30),
              width: MediaQuery.of(context).size.width / 2.5,
              height: sortCalenderView == SortCalenderView.schedule
                  ? MediaQuery.of(context).size.height / 1.6
                  : MediaQuery.of(context).size.height / 1.6,
              decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(30)),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      StreamBuilder<Object>(
                          stream: sortCalenderView ==
                                  SortCalenderView.addCleaner
                              ? cleanersController.selectedDateTime.stream
                              : sortCalenderView == SortCalenderView.schedule
                                  ? cleanersController
                                      .selectedScheduleDate.stream
                                  : cleanersController
                                      .selectedFilterDate.stream,
                          builder: (context, snapshot) {
                            return TableCalendar(
                              locale: isArabic
                                  ? arabicLocal.languageCode
                                  : englishLocal.languageCode,
                              calendarStyle: CalendarStyle(
                                todayDecoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  shape: BoxShape.circle,
                                ),
                                selectedDecoration: BoxDecoration(
                                  color: AppColors.primaryColor,
                                  shape: BoxShape.circle,
                                ),
                                isTodayHighlighted: sortCalenderView !=
                                    SortCalenderView.schedule,
                              ),
                              eventLoader: (day) => _getEventsForDay(day),
                              currentDay: sortCalenderView ==
                                      SortCalenderView.addCleaner
                                  ? cleanersController.selectedDateTime.value
                                  : sortCalenderView ==
                                          SortCalenderView.schedule
                                      ? null
                                      : cleanersController
                                          .selectedFilterDate.value,
                              headerStyle:
                                  const HeaderStyle(titleCentered: true),
                              onDaySelected: (selectedDay, focusedDay) {
                                if (sortCalenderView ==
                                    SortCalenderView.addCleaner) {
                                  cleanersController.selectedDateTime.value =
                                      focusedDay;
                                } else if (sortCalenderView !=
                                    SortCalenderView.schedule) {
                                  cleanersController.selectedFilterDate.value =
                                      focusedDay;
                                  cleanersController.selectedFilterDateTitle
                                      .value = DateFormat(
                                          'dd/MMM/yyyy',
                                          isArabic
                                              ? arabicLocal.languageCode
                                              : englishLocal.languageCode)
                                      .format(focusedDay);
                                } else {
                                  var hasEvent = _getEventsForDay(focusedDay);
                                  if (hasEvent.isNotEmpty) {
                                    eventDay = focusedDay;
                                    cleanersController
                                        .selectedTimeService.value = hasEvent;
                                  } else {
                                    cleanersController
                                        .selectedTimeService.value = [];
                                  }
                                }
                              },
                              daysOfWeekVisible: false,
                              focusedDay: sortCalenderView ==
                                      SortCalenderView.addCleaner
                                  ? cleanersController.selectedDateTime.value
                                  : sortCalenderView ==
                                          SortCalenderView.schedule
                                      ? cleanersController
                                          .selectedScheduleDate.value
                                      : cleanersController
                                          .selectedFilterDate.value,
                              firstDay: DateTime.utc(1980),
                              lastDay: DateTime(2100),
                              daysOfWeekStyle: const DaysOfWeekStyle(),
                              availableCalendarFormats: const {
                                CalendarFormat.month: '',
                              },
                            );
                          }),
                      const SizedBox(
                        height: 40,
                      ),
                      sortCalenderView == SortCalenderView.schedule
                          ? StreamBuilder(
                              stream:
                                  cleanersController.selectedTimeService.stream,
                              builder: (context, snapshot) {
                                return cleanersController
                                        .selectedTimeService.isEmpty
                                    ? Container()
                                    : AvailableTimeSection(
                                        sortAvailableTime:
                                            SortAvailableTime.calendardialog,
                                        selectedTimeSlot: eventDay,
                                        orderController: ordersController,
                                        serviceTimeSlotList: cleanersController
                                            .selectedTimeService,
                                      );
                              })
                          : Container(),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          sortCalenderView == SortCalenderView.schedule
                              ? Container()
                              : CustomButton(
                                  borderRadius: 4,
                                  titleColor: AppColors.primaryColor,
                                  width: MediaQuery.of(context).size.width / 7,
                                  height: 44,
                                  type: CustomButtonType.bordered,
                                  title: 'Cancel'.tr,
                                  onTap: () {
                                    context.popRoute();
                                    sortCalenderView ==
                                            SortCalenderView.addCleaner
                                        ? cleanersController.selectedDateTime
                                            .value = DateTime.now()
                                        : sortCalenderView ==
                                                SortCalenderView.schedule
                                            ? cleanersController
                                                .selectedScheduleDate
                                                .value = DateTime.now()
                                            : cleanersController
                                                .selectedFilterDate
                                                .value = DateTime.now();
                                  },
                                  containerColor: AppColors.primaryColor),
                          const SizedBox(
                            width: 14,
                          ),
                          sortCalenderView == SortCalenderView.schedule
                              ? StreamBuilder<Object>(
                                  stream: cleanersController
                                      .currentTimeBooked.stream,
                                  builder: (context, snapshot) {
                                    return CustomButton(
                                        borderRadius: 4,
                                        titleColor: cleanersController
                                                    .currentTimeBooked.value !=
                                                (-1)
                                            ? AppColors.whiteColor
                                            : AppColors.primaryColor,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                7,
                                        height: 44,
                                        type: cleanersController
                                                    .currentTimeBooked.value !=
                                                (-1)
                                            ? CustomButtonType.filled
                                            : CustomButtonType.bordered,
                                        title: 'Done'.tr,
                                        onTap: () {
                                          context.popRoute();
                                        },
                                        containerColor: AppColors.primaryColor);
                                  })
                              : StreamBuilder<Object>(
                                  stream: cleanersController
                                      .selectedDateTime.stream,
                                  builder: (context, snapshot) {
                                    return CustomButton(
                                        borderRadius: 4,
                                        titleColor: AppColors.primaryColor,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                7,
                                        height: 44,
                                        type: CustomButtonType.bordered,
                                        title: 'Done'.tr,
                                        onTap: () {
                                          context.popRoute();
                                        },
                                        containerColor: AppColors.primaryColor);
                                  })
                        ],
                      )
                    ]),
              ),
            ),
            isArabic
                ? Positioned(
                    left: 30,
                    top: 30,
                    child: GestureDetector(
                        onTap: () {
                          context.popRoute();
                        },
                        child: SvgPicture.asset(AppAssets.close)),
                  )
                : Positioned(
                    right: 30,
                    top: 30,
                    child: GestureDetector(
                        onTap: () {
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

class Event {
  final String title;

  const Event(this.title);

  @override
  String toString() => title;
}

enum SortCalenderView { filter, addCleaner, schedule }
