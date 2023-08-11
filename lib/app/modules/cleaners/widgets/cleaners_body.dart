import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../shared/custom_button.dart';
import '../../../../util/constant/app_assets.dart';
import '../../../../util/constant/app_colors.dart';
import '../controllers/cleaners_controller.dart';
import 'add_cleaner_dialog.dart';
import 'cleaners_table.dart';
import 'filter_section.dart';

class CleanersBody extends StatelessWidget {
  final CleanersController cleanersController;

  const CleanersBody({
    super.key,
    required this.cleanersController,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 40),
        child: StreamBuilder<Object>(
            stream: cleanersController.isFiltered.stream,
            builder: (context, snapshot) {
              return Container(
                padding: const EdgeInsets.all(33),
                margin: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width / 1.25,
                height: 800,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.whiteColor),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Cleaners'.tr,
                              style: TextStyle(
                                  fontFamily: GoogleFonts.ubuntu().fontFamily,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.primaryColor),
                            ),
                            cleanersController.filterData.isEmpty
                                ? Container()
                                : const SizedBox(
                                    height: 7,
                                  ),
                            cleanersController.filterData.isEmpty
                                ? Container()
                                : Text(
                                    '${'Total:'.tr} ${cleanersController.filterData.length} ${'Clients'.tr}',
                                    style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.ubuntu().fontFamily,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.greyColor),
                                  )
                          ],
                        ),
                        Row(
                          children: [
                            CustomButton(
                              titleColor: AppColors.greyColor,
                              image: AppAssets.filterIcon,
                              title: 'Filter'.tr,
                              onTap: () {
                                if (cleanersController.isFiltered.isTrue) {
                                  cleanersController.isFiltered.value = false;
                                } else if (cleanersController
                                    .isFiltered.isFalse) {
                                  cleanersController.isFiltered.value = true;
                                }
                              },
                              borderRadius: 8,
                              type: CustomButtonType.bordered,
                              containerColor: AppColors.borderColor,
                              height: 48,
                              width: 113,
                            ),
                            const SizedBox(
                              width: 14,
                            ),
                            CustomButton(
                              titleColor: AppColors.whiteColor,
                              icon: AppAssets.addIcon,
                              title: 'Add Cleaner'.tr,
                              onTap: () {
                                addCleanerDialog(context, cleanersController);
                              },
                              borderRadius: 8,
                              type: CustomButtonType.filled,
                              containerColor: AppColors.primaryColor,
                              height: 48,
                              width: 176,
                            )
                          ],
                        )
                      ],
                    ),
                    cleanersController.isFiltered.isTrue
                        ? FilterSection(cleanersController: cleanersController)
                        : Container(),
                    CleanersTable(cleanersController: cleanersController),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
