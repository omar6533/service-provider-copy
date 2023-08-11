// ignore_for_file: deprecated_member_use

import 'package:cloundry_care/app/modules/cleaners/widgets/calendar_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../shared/custom_button.dart';
import '../../../../shared/custom_text_filed.dart';
import '../../../../util/constant/app_assets.dart';
import '../../../../util/constant/app_colors.dart';
import '../controllers/cleaners_controller.dart';
import 'date_of_birth_section.dart';

class FilterSection extends StatelessWidget {
  final CleanersController cleanersController;

  const FilterSection({
    super.key,
    required this.cleanersController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
      margin: const EdgeInsets.only(top: 30, bottom: 5, left: 28, right: 28),
      height: 240,
      width: MediaQuery.of(context).size.width / 1.26,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.borderColor.withOpacity(0.4))),
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Expanded(
              child: CustomTextField(
                  hintStyle: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: AppColors.textFieldColor.withOpacity(0.5),
                      ),
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    color: AppColors.textFieldColor.withOpacity(0.5),
                  ),
                  hintText: 'Placeholder'.tr,
                  controller: cleanersController.placeHolderController,
                  onChanged: (p0) {},
                  title: 'Search'.tr),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      'Gender'.tr,
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(color: AppColors.greyColor),
                    ),
                  ),
                  StreamBuilder<Object>(
                      stream: cleanersController.genderFilterName.stream,
                      builder: (context, snapshot) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 17),
                          height: 48,
                          width: 400,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: AppColors.borderColor,
                            ),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              icon: Padding(
                                padding: const EdgeInsets.only(right: 0),
                                child: SvgPicture.asset(
                                  AppAssets.arrowDown,
                                  color: AppColors.greyColor,
                                  width: 16,
                                  height: 7,
                                ),
                              ),
                              iconSize: 16,
                              isDense: true,
                              hint: SizedBox(
                                // width: width,
                                child: Text(
                                    cleanersController.genderFilterName.isEmpty
                                        ? 'Gender'.tr
                                        : cleanersController
                                            .genderFilterName.value,
                                    style: cleanersController
                                            .genderFilterName.isEmpty
                                        ? Theme.of(context)
                                            .textTheme
                                            .labelMedium
                                            ?.copyWith(
                                              color: AppColors.textFieldColor
                                                  .withOpacity(0.5),
                                            )
                                        : Theme.of(context)
                                            .textTheme
                                            .labelMedium
                                            ?.copyWith(
                                                color: AppColors.blackColor)),
                              ),
                              onChanged: (value) {
                                cleanersController.genderFilterName.value =
                                    value ?? "";
                              },
                              items: cleanersController.genderList
                                  .map(
                                    (e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        );
                      }),
                ],
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: DateOfBirthSection(
                cleanersController: cleanersController,
                sortCalenderView: SortCalenderView.filter,
              ),
            ),
          ]),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomButton(
                  icon: AppAssets.resetIcon,
                  containerColor: AppColors.textFieldColor,
                  titleColor: AppColors.textFieldColor,
                  width: 144,
                  borderRadius: 8,
                  title: 'Reset'.tr,
                  onTap: () {
                    cleanersController.resetfilterData();
                    cleanersController.isFiltered.value = false;
                  },
                  type: CustomButtonType.bordered,
                  height: 48),
              const SizedBox(
                width: 10,
              ),
              CustomButton(
                  titleColor: AppColors.whiteColor.withOpacity(0.8),
                  width: 144,
                  borderRadius: 8,
                  title: 'Apply'.tr,
                  onTap: () {
                    cleanersController.filterCleaner();
                  },
                  type: CustomButtonType.filled,
                  height: 48)
            ],
          )
        ],
      ),
    );
  }
}
