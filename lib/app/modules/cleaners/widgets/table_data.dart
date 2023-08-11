// ignore_for_file: deprecated_member_use

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../shared/custom_button.dart';
import '../../../../util/constant/app_assets.dart';
import '../../../../util/constant/app_colors.dart';
import '../controllers/cleaners_controller.dart';
import 'more_popup_menu.dart';

class TableData extends DataTableSource {
  CleanersController cleanersController = Get.put(CleanersController());
  // Generate some made-up data

  final BuildContext context;

  TableData(this.context);

  @override
  bool get isRowCountApproximate => false;
  @override
  int get rowCount => cleanersController.filterData.length;
  @override
  int get selectedRowCount => 0;
  @override
  DataRow getRow(int index) {
    return DataRow(cells: [
      DataCell(
        StreamBuilder<Object>(
            stream: cleanersController.selectedIndex.stream,
            builder: (context, snapshot) {
              return GestureDetector(
                onTap: () {
                  if (!cleanersController.selectedIndex.contains(index)) {
                    cleanersController.selectedIndex.add(index);
                  } else {
                    cleanersController.selectedIndex
                        .removeWhere((element) => element == index);
                  }
                },
                child: !cleanersController.selectedIndex.contains(index)
                    ? const Icon(
                        Icons.check_box_outline_blank,
                        color: Color(0xffbfbfbf),
                        size: 20,
                      )
                    : const Icon(
                        Icons.check_box,
                        size: 20,
                      ),
              );
            }),
      ),
      DataCell(Text(cleanersController.filterData[index]['#'].toString())),
      DataCell(Text(
        cleanersController.filterData[index]["Name"],
        style: TextStyle(
          color: AppColors.greyColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: GoogleFonts.ubuntu().fontFamily,
        ),
      )),
      DataCell(Text(
        cleanersController.filterData[index]["Iqama No."].toString(),
        style: TextStyle(
          color: AppColors.greyColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: GoogleFonts.ubuntu().fontFamily,
        ),
      )),
      DataCell(Center(
        child: Text(
          cleanersController.filterData[index]["Email"].toString(),
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.greyColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
            fontFamily: GoogleFonts.ubuntu().fontFamily,
          ),
        ),
      )),
      DataCell(Text(
        cleanersController.filterData[index]["Phone No."].toString() ?? 'hello',
        style: TextStyle(
          color: AppColors.greyColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: GoogleFonts.ubuntu().fontFamily,
        ),
      )),
      DataCell(Text(
        cleanersController.filterData[index]["Gender"].toString(),
        style: TextStyle(
          color: AppColors.greyColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: GoogleFonts.ubuntu().fontFamily,
        ),
      )),
      DataCell(Text(
        cleanersController.filterData[index]["Age"].toString(),
        style: TextStyle(
          color: AppColors.greyColor,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: GoogleFonts.ubuntu().fontFamily,
        ),
      )),
      DataCell(Center(
        child: StreamBuilder<Object>(
            stream: cleanersController.activeIndex.stream,
            builder: (context, snapshot) {
              return FlutterSwitch(
                inactiveColor: AppColors.detailTitleColor,
                activeColor: AppColors.activatedColor,
                width: 40,
                height: 20.0,
                valueFontSize: 12.0,
                toggleSize: 15.0,
                value: cleanersController.activeIndex.contains(index),
                onToggle: (val) {
                  if (cleanersController.activeIndex.contains(index)) {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return Dialog(
                          insetPadding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            width: 360,
                            height: 360,
                            decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(30)),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Stack(
                                    children: [
                                      Image.asset(AppAssets.container),
                                      Positioned(
                                          right: 0,
                                          left: 0,
                                          bottom: 0,
                                          top: 0,
                                          child: Image.asset(
                                              AppAssets.trashColoredImage))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  Text(
                                    'You are about to deactivated a\ncleaner'
                                        .tr,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: AppColors.greyColor,
                                        fontFamily:
                                            GoogleFonts.ubuntu().fontFamily,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Are you sure!'.tr,
                                    style: TextStyle(
                                        color: AppColors.greyColor,
                                        fontFamily:
                                            GoogleFonts.ubuntu().fontFamily,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      StreamBuilder<Object>(
                                          stream: cleanersController
                                              .activeIndex.stream,
                                          builder: (context, snapshot) {
                                            return CustomButton(
                                                width: 136,
                                                height: 48,
                                                titleColor:
                                                    AppColors.whiteColor,
                                                type: CustomButtonType.filled,
                                                title: 'Sure'.tr,
                                                onTap: () {
                                                  cleanersController
                                                      .updateCleanerActivation(
                                                    context,
                                                    false,
                                                    cleanersController
                                                        .filterData[index],
                                                  );
                                                },
                                                containerColor:
                                                    AppColors.primaryColor);
                                          }),
                                      const SizedBox(
                                        width: 16,
                                      ),
                                      CustomButton(
                                          width: 136,
                                          height: 48,
                                          titleColor: AppColors.primaryColor,
                                          type: CustomButtonType.bordered,
                                          title: 'Cancel'.tr,
                                          onTap: () {
                                            context.popRoute();
                                          },
                                          containerColor:
                                              AppColors.primaryColor)
                                    ],
                                  )
                                ]),
                          ),
                        );
                      },
                    );
                    //deactivatedDialog
                  } else {
                    cleanersController.updateCleanerActivation(
                      context,
                      true,
                      cleanersController.filterData[index],
                    );
                  }
                },
              );
            }),
      )),
      DataCell(
        MorePopupMenu(
          context: context,
          cleanersController: cleanersController,
          currentItem: cleanersController.filterData[index],
        ),
      )
    ]);
  }
}
