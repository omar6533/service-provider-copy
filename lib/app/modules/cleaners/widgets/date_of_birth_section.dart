// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../util/constant/app_colors.dart';
import '../../../../util/constant/app_keys.dart';
import '../../../../util/constant/extensions.dart';
import '../controllers/cleaners_controller.dart';
import 'calendar_dialog.dart';

class DateOfBirthSection extends StatelessWidget {
  final CleanersController cleanersController;
  final SortCalenderView sortCalenderView;
  double? width;
  DateOfBirthSection({
    Key? key,
    required this.cleanersController,
    required this.sortCalenderView,
    this.width,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            'Date of Birth'.tr,
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: AppColors.greyColor),
          ),
        ),
        StreamBuilder<Object>(
            stream: sortCalenderView == SortCalenderView.addCleaner
                ? cleanersController.selectedDateTime.stream
                : cleanersController.selectedFilterDateTitle.stream,
            builder: (context, snapshot) {
              return GestureDetector(
                onTap: () {
                  cleanersController.selectDate(
                    context,
                    (dateSelected) {
                      if (sortCalenderView == SortCalenderView.addCleaner) {
                        cleanersController.selectedDateTime.value =
                            dateSelected ?? DateTime.now();
                      } else {
                        cleanersController.selectedFilterDate.value =
                            dateSelected ?? DateTime.now();
                        cleanersController
                            .selectedFilterDateTitle.value = DateFormat(
                                'dd/MMM/yyyy',
                                isArabic
                                    ? arabicLocal.languageCode
                                    : englishLocal.languageCode)
                            .format(
                                cleanersController.selectedFilterDate.value);
                      }
                      cleanersController.currentTimeBooked.value = (-1);
                    },
                  );
                },
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    width: width ?? double.infinity,
                    height: 48,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.borderColor)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RotatedBox(
                          quarterTurns: isArabic ? 2 : 0,
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: AppColors.greyColor,
                            size: 18,
                          ),
                        ),
                        Text(
                          sortCalenderView != SortCalenderView.addCleaner
                              ? cleanersController
                                      .selectedFilterDateTitle.isEmpty
                                  ? 'Select Date of Birth'.tr
                                  : DateFormat(
                                          'dd/MMM/yyyy',
                                          isArabic
                                              ? arabicLocal.languageCode
                                              : englishLocal.languageCode)
                                      .format(cleanersController
                                          .selectedFilterDate.value)
                                      .toString()
                                      .tr
                              : DateFormat(
                                      'dd/MMM/yyyy',
                                      isArabic
                                          ? arabicLocal.languageCode
                                          : englishLocal.languageCode)
                                  .format(sortCalenderView ==
                                          SortCalenderView.addCleaner
                                      ? cleanersController
                                          .selectedDateTime.value
                                      : cleanersController
                                          .selectedFilterDate.value)
                                  .toString()
                                  .tr,
                          style:
                              Theme.of(context).textTheme.labelMedium?.copyWith(
                                    color: AppColors.textFieldColor,
                                  ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: AppColors.greyColor,
                          size: 18,
                        ),
                      ],
                    )),
              );
            })
      ],
    );
  }
}
