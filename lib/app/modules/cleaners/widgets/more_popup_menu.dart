import 'package:cloundry_care/app/modules/cleaners/widgets/calendar_dialog.dart';
import 'package:cloundry_care/app/modules/dashboard/controllers/booking_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../util/constant/app_assets.dart';
import '../../../../util/constant/app_colors.dart';
import '../controllers/cleaners_controller.dart';
import 'add_cleaner_dialog.dart';

class MorePopupMenu extends StatelessWidget {
  final BuildContext context;
  final Map currentItem;

  final CleanersController cleanersController;
  BookingController bookingController = Get.put(BookingController());

  MorePopupMenu({
    super.key,
    required this.context,
    required this.cleanersController,
    required this.currentItem,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      splashRadius: 20,
      onSelected: (value) async {
        if (value == "Edit".tr) {
          addCleanerDialog(
            context,
            cleanersController,
            currentItem: currentItem,
          );
        } else if (value == "Schedule".tr) {
          await Future.wait([
            cleanersController.getScheduleForSpEmployee(context, currentItem),
            bookingController.getAllServiceTime(context),
          ]);

          calendarDialog(context, SortCalenderView.schedule);
        }
      },
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(
            value: 'Schedule'.tr,
            child: Row(
              children: [
                SvgPicture.asset(
                  AppAssets.calendarIcon,
                  color: AppColors.lightGreyColor,
                ),
                const SizedBox(
                  width: 7,
                ),
                Text(
                  'Schedule'.tr,
                  style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: GoogleFonts.ubuntu().fontFamily),
                ),
              ],
            ),
          ),
          PopupMenuItem(
            value: "Edit".tr,
            child: Row(
              children: [
                SvgPicture.asset(
                  AppAssets.trashIcon,
                  color: AppColors.lightGreyColor,
                ),
                const SizedBox(
                  width: 7,
                ),
                Text(
                  "Edit".tr,
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: GoogleFonts.ubuntu().fontFamily,
                  ),
                ),
              ],
            ),
          ),
        ];
      },
      child: Icon(
        Icons.more_horiz,
        color: AppColors.lightGreyColor,
      ),
    );
  }
}
